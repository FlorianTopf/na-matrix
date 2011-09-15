<?php
/**
 * @file ObservatoryEditAllOld.php
 * @version $Id$
 * @author Florian Topf, Robert Stöckler
 *
 *
 */

print "<input type='hidden' name='page' value='edit'>" . LF ;
//print "<input type='hidden' name='action' value='loadTemp'>" . LF ;
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
	print "<h3>There are no OLD Observatory entries " .
		"to edit.</h3>" . LF;
}
else
{
	print "<table class='viewall'>" . LF;
    print "<caption>To edit & save an OLD Observatory entry please click on the Observatory name</caption>" . LF;
    print "<tr><th>NAME</th><th>INSTITUTION</th></tr>" . LF;

    $index = 0;
    foreach ($res as $entry)
    {
    	if($index % 2) 
			print "<tr class='even'>";
		else
			print "<tr class='odd'>";
    	print "<td><a title='Click to edit' class='hand' " .
              "href='index.php?page=add&action=loadOldObs&id=" . $entry["id"] . "&res_type=obs"  .
              "'>" . $entry["Name"] . "</a></td>";
        print "<td>" . $entry["Institution"] . "</td>";
        print "</tr>" . LF;
        
        $index++;
    }
	print "</table>" . LF;
}

?>