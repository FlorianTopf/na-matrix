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
	$content = "<b>";
	($mandatory == true) ? ($content .= "<font color='#ff0000'>*</font>") : ($content .= "&nbsp;&nbsp;");
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

/** @todo not to override EPN framework 
 * 	@todo if we want to have more written in the option name than 2 items */
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
		    $content .= ">" . $items[$column[0]][$key] . " (" . $items[$column[1]][$key] . ")" . "</option>" . LF;
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


function printSelectListFromArray($name, $value, $items, $column)
{
	print makeSelectListFromArray_($name, $value, $items, $column);
}


function printSimpleSelectListFromArray($name, $value, $items)
{
	print makeSimpleSelectListFromArray_($name, $value, $items);
}


function printInputTitleCol($title, $info=NULL, $mandatory=false)
{
	print makeTAG("td", makeInputTitle($title, $info, $mandatory), "align='left'");
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


function printCheckBoxRow($title, $name, $value, $info=NULL, $mandatory=false)
{
	print "<tr>";
	printInputTitleCol($title, $info, $mandatory);
	printCheckBoxCol($name, $value);
	print "</tr>" . LF;
}


function printmultipleCheckBoxRow($name, $items)
{
	print "<tr>";
	$iterator = 0;
	foreach ($items as $key => $value)
	{
		print "<td align='center'><b>". ucfirst(str_replace("_", " ", $key)) . "&nbsp;</b>" .
		makeCheckBox($name . "_" . $iterator, $value);
    	print "</td>" . LF;
    	$iterator++;
	}
	print "</tr>" . LF;
}

/** @todo improve this a bit */
function printInputTextRow($title, $name, $value, $size=80, $info=NULL, $class=NULL, $mandatory=false) 
{	
	print "<tr>";
	printInputTitleCol($title, $info, $mandatory);
	printInputTextCol($name, $value, $size, NULL, $class, NULL);
    print "</tr>" . LF;
}

/** @todo improve this a bit */
function printInputTextfieldRow($title, $name, $value, $cols=60, $rows=2, $info=NULL, $mandatory=false) 
{	
	print "<tr>";
	printInputTitleCol($title, $info, $mandatory);	
	print "<td align='left'><textarea name='{$name}'" .
	  	" cols='{$cols}' rows='{$rows}'>{$value}</textarea></td></tr>" . LF;
}

/** @todo improve this a bit */
function printSelectListRowFromArray($title, $name, $value, $items, $column, $info=NULL, $mandatory=false, $options=array())
{
	print "<tr>";
	printInputTitleCol($title, $info, $mandatory);	
	printSelectListColFromArray($name, $value, $items, $column, $options);
	print "</tr>" . LF;
}

/** @todo improve this a bit */
function printTypeSelectListFromArray($title, $name, $value, $items, $column, $info=NULL, $mandatory=false, $options=array())
{
	print "<tr>";
	printInputTitleCol($title, $info, $mandatory);
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
function printBigSelectListFromArray($title, $name, $value, $items, $column, $info=NULL, $mandatory=false, $options=array())
{
	print "<tr>";
	printInputTitleCol($title, $info, $mandatory);	
	print "<td align='left'><select name='{$name}' multiple='multiple' size='10'>" . LF;
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

function printEditAllTable($name, $resources, $type)
{
	if (empty($resources))
		print "<h3>There are no {$name} entries to edit.</h3>" . LF;	
	else
	{
		print "<table class='viewall'>" . LF;
    	print "<caption>To edit please click on the {$name} name</caption>" . LF;
    	print "<tr><th>NAME</th><th>CREATION DATE</th><th>MODIFICATION DATE</th></tr>" . LF;
    	foreach ($resources as $entry)
    	{
   			print "<tr align='center'>";
    		print "<td><a title='Click to edit' class='hand' " .
              	"href='index.php?page=add&amp;action=edit&amp;id=" . $entry["id"] . "&amp;res_type={$type}" .
              	"'>" . $entry["name"] . "</a></td>";
        	print "<td>" . $entry["creation_date"] . "</td>";
        	print "<td>" . $entry["modification_date"] . "</td>";
        	print "</tr>" . LF;
    	}
    	print "</table>" . LF;
	}	
}


?>