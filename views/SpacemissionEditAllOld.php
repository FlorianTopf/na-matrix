<?php
/**
 * @file SpacemissionEditAllOld.php
 * @version $Id$
 * @author Florian Topf, Robert Stöckler
 *
 *
 */

print "<INPUT type='hidden' name='page' value='edit'>" . LF ;
//print "<INPUT type='hidden' name='action' value='loadTemp'>" . LF ;
//show_message();

$res = array();
$query = "SELECT id, Mission, Agency FROM maintable ORDER BY Mission ASC";
$_spacemission = ModelDAO::getFromName("Spacemission");
$dbOldSpa = $_spacemission->getDbOldSpa();
$result = $dbOldSpa->query($query);
//$result = $linkTemp->query($query);
while ($row = mysqli_fetch_array($result, MYSQLI_ASSOC))
	$res[] = $row;
mysqli_free_result($result);

if (count($res) == 0)
{
	print "<CENTER><H3>There are no OLD Spacemission entries " .
		"to edit.</H3></CENTER>" . LF;
}
else
{
	print "<CENTER><P><TABLE class='viewall'>" . LF;
    print "<CAPTION><H3 align='center'>To edit & save an OLD Spacemission Entry please click on the Spacemission name.</H3></CAPTION>" . LF;
    print "<TR><TH>MISSION</TH><TH>AGENCY</TH></TR>" . LF;

    foreach ($res as $entry)
    {
    	print "<TR align='center'>";
    	print "<TD><A title='Click to edit' class='hand' " .
              "href='index.php?page=add&action=loadOldSpa&id=" . $entry["id"] . "&res_type=spa"  .
              "'>" . $entry["Mission"] . "</A></TD>";
        print "<TD>" . $entry["Agency"] . "</TD>";
        print "</TR>" . LF;
    }
	print "</TABLE></P></CENTER>" . LF;
}

?>