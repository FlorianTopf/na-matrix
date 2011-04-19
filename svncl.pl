#!/usr/bin/perl -w

# generate a GNU compilant ChangeLog file from the svn log messages.
#
# usage: svncl.pl [xmllog]
#
# Input is read from stdin or from given file. A svn log file in xml format
# and verbose settings is expected.
# Text enclosed in '[]' at the beginning of a log messages is discarded, as
# this is supposed to be the filename which will be included anyway.
# If the contributers full name or email adress is known to the programm
# it is included in the log entry as well.
#
# Example:
# svn log -v --xml | svncl.pl > ChangeLog
#
# The resulting file is not exactly in GNU format. Differences:
# - If the full name is known, the login name is added in parenthes, separated
#   from the full name by one space.
# - for multi line messages the following lines are indended by 6 space, not
#   4 like the gnu format. It just looks cleaner to me this way.
#


###################################################
#
#  Copyright 2010 Michael Mayer <michael-mayer@gmx.de>
#
#  This programm is free software; you can redistribute it and/or modify it
#  under the terms of the GNU General Public License as published by the
#  Free Software Foundation; either version 3 of the License, or (at your
#  option) any later version.
#
#  svncl is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#  GNU General Public License for more details.
#
#  You should have received a copy of the GNU General Public License
#  along with this program; if not, see <http://www.gnu.org/licenses/>.
#
###################################################


use strict;

package HTMLStrip;
use base "HTML::Parser";
use HTML::Entities;


# Reads a configfile (if any). Tries to open these locations:
# /etc/svncl, ~/.subversion/svncl, ~/.svnclrc
#
# Format of the configfile:
#
# Lines starting with '#' and empty lines are ignored.
#
# realname <svnname>=<Real Name  <mail@adress>>
#   by GNU conventions only one space between the name parts
#   exactly two spaces between the name and the email adress.
#   login names are converted to lower case first for the hash key.
#
# ignore <filename>
#   ignores log entries for the given file name (case insensitive). Useful
#   for generated files. Don't flood your changelog with entries about the
#   changes in the changelog.
#
# example of a useful minimum config file:
#
# realname mmayer=Michael Mayer  <michael-mayer@gmx.de>
# ignore changelog
#

sub read_config
{
    my ($self) = @_;
    my $key;
    my $value;
    my $svnname;
    my $fullname;

    foreach my $configfile ("/etc/svncl", glob("~/.subversion/svncl"), glob("~/.svnclrc"))
    {
        next if (! -r $configfile);
        open(my $fh, "<", $configfile);
        while (<$fh>)
        {
            s/^\s*//;		# remove blanks at line start
            s/\s*$//;		# remove trailing blanks
            next if (/^$/);	# ignore empty lines.
            next if (/^#/);	# ignore comment lines.
            ($key, $value) = split(/\s+/,$_,2);
            $key = lc($key);	# convert to lowercase
            if ($key eq "realname")
            {
                ($svnname, $fullname) = split(/\s*=\s*/, $value, 2);
                $self->{fullname}->{lc($svnname)} = $fullname;
            }
            elsif ($key eq "ignore")
            {
                $self->{ignore}->{lc($value)} = 1;
            }
        }
        close($fh);
    }
}


##
# indent ($text, $width, $prefix, $indent)
#

# Break a given text into an array of lines of a maximum length. The very
# first line is prefixed by $prefix, all the following lines are prefixed by
# $indent. The text is brocken into single words before reformatting into
# one continues block. Multiple whitespaces and empty lines will get lost.
#
# The given $width is exceeded only for very long words in the input $text.
#
# The result is returned as an array of lines, no CR at the line ends.

sub indent
{
    my ($text, $width, $prefix, $indent) = @_;
    my @out;

    my $line     = $prefix;
    my $cntwords = 0;
    foreach my $word (split(/\s+/, $text))
    {
        if ((length($line) + length($word)) < $width)
        {
            # add one more word to the line, insert one space between words.
            $line .= ($cntwords ? " " : "") . $word;
            $cntwords++;
        }
        else
        {
            # line already filled up. Start a new one.
            push(@out, $line);
            $line     = $indent . $word;
            $cntwords = 1;
        }
    }
    push(@out, $line) if ($cntwords);    # don't forget the very last line

    return @out;
}


##
# flush_msg($self): output one full record.
#

sub flush_msg
{
    my ($self) = @_;

    return if (!$self->{changes});


    # print the header line
    print "$self->{date}  ";
    if (defined($self->{fullname}->{lc($self->{author})}))
    {
        # include full name if known.
        print $self->{fullname}->{lc($self->{author})};
    }
    else
    {
        print "$self->{author}";
    }
    print "\n\n";

    for (my $i=0; $i<$self->{changes}; $i++)
    {
        foreach my $line (
            indent(
                join(", ", sort keys %{$self->{files}->[$i]})    # all affected files
                  . ": $self->{msg}->[$i]",
                80,                                              # line width
                "    * ",                                        # prefix for first line
                "      "                                         # indent for all following lines
            )
          )
        {
            print "$line\n";
        }
        print "\n";
    }

    undef(@{$self->{files}});
    undef(@{$self->{msg}});
    $self->{changes} = 0;
}



sub start
{
    my ($self, $tagname, $attr, $attrseq, $origtext) = @_;

    $self->{inside}->{$tagname}++;

    if ($tagname eq 'log')
    {
        # do initialisation. There should be an easier way.
        $self->{author}  = "";
        $self->{date}    = "";
        $self->{changes} = 0;

        # read email adress db.
        read_config($self);
    }
    if ($tagname eq 'logentry')
    {
        # init the message string to avoid undef warnings
        $self->{msg}->[ $self->{changes} ] = "";
    }
}


sub end
{
    my ($self, $tagname, $origtext) = @_;

    $self->{inside}->{$tagname}--;

    if ($tagname eq 'logentry')
    {
        $self->{changes}++;    # one more change set to print
    }
    elsif ($tagname eq 'log')
    {
        # at the end of the log, flush the last entry
        flush_msg($self);
    }
}

sub text
{
    my ($self, $origtext) = @_;

    $origtext =~ s/^\s*//;
    $origtext =~ s/\s*$//;
    return if (!$origtext);

    if ($self->{inside}->{author})
    {
        # do not combine changes from different authors
        flush_msg($self) if ($self->{author} ne $origtext);
        $self->{author} = $origtext;
    }
    elsif ($self->{inside}->{date})
    {
        $origtext =~ /([\d-]+)T/;

        # do not combine changes done at different dates
        flush_msg($self) if ($self->{date} ne $1);
        $self->{date} = $1;
    }
    elsif ($self->{inside}->{msg})
    {
        $origtext =~ s/^\[[^\]]*\]\s//;
        $self->{msg}->[ $self->{changes} ] .= decode_entities($origtext);
    }
    elsif ($self->{inside}->{path})
    {
        $origtext =~ m|(.*)/([^/]+)$|;
        # use only the filename, ignore the path.
        # mark the file as used.
        $self->{files}->[ $self->{changes} ]->{"$2"}++
          if (!defined($self->{ignore}->{lc($2)}));
    }
}


my $p = new HTMLStrip;
# parse line-by-line, rather than the whole file at once
while (<>)
{
    $p->parse($_);
}
# flush and parse remaining unparsed HTML
$p->eof;
