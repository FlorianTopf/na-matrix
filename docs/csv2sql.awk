#!/usr/bin/awk -f
BEGIN {FS = "," ; RS = "\r"}
{print "(" $1 ", '" $2 "', '" $3 "'),"} 
