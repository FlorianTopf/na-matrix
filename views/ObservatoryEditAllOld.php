<?php
/**
 * @file ObservatoryEditAllOld.php
 * @version $Id$
 * @author Florian Topf, Robert Stöckler
 *
 *
 */

print "<INPUT type='hidden' name='page' value='edit'>" . LF ;
//print "<INPUT type='hidden' name='action' value='loadTemp'>" . LF ;
//show_message();

$res = array();
$query = "SELECT id, Name, Institution FROM maintable ORDER BY Name ASC";
$_observatory = ModelDAO::getFromName("Observatory");
$dbOldObs = $_observatory->getDbOldObs();
$result = $dbOldObs->query($query);
//$result = $linkTemp->query($query);
while ($row = mysqli_fetch_array($result, MYSQLI_ASSOC))
	$res[] = $row;
mysqli_free_result($result);

if (count($res) == 0)
{
	print "<CENTER><H3>There are no OLD Observatory entries " .
		"to edit.</H3></CENTER>" . LF;
}
else
{
	print "<CENTER><P><TABLE class='viewall'>" . LF;
    print "<CAPTION><H3 align='center'>To edit & save an OLD Observatory Entry please click on the Observatory name.</H3></CAPTION>" . LF;
    print "<TR><TH>NAME</TH><TH>INSTITUTION</TH></TR>" . LF;

    foreach ($res as $entry)
    {
    	print "<TR align='center'>";
    	print "<TD><A title='Click to edit' class='hand' " .
              "href='index.php?page=add&action=loadOldObs&id=" . $entry["id"] . "&res_type=obs"  .
              "'>" . $entry["Name"] . "</A></TD>";
        print "<TD>" . $entry["Institution"] . "</TD>";
        print "</TR>" . LF;
    }
	print "</TABLE></P></CENTER>" . LF;
}

?>