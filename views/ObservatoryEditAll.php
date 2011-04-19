<?php 

  print "<INPUT type='hidden' name='page' value='edit'>" . LF ;
  $link = dbiSelect();
  //show_message();

  //Observatories
  $res = array();
  $query = "SELECT id, name, creation_date, modification_date FROM observatories ORDER BY modification_date DESC";
  $result = mysqli_query($link, $query);
  while ($row = mysqli_fetch_array($result, MYSQLI_ASSOC))
    $res[] = $row;
  mysqli_free_result($result);

  if (count($res) == 0)
  {
    print "<CENTER><H3>There are no Observatory entries " .
          "to edit.</H3></CENTER>" . LF;
  }
  else
  {
  	print "<CENTER><P><TABLE border='1' cellpadding='4' width='100%' class='rtable'>" . LF;
    print "<CAPTION><H3 align='center'>To edit please click on the Observatory name.</H3></CAPTION>" . LF;
    print "<TR><TH>NAME</TH><TH>CREATION DATE</TH><TH>MODIFICATION DATE</TH></TR>" . LF;

    //print "<H3>Click on a the name to edit an Observatory entry</H3>" . LF;
    foreach ($res as $entry)
    {
    	print "<TR align='center'>";
    	print "<TD><A title='Click to edit' class='hand' " .
              "href='index.php?page=add&action=edit&id=" . $entry["id"] . "&res_type=obs"  .
              "'>" . $entry["name"] . "</A></TD>";
        print "<TD>" . $entry["creation_date"] . "</TD>";
        print "<TD>" . $entry["modification_date"] . "</TD>";
        print "</TR>" . LF;
    }
	print "</TABLE></P></CENTER>" . LF;
  }
  
  mysqli_close($link);
  
?>