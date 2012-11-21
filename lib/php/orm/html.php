<?php
/**
 * @file html.php
 * @version $Id$
 * @author Florian Topf
 */

function isValidURL($url)
{
	return preg_match('|^http(s)?://[a-z0-9-]+(.[a-z0-9-]+)*(:[0-9]+)?(/.*)?$|i', $url);
}

function url_exists($url)
{
  	$handle = @fopen($url, "r");
	if ($handle === false)
		return false;
	fclose($handle);
	return true;
}

function autolink($string)
{
	$content_array = explode(" ", $string);
	$output = '';

	foreach($content_array as $content)
	{
		//starts with http://
		if(substr($content, 0, 7) == "http://")
		$content = '<a href="' . $content . '" target="_blank">' . $content . '</a>';

		//starts with www.
		if(substr($content, 0, 4) == "www.")
		$content = '<a href="http://' . $content . '" target="_blank">' . $content . '</a>';

		$output .= " " . $content;
	}

	$output = trim($output);
	return $output;
}
  
function clean_num($num)
{
  	return rtrim(rtrim($num, '0'), '.');
}

/** html newline */
function nl($howMany=1) 
{
	for ($i=0; $i<$howMany; $i++)
	{
		echo "<br/>";
	}
}

/** html whitespace */
function ws($howMany=1)
{
	for ($i=0; $i<$howMany; $i++)
	{
		echo "&nbsp;";
	}
}

// *****************************
// HTML GENERAL TAG function
// *****************************


function makeTAG($TAG, $content, $args="") 
{
    return ('<'.$TAG.' '.$args.'>'.$content.'</'.$TAG.'>');
}

// *****************************
// HTML TAG TAGS functions
// *****************************


function makeTR($content, $args="") 
{
    return makeTAG("tr",$content,$args);
}
 
  
// *****************************
// HTML FORM FUNCTIONS
// ***************************** 


function makeInputTitle($title, $info=NULL, $mandatory=false)
{
	($mandatory == true) ? ($content = "<b class='red'>*</b><b>") : ($content = "<b>&nbsp;&nbsp;");
	$content .= "&nbsp;" . $title . "</b>&nbsp;" . $info;
	return $content;
}

/** @todo not to override EPN framework */
function makeInputText_($name, $value, $size=10, $class=NULL, $info=NULL)
{
    $content = "<input name='" . $name . "' ";
	if($class != NULL) $content .=  "class='" . $class . "' ";
 	$content .= "value='" . $value . "' size='" . $size . "'/>";
    if($info != NULL ) $content .= "&nbsp;<b>" . $info . "</b>"; 
    return $content;
}

function makeCheckBox($name, $value=false)
{
	$content = "<input name='" . $name . "' type='checkbox' value='1' ";
	if($value) $content .= "checked='checked'";
    $content .= "/>";
    return $content;
}

/** @todo not to override EPN framework */
function makeSelectListFromArray_($name, $value, $items, $column, $options=array())
{
	$content =  "<select name='". $name ."'>" . LF;
	foreach($options as $option)
		$content .= $option . LF;
	foreach($items['id'] as $key => $item)
	{
		$content .= "<option value='" . $item . "'";
		if ($item == $value) $content .= " selected='selected'";
		if(is_array($column))
			$content .= ">" . $items[$column[0]][$key] . ", " . $items[$column[1]][$key] . "</option>" . LF;
		    //$content .= ">" . $items[$column[0]][$key] . " (" . $items[$column[1]][$key] . ")" . "</option>" . LF;
		else
    		$content .= ">" . $items[$column][$key] . "</option>" . LF;
	}
	$content .= "</select>";
	return $content;
}


function makeSimpleSelectListFromArray_($name, $value, $items)
{
	$content =  "<select name='". $name ."'>" . LF;
	foreach($items as $item)
	{
		$content .= "<option value='" . $item . "'";
		if ($item == $value) $content .= " selected='selected'";
    	$content .= ">" . $item . "</option>" . LF;
	}
	$content .= "</select>";
	return $content;
}


