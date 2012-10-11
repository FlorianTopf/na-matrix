<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Strict//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>NA1 Country Maps</title>
<script type="text/javascript"
   src="http://maps.googleapis.com/maps/api/js?sensor=true">
</script>
<script type="text/javascript" src="../lib/js/jquery-1.7.1.min.js"></script>
<script type="text/javascript" src="mapFunctions.js"></script>
</head>
<body>

<form action="<?php print $_SERVER["PHP_SELF"]; ?>" id="main_form" enctype="multipart/form-data" method="post">

<?php 
if(isset($_POST["country_filter"]))
	$filter = $_POST["country_filter"];
else 
	$filter = "ALL";
?>

<p>Filter by Country:</p>
<select name='country_filter' onchange='this.form.submit()'>
<option value='ALL' <?php if ($filter == "14") print " selected";?>>ALL</option>
<option value='14' <?php if ($filter == "14") print " selected";?>>Austria</option>
<option value='21' <?php if ($filter == "21") print " selected";?>>Belgium</option>
<option value='54' <?php if ($filter == "54") print " selected";?>>Croatia</option>
<option value='56' <?php if ($filter == "56") print " selected";?>>Czech Republic</option>
<option value='57' <?php if ($filter == "57") print " selected";?>>Denmark</option>
<option value='72' <?php if ($filter == "72") print " selected";?>>Finland</option>
<option value='73' <?php if ($filter == "73") print " selected";?>>France</option>
<option value='81' <?php if ($filter == "81") print " selected";?>>Germany</option>
<option value='84' <?php if ($filter == "84") print " selected";?>>Greece</option>
<option value='97' <?php if ($filter == "97") print " selected";?>>Hungary</option>
<option value='103' <?php if ($filter == "103") print " selected";?>>Italy</option>
<option value='145' <?php if ($filter == "145") print " selected";?>>Netherlands</option>
<option value='155' <?php if ($filter == "155") print " selected";?>>Norway</option>
<option value='165' <?php if ($filter == "165") print " selected";?>>Poland</option>
<option value='166' <?php if ($filter == "166") print " selected";?>>Portugal</option>
<option value='170' <?php if ($filter == "170") print " selected";?>>Romania</option>
<option value='171' <?php if ($filter == "171") print " selected";?>>Russia</option>
<option value='192' <?php if ($filter == "192") print " selected";?>>Spain</option>
<option value='199' <?php if ($filter == "199") print " selected";?>>Sweden</option>
<option value='200' <?php if ($filter == "200") print " selected";?>>Switzerland</option>
<option value='215' <?php if ($filter == "215") print " selected";?>>Ukraine</option>
<option value='217' <?php if ($filter == "217") print " selected";?>>United Kingdom</option>
</select>

<div id='numObservatories'></div>

<div id='map' style='width: 775px; height: 450px'></div>
<?php print "<script>$(document).trigger('mapIsReady', '" . $filter . "');</script>" ?>

</form>

</body>
</html>