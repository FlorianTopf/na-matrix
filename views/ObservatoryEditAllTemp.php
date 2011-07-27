<?php
/**
 * @file ObservatoryEditAllTemp.php
 * @version $Id$
 * @author Florian Topf, Robert Stöckler
 *
 *
 */

print "<input type='hidden' name='page' value='edit'>" . LF ;
//print "<input type='hidden' name='action' value='loadTemp'>" . LF ;
//show_message();

//Observatories only!
$res = array();
$query = "SELECT id, name, creation_date, modification_date FROM observatories ORDER BY modification_date DESC";
$_observatory = ModelDAO::getFromName("Observatory");
$dbTemp = $_observatory->getDbTemp();
$result = $dbTemp->query($query);
//$result = $linkTemp->query($query);
while ($row = mysqli_fetch_array($result, MYSQLI_ASSOC))
	$res[] = $row;
mysqli_free_result($result);

if (count($res) == 0)
{
	print "<center><h3>There are no USER Observatory entries " .
		"to edit.</h3></center>" . LF;
}
else
{
	print "<center><p><table class='viewall'>" . LF;
    print "<caption><h3 align='center'>To edit & save a USER Questionnaire Entry please click on the Observatory name.</h3></caption>" . LF;
    print "<tr><th>NAME</th><th>CREATION DATE</th></tr>" . LF;

    //print "<h3>Click on a the name to edit an Observatory entry</h3>" . LF;
    $index = 0;
    foreach ($res as $entry)
    {
    	if($index % 2) 
			print "<tr class='even'>";
		else
			print "<tr class='odd'>";
    	print "<td><a title='Click to edit' class='hand' " .
              "href='index.php?page=add&action=loadTemp&id=" . $entry["id"] . "&res_type=obs"  .
              "'>" . $entry["name"] . "</a></td>";
        print "<td>" . $entry["creation_date"] . "</td>";
        print "</tr>" . LF;
        
        $index++;
    }
	print "</table></p></center>" . LF;
}

?>