//function printInputTitle($title, $info=NULL, $mandatory=false)
//{
//	print makeInputTitle($title, $info, $mandatory);
//}


function printInputText($name, $value, $size=10, $class=NULL, $info=NULL)
{
	print makeInputText_($name, $value, $size, $class, $info);
}


function printCheckbox($name, $value=false)
{
	print makeCheckBox($name, $value);
}


function printSelectListFromArray($name, $value, $items, $column, $options=array())
{
	print makeSelectListFromArray_($name, $value, $items, $column, $options);
}


function printSimpleSelectListFromArray($name, $value, $items)
{
	print makeSimpleSelectListFromArray_($name, $value, $items);
}

// ADDED HAND CLASS!
function printInputTitleCol($title, $info=NULL, $mandatory=false, $tooltip="")
{
	print makeTAG("td", makeInputTitle($title, $info, $mandatory), "align='left' class='help' title='" . $tooltip . "'");
}


function printInputTextCol($name, $value, $size=10, $args="", $class=NULL, $info=NULL) 
{
	print makeTAG("td", makeInputText_($name, $value, $size, $class, $info), $args);
}

function printCheckBoxCol($name, $value)
{
	print makeTAG("td", makeCheckBox($name, $value));
}


function printSelectListColFromArray($name, $value, $items, $column, $options=array())
{
	print makeTAG("td", makeSelectListFromArray_($name, $value, $items, $column, $options), "align='left'");	
}


function printCheckBoxRow($title, $name, $value, $info=NULL, $mandatory=false, $tooltip="")
{
	print "<tr>";
	printInputTitleCol($title, $info, $mandatory, $tooltip);
	printCheckBoxCol($name, $value);
	print "</tr>" . LF;
}


function printmultipleCheckBoxRow($name, $items)
{
	print "<tr>";
	$iterator = 0;
	foreach ($items as $key => $value)
	{
		print "<td align='center'><b>". ucwords(str_replace("_", " ", $key)) . "&nbsp;&nbsp;</b>" .
		makeCheckBox($name . "_" . $iterator, $value);
    	print "</td>" . LF;
    	$iterator++;
	}
	print "</tr>" . LF;
}

/** @todo improve this a bit 
 *  @todo we have to rearrange the various options you may add
 * */
function printInputTextRow($title, $name, $value, $size=80, $info=NULL, $class=NULL, $mandatory=false, $tooltip="") 
{	
	print "<tr>";
	printInputTitleCol($title, $info, $mandatory, $tooltip);
	printInputTextCol($name, $value, $size, NULL, $class, NULL);
    print "</tr>" . LF;
}

/** @todo improve this a bit 
 *  @todo we have to rearrange the various options you may add
 * */
function printInputTextRowValid($title, $name, $value, $size=80, $info=NULL, $class=NULL, $mandatory=false, $tooltip="") 
{	
	print "<tr>";
	printInputTitleCol($title, $info, $mandatory, $tooltip);
	printInputTextCol($name, $value, $size, NULL, $class, NULL);
	print "<label for='{$name}' class='error' style='display: none;'>Please enter a float number!</label>";
    print "</tr>" . LF;
}

/** @todo improve this a bit */
function printInputTextfieldRow($title, $name, $value, $cols=65, $rows=4, $info=NULL, $mandatory=false, $tooltip="") 
{	
	print "<tr>";
	printInputTitleCol($title, $info, $mandatory, $tooltip);	
	print "<td align='left'><textarea name='{$name}'" .
	  	" cols='{$cols}' rows='{$rows}'>{$value}</textarea></td></tr>" . LF;
}

/** @todo improve this a bit */
function printSelectListRowFromArray($title, $name, $value, $items, $column, $info=NULL, $mandatory=false, $options=array(), $tooltip="")
{
	print "<tr>";
	printInputTitleCol($title, $info, $mandatory, $tooltip);	
	printSelectListColFromArray($name, $value, $items, $column, $options);
	print "</tr>" . LF;
}

