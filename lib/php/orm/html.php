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
// HTML TABLE TAGS functions
// *****************************
function makeTR($content, $args="") 
{
    return makeTAG("TR",$content,$args);
}
 
  
// *****************************
// HTML FORM FUNCTIONS
// ***************************** 

function makeInputTitle($title, $info=NULL, $mandatory=false)
{
	$content = "<B>";
	($mandatory == true) ? ($content .= "<FONT color='red'>*</FONT>") : ($content .= "&nbsp;&nbsp;");
	$content .= "&nbsp;" . $title . "</B>&nbsp;" . $info;
	return $content;
}

/** @todo not to override EPN framework */
function makeInputText_($name, $value, $size=10, $class=NULL, $info=NULL)
{
    $content = "<INPUT name='" . $name . "' ";
	if($class != NULL) $content .=  "class='" . $class . "' ";
 	$content .= "value='" . $value . "' size='" . $size . "'>";
    if($info != NULL ) $content .= "&nbsp;<B>" . $info . "</B>"; 
    return $content;
}

function makeCheckBox($name, $value=false)
{
	$content = "<INPUT name='" . $name . "' type='checkbox' value='1' ";
	if($value) $content .= "checked='checked'";
    $content .= "'>";
    return $content;
}

/** @todo not to override EPN framework */
function makeSelectListFromArray_($name, $value, $items, $column, $options=array())
{
	$content =  "<SELECT name='". $name ."'>" . LF;
	foreach($options as $option)
		$content .= $option . LF;
	foreach($items['id'] as $key => $item)
	{
		$content .= "<OPTION value='" . $item . "'";
		if ($item == $value) $content .= " selected";
    	$content .= ">" . $items[$column][$key] . "</OPTION>" . LF;
	}
	$content .= "</SELECT>";
	return $content;
}


function makeSimpleSelectListFromArray_($name, $value, $items)
{
	$content =  "<SELECT name='". $name ."'>" . LF;
	foreach($items as $item)
	{
		$content .= "<OPTION value='" . $item . "'";
		if ($item == $value) $content .= " selected";
    	$content .= ">" . $item . "</OPTION>" . LF;
	}
	$content .= "</SELECT>";
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
	print makeTAG("TD", makeInputTitle($title, $info, $mandatory), "align='left'");
}


function printInputTextCol($name , $value, $size=10, $class=NULL) 
{
	print makeTAG("TD", makeInputText_($name, $value, $size, $class), "align='left'");
}

function printCheckBoxCol($name, $value)
{
	print makeTAG("TD", makeCheckBox($name, $value));
}


function printSelectListColFromArray($name, $value, $items, $column, $options=array())
{
	print makeTAG("TD", makeSelectListFromArray_($name, $value, $items, $column, $options), "align='left'");	
}


function printCheckBoxRow($title, $name, $value, $info=NULL, $mandatory=false)
{
	print "<TR>";
	printInputTitleCol($title, $info, $mandatory);
	printCheckBoxCol($name, $value);
	print "</TR>" . LF;
}


function printmultipleCheckBoxRow($name, $items)
{
	print "<TR>";
	$iterator = 0;
	foreach ($items as $key => $value)
	{
		print "<TD align='center'><B>". ucfirst(str_replace("_", " ", $key)) . "&nbsp;</B>" .
		makeCheckBox($name . "_" . $iterator, $value);
    	print "</TD>" . LF;
    	$iterator++;
	}
	print "</TR>" . LF;
}


function printInputTextRow($title, $name, $value, $size=80, $info=NULL, $class=NULL, $mandatory=false) 
{	
	print "<TR>";
	printInputTitleCol($title, $info, $mandatory);
	printInputTextCol($name, $value, $size, $class);
    print "</TR>" . LF;
}

/** @todo improve this a bit */
function printInputTextfieldRow($title, $name, $value, $cols=60, $rows=2, $info=NULL, $mandatory=false) 
{	
	print "<TR>";
	printInputTitleCol($title, $info, $mandatory);	
	print "<TD align='left'><TEXTAREA name='{$name}' type='text'" .
	  	" cols='{$cols}' rows='{$rows}'>{$value}</TEXTAREA></TD></TR>" . LF;
}

/** @todo improve this a bit */
function printSelectListRowFromArray($title, $name, $value, $items, $column, $info=NULL, $mandatory=false, $options=array())
{
	print "<TR>";
	printInputTitleCol($title, $info, $mandatory);	
	printSelectListColFromArray($name, $value, $items, $column, $options);
	print "</TR>" . LF;
}

/** @todo improve this a bit */
function printTypeSelectListFromArray($title, $name, $value, $items, $column, $info=NULL, $mandatory=false, $options=array())
{
	print "<TR>";
	printInputTitleCol($title, $info, $mandatory);
	print "<TD align='left'><SELECT name='{$name}'>" . LF;
	if(array_key_exists("top", $options))
		print $options["top"];
	foreach($items['id'] as $key => $item)
	{
		print "<OPTION value='" . $item . "'";
		if ($item == $value) print " selected";
    	print ">" . $items[$column][$key] . "</OPTION>" . LF;
	}
	if(array_key_exists("bottom", $options))
		print $options["bottom"];
	print "</SELECT></TD></TR>" . LF;
}

/** @todo improve this a bit */
function printBigSelectListFromArray($title, $name, $value, $items, $column, $info=NULL, $mandatory=false, $options=array())
{
	print "<TR>";
	printInputTitleCol($title, $info, $mandatory);	
	print "<TD align='left'><SELECT name='{$name}' multiple size='10'>" . LF;
	foreach($options as $option)
		print $option;
	foreach($items['id'] as $key => $item)
	{
		print "<OPTION value='" . $item . "'";
		//PROOF IF THIS IS AN ARRAY!
    	if(is_array($value))
    		if(in_array($item, $value))
        		print " selected";
    	print ">" . $items[$column][$key] . "</OPTION>" . LF;
	}
	print "</SELECT></TD></TR>" . LF;
}


?>