<?php
/**
 * @file SpacemissionEditAllOld.php
 * @version $Id$
 * @author Florian Topf, Robert Stöckler
 *
 *
 */

print "<input type='hidden' name='page' value='edit'>" . LF ;
//print "<input type='hidden' name='action' value='loadTemp'>" . LF ;
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
	print "<center><h3>There are no OLD Spacemission entries " .
		"to edit.</h3></center>" . LF;
}
else
{
	print "<center><p><table class='viewall'>" . LF;
    print "<caption><h3 align='center'>To edit & save an OLD Spacemission Entry please click on the Spacemission name.</H3></CAPTION>" . LF;
    print "<tr><th>MISSION</th><th>AGENCY</th></tr>" . LF;

    $index = 0;
    foreach ($res as $entry)
    {
    	if($index % 2) 
			print "<tr class='even'>";
		else
			print "<tr class='odd'>";
    	print "<td><a title='Click to edit' class='hand' " .
              "href='index.php?page=add&action=loadOldSpa&id=" . $entry["id"] . "&res_type=spa"  .
              "'>" . $entry["Mission"] . "</a></td>";
        print "<td>" . $entry["Agency"] . "</td>";
        print "</tr>" . LF;
        
        $index++;
    }
	print "</table></p></center>" . LF;
}

?>