/** @todo improve this a bit */
function printTypeSelectListFromArray($title, $name, $value, $items, $column, $info=NULL, $mandatory=false, $options=array(), $tooltip="")
{
	print "<tr>";
	printInputTitleCol($title, $info, $mandatory, $tooltip);
	print "<td align='left'><select name='{$name}'>" . LF;
	if(array_key_exists("top", $options))
		print $options["top"];
	foreach($items['id'] as $key => $item)
	{
		print "<option value='" . $item . "'";
		if ($item == $value) print " selected='selected'";
    	print ">" . $items[$column][$key] . "</option>" . LF;
	}
	if(array_key_exists("bottom", $options))
		print $options["bottom"];
	print "</select></td></tr>" . LF;
}

/** @todo improve this a bit */
function printBigSelectListFromArray($title, $name, $value, $items, $column, $info=NULL, $mandatory=false, $options=array(), $tooltip="")
{
	print "<tr>";
	printInputTitleCol($title, $info, $mandatory, $tooltip);	
	print "<td align='left'><select name='{$name}' class='multiselect' multiple='multiple' size='15'>" . LF;
	foreach($options as $option)
		print $option;
	foreach($items['id'] as $key => $item)
	{
		print "<option value='" . $item . "'";
		//PROOF IF THIS IS AN ARRAY!
    	if(is_array($value))
    		if(in_array($item, $value))
        		print " selected='selected'";
    	print ">" . $items[$column][$key] . "</option>" . LF;
	}
	print "</select></td></tr>" . LF;
}


function printAddRemoveButton($count, $amount, $class, $table=true)
{
	if($table)
	{
		if($count == (count($amount) - 1))
			print "<table class='{$class}_button'><tr><td><a class='add_{$class}' href=''>Add " . ucfirst($class) . "</a></td></tr></table>";
		else
    		print "<table class='{$class}_button'><tr><td><a class='remove_{$class}' href=''>Delete " . ucfirst($class) . "</a></td></tr></table>";
	}
	else
	{
		print "<td>";
		if($count == (count($amount) - 1))
			print "<a class='add_{$class}' href=''>Add</a>";
		else
    		print "<a class='remove_{$class}' href=''>Del</a>";	
    	print "</td>";
	}
}


function printActionButton($action)
{
	//nl();
	//Define the action buttons
	print "<div class='actionbutton'>" . LF;
	//IF ACTION IS ADD
	if ($action == "add")
		print "<input type='submit' name='push' value='Add Entry' class='submit'/>" . LF;
	//IF ACTION IS EDIT
	else if ($action == "edit")
		print "<input type='submit' name='push' value='Update Entry'/>" . LF;
	print "</div>" . LF;
}


/** @todo maybe make with other function */
//function printFilterOptions($title, $name, $value, $items)
//{
//	print "<tr><td class='title' colspan='2'><b>Filter by " . $title "</b></td>";
//	print "<td class='filter' colspan='4'><select name='" . $name . "' onchange='this.form.submit()'>" . LF;
//	print "<option value=''>ALL</option>";
//	foreach($research_areas['id'] as $key => $item)
//	{
//		print "<option value='" . $value . "'";
//		if(isset($filters["research_area"]))
//			if ($value == $filters["research_area"]) print " selected";
//   		print ">" . $research_areas['name'][$key] . "</option>" . LF;
//	}
//	print "</select></td></tr>" . LF; 
//}

//function makeSimpleSelectListFromArray_($name, $value, $items)
//{
//	$content =  "<select name='". $name ."'>" . LF;
//	foreach($items as $item)
//	{
//		$content .= "<option value='" . $item . "'";
//		if ($item == $value) $content .= " selected='selected'";
//    	$content .= ">" . $item . "</option>" . LF;
//	}
//	$content .= "</select>";
//	return $content;
//}


?>