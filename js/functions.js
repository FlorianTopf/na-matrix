/**
 * @file functions.js
 * @version $Id$
 * @author Florian Topf
 *
 * @todo refactor every jquery function (see JQUERY API http://api.jquery.com/)
 * @todo there is a certain problem with validating IDs, which lets us only providing them AFTER
 * 		 dynamic rows routines
 * @todo improve regular expressions where possible
 * @todo check every .each function and return false, cause it will break iteration, 
 * 		 see: http://api.jquery.com/jQuery.each/
 * @todo we need to clean up the JS libraries, since it gets more and more complicated
 */
//-----------------------------------------------------------------------------------------------------------
//OPENWIN for VIEW single resource
function openwin(content)
{
  W=window.open(content,'RESULTS','status=yes,menubar=yes,hotkeys=no,resizable=yes,scrollbars=yes,width=650,height=600');
  W.focus();

  return false;
}

function showUrlInDialog(url) {
	var tag = $("<div></div>");
	$.ajax({
		url: url,
		success: function(data) {
		  tag.html(data).dialog({
			  width: 650,
			  height: 600,
			  modal: true
		  }).dialog('open');
		}
	});
}

//CONFIRMATION DIALOG for stupid admins
function show_confirm() {
	var r=confirm("Do you really want to delete this entry?");
	if (r==true)
		return true;
	else
		return false;
}

//-----------------------------------------------------------------------------------------------------------
//HELPER FUNCTIONS for AUTOCOMPLETER
function split( val ) {
	return val.split( /,\s*/ );
}

function extractLast( term ) {
	return split( term ).pop();
}

 

//-----------------------------------------------------------------------------------------------------------
//HERE ALL JQUERY STUFF STARTS
$(document).ready(function(){
	// add parser through the tablesorter addParser method 
	$.tablesorter.addParser({ 
	    // set a unique id 
	    id: 'diameters', 
	    is: function(s) { 
	        // return false so this parser is not auto detected 
	        return false; 
	    }, 
	    format: function(s) { 
	        // we devide the string by whitespace
	    	// the first value must be a number if a diameter is given
	    	var tokens = s.split(" ");
	    	if(parseFloat((tokens[0]) == 'NaN') || (tokens[0] == ''))
	    		return parseFloat('0.0');
	    	else
	    		return parseFloat(tokens[0]);
	    }, 
	    // set type, either numeric or text 
	    type: 'numeric' 
	});
	
	//sorting function for browse all table
	$('#browsesorter').tablesorter({
		widgets: ["zebra"],
		widgetOptions : {
			zebra : ["odd", "even"]
		},
		headers: {
			3: {
				sorter: false
			},
			4: {
				sorter: 'diameters'
			}
		}
	});
	
	$('#editsorter').tablesorter({
		widgets: ["zebra"],
		widgetOptions : {
			zebra : ["odd", "even"]
		}
	});
	
	//prevent that a user hits enter when in form (for add/edit and browse)
	$('.rfield input').keydown(function(event){
	    if(event.keyCode == 13) {
	      event.preventDefault();
	      return false;
	    }
	  });
	
	$('.page input').keydown(function(event){
	    if(event.keyCode == 13) {
	      event.preventDefault();
	      return false;
	    }
	  });
	
	// Man kann beim name autocompleter auch enter drücken (observatory, sowie space mission)
	$('.filter input').keydown(function(event){
	    if(event.keyCode == 13) {
	      $("#main_form").submit();
	      return false;
	    }
	  });
	
	/** @todo here we will introduce a lot of unobstrusive design additions */
	$('button.submit').button();
	/** @todo does not work because of "add other" options */
	//$('select').selectmenu();
	// Adding fancy classes from JQUERY UI
	$('.rfield').addClass('ui-widget ui-widget-content ui-corner-all');
	$('.rfield legend').addClass('ui-widget ui-widget-header ui-corner-all');
//	$('.rfield input').addClass('ui-widget-content');
	
	//NEW MULTISELECT FUNCTIONALITY
	$('.multiselect').multiselect();
	
	//enabling tooltips (maybe improve that!
	$('#middle-marker *').tooltip({
	showURL: false,
	showBody: " - "
	});
	
	//warning if javascript off
	$('p.warning').remove();
	//hide all .error labels, if costum labels are inserted in html
	//$('.error').hide();
	$('table.instrument').hide();
		
	$('a.toggle_instrument').click(function() {
		$(this).parent().next('table.instrument').toggle();
		
		var text = $(this).text();
		$(this).text(
			text == "Show Input Fields" ? "Hide Input Fields" : "Show Input Fields");
		return false;
	});
	
	//add custom rule for research areas (maxlength 50)
	jQuery.validator.addClassRules("research_area", { required: true, maxlength: 50 });
	//add custom rule for telescope types (maxlength 50)
	jQuery.validator.addClassRules("telescope_type", { required: true, maxlength: 50 });
	//add custom rule for antenna types (maxlength 50)
	jQuery.validator.addClassRules("antenna_type", { required: true, maxlength: 50 });
	//add custom rule for instrument types (maxlength 50)
	jQuery.validator.addClassRules("instrument_type", { required: true, maxlength: 50 });
	//add custom rule for science goals (maxlength 50)
	jQuery.validator.addClassRules("science_goal", { required: true, maxlength: 50 });
	//add custom rule for science goals (maxlength 5)
	jQuery.validator.addClassRules("science_goal_acro", { required: true, maxlength: 5 });

	//VALIDATION ROUTINE FROM JQUERY
	//Including all necessary rules and messages
	$("#main_form").validate({
		rules: {
				add_obs_name: {
					required: true,
					//calling an external php file for checking the name
					remote: "js/observatories.php" },
				add_obs_founded: {
      				//gets required when something is entered in this field
					required: function(element) {
      			        return $("input.add_obs_founded").val() != ''; },
      				minlength: 4,
      				digits: true },
      			add_obs_web_address : {
      				url: true },
      			add_obs_country_id: {
      				required: true },
      			add_obs_email: {
      				email: true },
      			add_obs_sealevel: {
      				number: true
      			},
      			"add_obs_res_are_ids[]": {
      				required: true,
      				digits: true },
      			add_res_are: {
      				required: true },
      			// only the first telescope is mandatory
      			"add_obs_telescope_name[0]": {
      				required: true },
      			"add_obs_telescope_type_id[0]": {
      				required: true },
      			"add_obs_diameter[0]": {
      				required: true },
      			"add_obs_wavelength[0]": {
      				required: true },
      			add_obs_max_frames: {
      				number: true },
      			add_obs_max_exposure: {
      				number: true },
      			add_obs_min_exposure: {
      				number: true },
      			add_spa_name: {
      				required: true,
					//calling an external php file for checking the name
					remote: "js/spacemissions.php" },
				add_spa_agency_id: {
					required: true },
				add_spa_launch: {
					required: true,
					dateISO: true },
				add_spa_death: {
					dateISO: true },
				add_spa_web_address: {
					url: true },
				"add_spa_res_are_ids[]": {
	      			required: true,
	      			digits: true },
	      		"add_spa_target_ids[]": {
	      			required: true,
	      			digits: true
	      		}
		},
		messages: {
				add_obs_name: {
					required: "Missing Observatory name!",
					remote: "Observatory name already existing!" },
				add_obs_founded: "Enter a correct year!",
				add_obs_web_address: "Please enter a valid URL!",
				add_obs_country_id: "Please choose a country!",
				add_obs_email: "Please enter a valid email!",
				add_obs_sealevel: "Please enter a number!",
				"add_obs_res_are_ids[]": "Please choose research area(s)!",
				"add_obs_telescope_name[0]": "Please provide at least one telescope!",
				"add_obs_telescope_type_id[0]": "Please select a telescope type!",
				"add_obs_diameter[0]": {
					required: "Please enter the size of the telescope!"},
				"add_obs_wavelength[0]": "Please enter a wavelength region!",
				add_obs_max_frames: "Please enter a number!",
				add_obs_max_exposure: "Please enter a time in seconds!",
				add_obs_min_exposure: "Please enter a time in seconds!",
				add_spa_name: {
					required: "Missing Space Mission name!",
					remote: "Space Mission name already existing!" },
				add_spa_agency_id: "Please choose an agency!",
				add_spa_launch: {
					required: "Please enter a launch date!",
					dateISO: "Please enter a valid date YYYY-MM-DD!" },
				add_spa_death: "Please enter a valid date YYYY-MM-DD!",
				add_spa_web_address: "Please enter a valid URL!",
				"add_spa_res_are_ids[]": "Please choose research area(s)!",
				"add_spa_target_ids[]": "Please choose target(s)!"
		}
	});
	
//-------------------------------------------------------------------------------------------------
//-------------------------------------------------------------------------------------------------
/** @todo here we may try to improve the selection with asynchronous request */	
//	$("input#add_res_type").change(function() {
//		alert('YUHU');
//	    // we want to store the values from the form input box, then send via ajax below  
//	    var fname     = $('#fname').attr('value');   
//	        $.ajax({  
//	            type: "POST",  
//	            url: "ajax.php",  
//	            data: "fname="+ fname +"& lname="+ lname,  
//	            success: function(){  
//	                $('form#submit').hide(function(){$('div.success').fadeIn();});  
//	  
//	            }  
//	        });  
//	    return false;  
//	});  
	
//-------------------------------------------------------------------------------------------------
//-------------------------------------------------------------------------------------------------
	
	//AUTOCOMPLETER FOR WAVELENGTH
	$.fn.wavelength_completer = function() {
		// don't navigate away from the field on tab when selecting an item
		$(this).bind( "keydown", function( event ) {
			if ( event.keyCode === $.ui.keyCode.TAB &&
					$( this ).data( "autocomplete" ).menu.active ) {
				event.preventDefault();
			}
		});
		$(this).autocomplete({
			source: function( request, response ) {
				$.getJSON( "js/wavelengthRanges.php", {
					term: extractLast( request.term )
				}, response );
			},
			search: function() {
				// custom minLength
				var term = extractLast( this.value );
				if ( term.length < 1 ) {
					return false;
				}
			},
			focus: function() {
				// prevent value inserted on focus
				return false;
			},
			select: function( event, ui ) {
				var terms = split( this.value );
				// remove the current input
				terms.pop();
				// add the selected item
				terms.push( ui.item.value );
				// add placeholder to get the comma-and-space at the end
				terms.push( "" );
				this.value = terms.join( ", " );
				return false;
			}
		});
	};
	
	//AUTOCOMPLETER FOR TELESCOPE NAME
	$.fn.telescope_completer = function() {
		// don't navigate away from the field on tab when selecting an item
		$(this).bind( "keydown", function( event ) {
			if ( event.keyCode === $.ui.keyCode.TAB &&
					$( this ).data( "autocomplete" ).menu.active ) {
				event.preventDefault();
			}
		});
		$(this).autocomplete({
			source: function( request, response ) {
				$.getJSON( "js/telescopeNames.php", {
					term: extractLast( request.term )
				}, response );
			},
			search: function() {
				// custom minLength
				var term = extractLast( this.value );
				if ( term.length < 1 ) {
					return false;
				}
			},
			focus: function() {
				// prevent value inserted on focus
				return false;
			}
		});
	};
	
	//AUTOCOMPLETER FOR INSTRUMENT NAME
	$.fn.instrument_completer = function() {
		// don't navigate away from the field on tab when selecting an item
		$(this).bind( "keydown", function( event ) {
			if ( event.keyCode === $.ui.keyCode.TAB &&
					$( this ).data( "autocomplete" ).menu.active ) {
				event.preventDefault();
			}
		});
		$(this).autocomplete({
			source: function( request, response ) {
				$.getJSON( "js/instrumentNames.php", {
					term: extractLast( request.term )
				}, response );
			},
			search: function() {
				// custom minLength
				var term = extractLast( this.value );
				if ( term.length < 1 ) {
					return false;
				}
			},
			focus: function() {
				// prevent value inserted on focus
				return false;
			}
		});
	};
	
//-------------------------------------------------------------------------------------------------
//-------------------------------------------------------------------------------------------------
	
	//DYNAMIC ROW ADDING FUNCTION for ADD "Instruments"
	$.fn.add_instrument = function(newInstrumentNum) {
		var addInstrument = $(this).parent().parent().find('fieldset.rfield:last');

        var newInstrument = addInstrument.clone();
            
        //remove any added new instrument types here after cloning
        if ($('a.remove_instrument_type').length>0) {
        	//we have to remove also the changed select/options  
        	$('a.remove_instrument_type', newInstrument).parent().parent().parent().find('option.other_instrument_type').
              after($("<OPTION class='add_instrument_type'></OPTION>").val("100000").html("Add other Instrument Type")).remove();
        	$('a.remove_instrument_type', newInstrument).parent().parent().remove();
        }
        
        $('input', newInstrument).val('');
        $('select', newInstrument).val('');
        $('textarea', newInstrument).val('');
        $("input[type='checkbox']", newInstrument).attr('checked', false);

        var inputs = new Array();
        var selects = new Array();
        var areas = new Array();
        var type_classes = new Array();
        $('input', addInstrument).each(function(i) {
        	inputs[i] = $(this).attr('name');
        });
        $('select', addInstrument).each(function(i) {
        	selects[i] = $(this).attr('name');
        });
        $('textarea', addInstrument).each(function(i) {
        	areas[i] = $(this).attr('name');
        });
        
		/** @todo THIS IS A NEW APPROACH TO GETTING ACTUAL NUMBER */
        var instrumentCount = inputs[0];
        //remove everything up to the last 0-9 (1 or more times)
		instrumentCount = instrumentCount.replace(/^.*\[(\d*)\]$/, '$1');
		if(newInstrumentNum <= instrumentCount)
			newInstrumentNum = ++instrumentCount;

        $('input', newInstrument).each(function(i) {
        	//remove trailing [0-9] with regexp
        	inputs[i] = inputs[i].replace(/^(.*)\[[0-9]\].*$/, '$1');
        	var newName = inputs[i] + '[' + newInstrumentNum + ']';
            $(this).attr('name', newName);
        });
        $('select', newInstrument).each(function(i) {
        	//remove trailing [0-9] with regexp
        	selects[i] = selects[i].replace(/^(.*)\[[0-9]\].*$/, '$1');
        	var newName = selects[i] + '[' + newInstrumentNum + ']';
            $(this).attr('name', newName);
        });
        $('textarea', newInstrument).each(function(i) {
        	//remove trailing [0-9] with regexp
        	areas[i] = areas[i].replace(/^(.*)\[[0-9]\].*$/, '$1');
        	var newName = areas[i] + '[' + newInstrumentNum + ']';
            $(this).attr('name', newName);
        });

        addInstrument.after(newInstrument);
        
        $('a.remove_instrument', newInstrument).click(function() {
//        	$(this).parent().parent().parent().
//        	parent().parent().remove();
        	var field = $(this).parent().parent();
        	
        	//if its the last one, just clear the fields
        	if(field.parent().find("table.instrument").length == 1)
        	{
    	        // clear lines of the last one!
    			var lastInstrument = field;
    	        //clear values for each input
    	        $('input', lastInstrument).val('');
    	        //clear value for each select
    	        $('select', lastInstrument).val('');
    	        //clear value for each textarea
    	        $('textarea', lastInstrument).val('');
    	        //clear value of each checkbox
    	        $("input[type='checkbox']", lastInstrument).attr('checked', false);
        	}
        	else
        		field.remove();
        	
            return false;
        });
        
        //DYNAMIC ROW ADDING ROUTINE for ADD "Other Instrument Type"
        var newInstrumentType = 0;
        $('option.add_instrument_type', newInstrument).click(function() {
        	newInstrumentType++;
        	$(this).add_instrument_type(newInstrumentType);
        	return false;
        });
        
		$('a.toggle_instrument', newInstrument).click(function() {
			$(this).parent().next('table.instrument').toggle();
			
			var text = $(this).text();
			$(this).text(
				text == "Show Input Fields" ? "Hide Input Fields" : "Show Input Fields");
			return false;
		});
		
		//CALLING AUTOCOMPLETER FOR WAVELENGTH
        $('input.wavelength', newInstrument).each(function() {
			$(this).wavelength_completer();
			return false;
		});
		
		//CALLING AUTOCOMPLETER FOR INSTRUMENT NAME
		$('input.instrument', newInstrument).each(function() {
			$(this).instrument_completer();
			return false;
		});
		
		//return new number of instruments
		return newInstrumentNum;
	};
	
	//DYNAMIC ROW ADDING FUNCTION FOR ADD "Scientific Contacts"
	$.fn.add_contact = function(newContactNum) {
		var addRow = $(this).parent().parent();

        var newRow = addRow.clone();
        $('input', newRow).val('');

        var names = new Array();
        $('input', addRow).each(function(i) {
        	names[i] = $(this).attr('name');
        });
        
		/** @todo THIS IS A NEW APPROACH TO GETTING ACTUAL NUMBER
		 *  newContactNum got obsolete, just return actual value */
        var contactCount = names[0];
        //remove everything up to the last 0-9 (1 or more times)
		contactCount = contactCount.replace(/^.*\[(\d*)\]$/, '$1');
		if(newContactNum <= contactCount)
			newContactNum = ++contactCount;

        $('td:first-child', newRow).html('<a href="" class="remove_contact">Del<\/a>');
        $('input', newRow).each(function(i) {
        	//remove trailing [0-9] with regexp
        	names[i] = names[i].replace(/^(.*)\[[0-9]\].*$/, '$1');
        	var newName = names[i] + '[' + newContactNum + ']';
            $(this).attr('name', newName);
        });
        addRow.after(newRow);

        $('a.remove_contact', newRow).click(function() {
            $(this).parent().parent().remove();
            //newContactNum--;
            return false;
        });
        
        //return new number of contacts
        return newContactNum;
	};
	
	//DYNAMIC ROW ADDING FUNCTION for ADD "Other Telescope Type"
	$.fn.add_telescope_type = function(newTelescopeType) {
		var TelescopeCount = $(this).parent().attr('name');
		$(this).parent().append($("<OPTION class='other_telescope_type' selected='selected'></OPTION>").
				val("100000").html("Other Telescope Type"));

		//remove everything before [0-9]
		TelescopeCount = TelescopeCount.replace(/^[^\[]*(\[.*)$/, '$1');

  		var strToAdd = '<tr><td>&nbsp;&nbsp;&nbsp;<a href="" class="remove_telescope_type">Delete<\/a></td>' +
  		'<td><b>New Telescope Type:&nbsp;</b>' +
  		'<input type="text" class="telescope_type" name="add_telescope_type' + TelescopeCount + '" size="40" value="" /></td></tr>';

  		$(this).closest('tr').after(strToAdd);
  		
  		//remove option (to prevent more than one type adding)
  		$(this).remove();
  			
		$('a.remove_telescope_type').click(function() {
            //adding another option (to prevent more than one type adding)
			$(this).parent().parent().parent().find('option.other_telescope_type').
            after($("<OPTION class='add_telescope_type'></OPTION>").val("100000").html("Add other Telescope Type")).remove();     
            $(this).parent().parent().remove();
            
    	    //recursive calling add_telescope_type again
            var newTelescopeType = 0;
    	    $('option.add_telescope_type').click(function() {
    	    	newTelescopeType++;
    	    	$(this).add_telescope_type(newTelescopeType);
    	    	return false;
    		});
            //newTelescopeType--;
            return false;
        });
	};
	
	//DYNAMIC ROW ADDING FUNCTION for ADD "Other Antenna Type"
	$.fn.add_antenna_type = function(newAntennaType) {
		var TelescopeCount = $(this).parent().attr('name');
		$(this).parent().append($("<OPTION class='other_antenna_type' selected='selected'></OPTION>").
				val("100000").html("Other Type"));

		//remove everything before [0-9]
		TelescopeCount = TelescopeCount.replace(/^[^\[]*(\[.*)$/, '$1');

  		var strToAdd = '<tr><td>&nbsp;&nbsp;&nbsp;<a href="" class="remove_antenna_type">Delete<\/a></td>' +
  		'<td><b>New Antenna Type:&nbsp;</b>' +
  		'<input type="text" class="antenna_type" name="add_antenna_type' + TelescopeCount + '" size="40" value="" /></td></tr>';

  		$(this).closest('tr').after(strToAdd);
  		
  		//remove option (to prevent more than one type adding)
  		$(this).remove();

		$('a.remove_antenna_type').click(function() {
            //adding another option (to prevent more than one type adding)
			$(this).parent().parent().parent().find('option.other_antenna_type').
            after($("<OPTION class='add_antenna_type'></OPTION>").val("100000").html("Add other Type")).remove();
            $(this).parent().parent().remove();
            
            //recursive calling add_antenna_type again
            var newAntennaType = 0;
            $('option.add_antenna_type').click(function() {
            	newAntennaType++;
            	$(this).add_antenna_type(newAntennaType);
            	return false;
        	});
            //newAntennaType--;
            return false;
        });
	};
	
	//DYNAMIC ROW ADDING FUNCTION for ADD "Other Instrument Type"
	$.fn.add_instrument_type = function(newInstrumentType) {
		var InstrumentCount = $(this).parent().attr('name');
		$(this).parent().append($("<OPTION class='other_instrument_type' selected='selected'></OPTION>").
				val("100000").html("Other Instrument Type"));
				
		//remove everything before [0-9]
		InstrumentCount = InstrumentCount.replace(/^[^\[]*(\[.*)$/, '$1');

  		var strToAdd = '<tr><td>&nbsp;&nbsp;&nbsp;<a href="" class="remove_instrument_type">Delete<\/a></td>' +
  		'<td><b>New Instrument Type:&nbsp;</b>' +
  		'<input type="text" class="instrument_type" name="add_instrument_type' + InstrumentCount + '" size="30" value="" /></td></tr>';

  		$(this).closest('tr').after(strToAdd);
  		
  		//remove option (to prevent more than one type adding)
  		$(this).remove();

		$('a.remove_instrument_type').click(function() {
            //adding another option (to prevent more than one type adding)
			$(this).parent().parent().parent().find('option.other_instrument_type').
            after($("<OPTION class='add_instrument_type'></OPTION>").val("100000").html("Add other Instrument Type")).remove();
            $(this).parent().parent().remove();
            
          //recursive calling add_instrument_type again
            var newInstrumentType = 0;
            $('option.add_instrument_type').click(function() {
            	newInstrumentType++;
            	$(this).add_instrument_type(newInstrumentType);
            	return false;
        	});
            //newInstrumentType--;
            return false;
        });
	};

//-------------------------------------------------------------------------------------------------
//-------------------------------------------------------------------------------------------------
	
	//DYNAMIC ROW ADDING ROUTINE for ADD "Scientific Contacts"
	var newContactNum = 0;
    $('a.add_contact').click(function() {
        newContactNum++;
        newContactNum = $(this).add_contact(newContactNum);
        return false;
    });
    
    //REMOVE EXISTING SCIENTIFIC CONTACT IN EDIT
    $('a.remove_contact').click(function() {
        $(this).parent().parent().remove();
        //newRowNum--;
        return false;
    });
    
	//DYNAMIC ROW ADDING ROUTINE for SELECTION "Other" in RESEARCH AREAS
	var newArea = 0;
    $('div#add_other_area').click(function() {
		newArea++;

  		var strToAdd = '<div style="margin:15px 0px">' +
  		'<a href="" class="ui-state-default ui-corner-all remove_area" style="padding:6px 6px 6px 17px;' +
  			'text-decoration:none;position:relative"><span class="ui-icon ui-icon-minus" style="position:absolute;top:4px;left:1px"></span>Delete<\/a>' +
  		'&nbsp;&nbsp;&nbsp;&nbsp;New Research Area:&nbsp;</b>' +
  		'<input type="text" class="research_areas" name="add_res_are[' + newArea +
  		']" size="50" value=""/></div>';

		$(this).after(strToAdd);

		$('a.remove_area').click(function() {
            $(this).parent().remove();
            //newArea--;
            return false;
        });
	});
    
//-------------------------------------------------------------------------------------------------
//-------------------------------------------------------------------------------------------------
    //ROUTINES for BROWSE OBSERVATORY
    //CALLING AUTOCOMPLETER FOR OBSERVATORY NAME
    $('input.obs_name').each(function() {
    	$(this).bind( "keydown", function( event ) {
			if ( event.keyCode === $.ui.keyCode.TAB &&
					$( this ).data( "autocomplete" ).menu.active ) {
				event.preventDefault();
			}
			/** @todo we have to reset the filter somehow, when input is removed */
		});
		$(this).autocomplete({
			//not fully clear! callback, how can we get the json string?
			source: function( request, response ) {
				$.getJSON( "js/observatories.php?extend=true", 
						//special datatype (object: name/value pairs)
						{ term: extractLast( request.term ) }, 
						response );
			},
			search: function() {
				// custom minLength
				var term = extractLast( this.value );
				if ( term.length < 1 ) {
					return false;
				}
			},
			focus: function() {
				// prevent value inserted on focus
				return false;
			},
			select: function(event, ui) {
				var terms = split(this.value);
				// remove the current input
				terms.pop();
				// add the selected item
				terms.push(ui.item.value);
				// add id to hidden field
				$('input.obs_id').val(ui.item.id);
				//not sure about this action (maybe we need commented stuff)
				//terms.push(" ");
				//this.value = terms.join( ", ");
				this.value = terms;
				// we already submit here, when value is selected
				$("#main_form").submit();
				return false;
			}
		});
		//return false;
    });   
    
	//CALLING AUTOCOMPLETER FOR TELESCOPE NAME
    $('input.obs_t_name').each(function() {
    	$(this).bind( "keydown", function( event ) {
			if ( event.keyCode === $.ui.keyCode.TAB &&
					$( this ).data( "autocomplete" ).menu.active ) {
				event.preventDefault();
			}
			/** @todo we have to reset the filter somehow, when input is removed */
		});
		$(this).autocomplete({
			//not fully clear! callback, how can we get the json string?
			source: function( request, response ) {
				$.getJSON( "js/telescopeNames.php", 
						//special datatype (object: name/value pairs)
						{ term: extractLast( request.term ) }, 
						response );
			},
			search: function() {
				// custom minLength
				var term = extractLast( this.value );
				if ( term.length < 1 ) {
					return false;
				}
			},
			focus: function() {
				// prevent value inserted on focus
				return false;
			},
			select: function(event, ui) {
				var terms = split(this.value);
				// remove the current input
				terms.pop();
				// add the selected item
				terms.push(ui.item.value);
				//not sure about this action (maybe we need commented stuff)
				//terms.push(" ");
				//this.value = terms.join( ", ");
				this.value = terms;
				$('input.obs_t_name').val(ui.item.value)
				// we already submit here, when value is selected
				$("#main_form").submit();
				return false;
			}
		});
		//return false;
	});
    
    //CALLING AUTOCOMPLETER FOR OBSERVATORY NAME => Partner Observatories
    $('input.partner').each(function() {
    	$(this).bind( "keydown", function( event ) {
			if ( event.keyCode === $.ui.keyCode.TAB &&
					$( this ).data( "autocomplete" ).menu.active ) {
				event.preventDefault();
			}
			/** @todo we have to reset the filter somehow, when input is removed */
		});
		$(this).autocomplete({
			//not fully clear! callback, how can we get the json string?
			source: function( request, response ) {
				$.getJSON( "js/observatories.php?extend=true", 
						//special datatype (object: name/value pairs)
						{ term: extractLast( request.term ) }, 
						response );
			},
			search: function() {
				// custom minLength
				var term = extractLast( this.value );
				if ( term.length < 1 ) {
					return false;
				}
			},
			focus: function() {
				// prevent value inserted on focus
				return false;
			},
			select: function(event, ui) {
				var terms = split(this.value);
				// remove the current input
				terms.pop();
				// add the selected item
				terms.push(ui.item.value);
				// add placeholder
				terms.push( "" );
				this.value = terms.join( ", ");
				return false;
			}
		});
		//return false;
    });   
    
    //ROUTINES for EDIT OBSERVATORY - TELESCOPES
    //CALLING AUTOCOMPLETER FOR WAVELENGTH
	$('input.wavelength').each(function() {
		$(this).wavelength_completer();
		/** @todo check this with documentation, do we need return? */
		//return false;
	});
	
	//CALLING AUTOCOMPLETER FOR TELESCOPE NAME
	$('input.telescope').each(function() {
		$(this).telescope_completer();
		/** @todo check this with documentation, do we need return? */
		//return false;
	});
	
	//CALLING AUTOCOMPLETER FOR INSTRUMENT NAME
	$('input.instrument').each(function() {
		$(this).instrument_completer();
		/** @todo check this with documentation, do we need return? */
		//return false;
	});
	
	//REMOVE EXISTING TELESCOPES IN EDIT
    $('a.remove_telescope').click(function() {
        $(this).parent().parent().parent().
        parent().parent().remove();
        return false;
    });
    
    //REMOVE EXISTING INSTRUMENTS IN EDIT
    $('a.remove_instrument').click(function() {
//    	$(this).parent().parent().parent().
//    	parent().parent().remove();
    	var field = $(this).parent().parent();
    	
    	//if its the last one, just clear the fields
    	if(field.parent().find("table.instrument").length == 1)
    	{
	        // clear lines of the last one!
			var lastInstrument = field;
	        //clear values for each input
	        $('input', lastInstrument).val('');
	        //clear value for each select
	        $('select', lastInstrument).val('');
	        //clear value for each textarea
	        $('textarea', lastInstrument).val('');
	        //clear value of each checkbox
	        $("input[type='checkbox']", lastInstrument).attr('checked', false);
    	}
    	else
    		field.remove();
    	
        return false;
    });
    
    //DYNAMIC ROW ADDING ROUTINE for ADD "Other Telescope Type"
    var newTelescopeType = 0;
    $('option.add_telescope_type').click(function() {
    	newTelescopeType++;
    	$(this).add_telescope_type(newTelescopeType);
    	return false;
	});
    
    //DYNAMIC ROW ADDING ROUTINE for ADD "Other Antenna Type"
    var newAntennaType = 0;
    $('option.add_antenna_type').click(function() {
    	newAntennaType++;
    	$(this).add_antenna_type(newAntennaType);
    	return false;
	});
    
    //DYNAMIC ROW ADDING ROUTINE for ADD "Instruments"
    var newInstrumentNum = 0;
    $('a.add_instrument').click(function() {
        newInstrumentNum++;
        newInstrumentNum = $(this).add_instrument(newInstrumentNum);
        return false;
	});
    
    //DYNAMIC ROW ADDING ROUTINE for ADD "Other Instrument Type"
    var newInstrumentType = 0;
    $('option.add_instrument_type').click(function() {
    	newInstrumentType++;
    	$(this).add_instrument_type(newInstrumentType);
    	return false;
	});
  
    //DYNAMIC TAB ADDING ROUTINE for TELESCOPES  
	// NEW TABS FUNCTIONALITY
	$('#tabbed-tele').tabs({
			/* fx: { opacity: 'toggle', duration:'fast'}, */
			tabTemplate: "<li><a href='#{href}'>#{label}</a> <span class='ui-icon ui-icon-close'>Remove Tab</span></li>",
		    add: function(event, ui) {
		        $('#tabbed-tele').tabs('select', '#' + ui.panel.id);
		    }}
//			add: function( event, ui ) {
//				var tab_content = $tab_content_input.val() || "Tab " + tab_counter + " content.";
//				$( ui.panel ).append( "<p>" + tab_content + "</p>" );		
	);    
    // NEW TABS FUNCTIONALITY
	$('#tabbed-tele span.ui-icon-close').live( "click", function() {
		var tabbed = $("#tabbed-tele");
		var TelescopeNum = $('li',tabbed).index($(this).parent());
		
		if(TelescopeNum != 0)
			$("#tabbed-tele").tabs('remove', TelescopeNum);
		else
		{
	        // clear lines of the last one!
			var lastTelescope = $("#tabbed-tele").find("#telescope-0");
	        //clear values for each input
	        $('input', lastTelescope).val('');
	        //clear value for each select
	        $('select', lastTelescope).val('');
	        //clear value for each textarea
	        $('textarea', lastTelescope).val('');
	        //clear value of each checkbox
	        $("input[type='checkbox']", lastTelescope).attr('checked', false);
		}
			
	});
	//DOM CLONING
    var newTelescopeNum = 0;
    $('a.add_telescope').click(function () {
        newTelescopeNum++;

        var addTelescope = $(this).parent().parent().parent().find('div.telescope:last');

        var newTelescope = addTelescope.clone();

        //remove additional instruments here afer cloning
        if ($('a.remove_instrument').length > 1) {
            $('a.remove_instrument:not(:first)', newTelescope).parent().parent().remove();
        }

        //remove any added new telescope types here after cloning
        if ($('a.remove_telescope_type').length>0) {
        	//we have to remove also the changed select/options  
        	$('a.remove_telescope_type', newTelescope).parent().parent().parent().find('option.other_telescope_type').
              after($("<OPTION class='add_telescope_type'></OPTION>").val("100000").html("Add other Telescope Type")).remove();     
        	$('a.remove_telescope_type', newTelescope).parent().parent().remove();
        }
        
        //remove any added new antenna types here after cloning
        if ($('a.remove_antenna_type').length>0) {
        	//we have to remove also the changed select/options  
        	$('a.remove_antenna_type', newTelescope).parent().parent().parent().find('option.other_antenna_type').
              after($("<OPTION class='add_antenna_type'></OPTION>").val("100000").html("Add other Type")).remove();     
        	$('a.remove_antenna_type', newTelescope).parent().parent().remove();
        }
        
        //remove any added new instrument types here after cloning
        if ($('a.remove_instrument_type').length>0) {
        	//we have to remove also the changed select/options  
        	$('a.remove_instrument_type', newTelescope).parent().parent().parent().find('option.other_instrument_type').
              after($("<OPTION class='add_instrument_type'></OPTION>").val("100000").html("Add other Instrument Type")).remove();
        	$('a.remove_instrument_type', newTelescope).parent().parent().remove();
        }

        //clear values for each input
        $('input', newTelescope).val('');
        //clear value for each select
        $('select', newTelescope).val('');
        //clear value for each textarea
        $('textarea', newTelescope).val('');
        //clear value of each checkbox
        $("input[type='checkbox']", newTelescope).attr('checked', false);

        //save old necessary old names
        var inputs = new Array();
        var selects = new Array();
        var areas = new Array();
        var instr_inputs = new Array();
        var instr_selects = new Array();
        var instr_areas = new Array();
        $('input', addTelescope).each(function(i) {
        	inputs[i] = $(this).attr('name');
        });
        $('select', addTelescope).each(function(i) {
        	selects[i] = $(this).attr('name');
        });
        $('textarea', addTelescope).each(function(i) {
        	areas[i] = $(this).attr('name');
        });
        $('table.instrument input', addTelescope).each(function(i) {
        	instr_inputs[i] = $(this).attr('name');
        });
        $('table.instrument select', addTelescope).each(function(i) {
    		instr_selects[i] = $(this).attr('name');
        });
        $('table.instrument textarea', addTelescope).each(function(i) {
    		instr_areas[i] = $(this).attr('name');
        });
        
		/** @todo THIS IS A NEW APPROACH TO GETTING ACTUAL NUMBER */
        var telescopeCount = inputs[0];
        //remove everything up to the last 0-9 (1 or more times)
		telescopeCount = telescopeCount.replace(/^.*\[(\d*)\]$/, '$1');
		if(newTelescopeNum <= telescopeCount)
			newTelescopeNum = ++telescopeCount;

        //save all new names
        $('input', newTelescope).each(function(i) {
        	//remove trailing [0-9] with regexp (one or more digits)
        	inputs[i] = inputs[i].replace(/^(.*)\[[0-9]*\].*$/, '$1');
            var newName = inputs[i] + '[' + newTelescopeNum + ']';
            $(this).attr('name', newName);
        });
        $('select', newTelescope).each(function(i) {
        	//remove trailing [0-9] with regexp (one or more digits)
        	selects[i] = selects[i].replace(/^(.*)\[[0-9]*\].*$/, '$1');
        	var newName = selects[i] + '[' + newTelescopeNum + ']';
            $(this).attr('name', newName);
        });
        $('textarea', newTelescope).each(function(i) {
        	//remove trailing [0-9] with regexp (one or more digits)
        	areas[i] = areas[i].replace(/^(.*)\[[0-9]*\].*$/, '$1');
        	var newName = areas[i] + '[' + newTelescopeNum + ']';
            $(this).attr('name', newName);
        });        
        //inputs for instruments
        $('table.instrument input', newTelescope).each(function(i) {
        	//remove all indices [0-9][0-9] with regexp
        	instr_inputs[i] = instr_inputs[i].replace(/^([^[\[0-9\]]*)\[[0-9\]]+.*$/, '$1');
            var newName = instr_inputs[i] + '[' + newTelescopeNum + ']' + '[0]';
            $(this).attr('name', newName);
        });
        //selects for instruments
        $('table.instrument select', newTelescope).each(function(i) {
        	//remove all indices [0-9][0-9] with regexp
        	instr_selects[i] = instr_selects[i].replace(/^([^[\[0-9\]]*)\[[0-9\]]+.*$/, '$1');
            var newName = instr_selects[i] + '[' + newTelescopeNum + ']' + '[0]';
            $(this).attr('name', newName);
        });
        //textareas for instruments
        $('table.instrument textarea', newTelescope).each(function(i) {
        	//remove all indices [0-9][0-9] with regexp
        	instr_areas[i] = instr_areas[i].replace(/^([^[\[0-9\]]*)\[[0-9\]]+.*$/, '$1');
            var newName = instr_areas[i] + '[' + newTelescopeNum + ']' + '[0]';
            $(this).attr('name', newName);
        });
        
        // NEW TABS FUNCTIONALITY
        $("#tabbed-tele").tabs("add", "#telescope-" + newTelescopeNum , 'Telescope ' + (newTelescopeNum +1));
        newTelescope = newTelescope.find('fieldset.rfield:first');
        $("#telescope-" + newTelescopeNum).append(newTelescope);
            
        //DYNAMIC ROW ADDING ROUTINE for ADD "Other Telescope Type"
        var newTelescopeType = 0;
        $('option.add_telescope_type', newTelescope).click(function() {
        	newTelescopeType++;
        	$(this).add_telescope_type(newTelescopeType);
        	return false;
    	});
        
        //DYNAMIC ROW ADDING ROUTINE for ADD "Other Antenna Type"
        var newAntennaType = 0;
        $('option.add_antenna_type', newTelescope).click(function() {
        	newAntennaType++;
        	$(this).add_antenna_type(newAntennaType);
        	return false;
    	});
        
        //DYNAMIC ROW ADDING ROUTINE for ADD "Instruments"
        var newInstrumentNum = 0;
        $('a.add_instrument', newTelescope).click(function() {
        	newInstrumentNum++;
        	//$(this).add_instrument(newTelescopeNum, newInstrumentNum);
        	newInstrumentNum = $(this).add_instrument(newInstrumentNum);
        	return false;
        });
        
        //REMOVE EXISTING INSTRUMENTS IN ANY DUPLICATED TELESCOPE
        $('a.remove_instrument', newTelescope).click(function() {
//        	$(this).parent().parent().parent().
//        	parent().parent().remove();
        	var field = $(this).parent().parent();
        	
        	//if its the last one, just clear the fields
        	if(field.parent().find("table.instrument").length == 1)
        	{
    	        // clear lines of the last one!
    			var lastInstrument = field;
    	        //clear values for each input
    	        $('input', lastInstrument).val('');
    	        //clear value for each select
    	        $('select', lastInstrument).val('');
    	        //clear value for each textarea
    	        $('textarea', lastInstrument).val('');
    	        //clear value of each checkbox
    	        $("input[type='checkbox']", lastInstrument).attr('checked', false);
        	}
        	else
        		field.remove();
        	
            return false;
        });
        
        //DYNAMIC ROW ADDING ROUTINE for ADD "Other Instrument Type"
        var newInstrumentType = 0;
        $('option.add_instrument_type', newTelescope).click(function() {
        	newInstrumentType++;
        	$(this).add_instrument_type(newInstrumentType);
        	return false;
        });
        
    	$('a.toggle_instrument', newTelescope).click(function() {
    		$(this).parent().next('table.instrument').toggle();
    		
    		var text = $(this).text();
    		$(this).text(
    			text == "Show Input Fields" ? "Hide Input Fields" : "Show Input Fields");
    		return false;
    	});
    	
		//CALLING AUTOCOMPLETER FOR WAVELENGTH
        $('input.wavelength', newTelescope).each(function() {
			$(this).wavelength_completer();
			return false;
		});
        
		//CALLING AUTOCOMPLETER FOR TELESCOPE NAME
        $('input.telescope', newTelescope).each(function() {
			$(this).telescope_completer();
			return false;
		});
        
		//CALLING AUTOCOMPLETER FOR INSTRUMENT NAME
        $('input.instrument', newTelescope).each(function() {
			$(this).instrument_completer();
			return false;
		});

        return false;
	});

//-------------------------------------------------------------------------------------------------
//-------------------------------------------------------------------------------------------------
    //ROUTINES for BROWSE SPACEMISSION
    //CALLING AUTOCOMPLETER FOR SPACEMISSION NAME
    $('input.spa_name').each(function() {
    	$(this).bind( "keydown", function( event ) {
			if ( event.keyCode === $.ui.keyCode.TAB &&
					$( this ).data( "autocomplete" ).menu.active ) {
				event.preventDefault();
			}
			/** @todo we have to reset the filter somehow, when input is removed */
		});
		$(this).autocomplete({
			//not fully clear! callback, how can we get the json string?
			source: function( request, response ) {
				$.getJSON( "js/spacemissions.php?extend=true", 
						//special datatype (object: name/value pairs)
						{ term: extractLast( request.term ) }, 
						response );
			},
			search: function() {
				// custom minLength
				var term = extractLast( this.value );
				if ( term.length < 1 ) {
					return false;
				}
			},
			focus: function() {
				// prevent value inserted on focus
				return false;
			},
			select: function(event, ui) {
				var terms = split(this.value);
				// remove the current input
				terms.pop();
				// add the selected item
				terms.push(ui.item.value);
				// add id to hidden field
				$('input.spa_id').val(ui.item.id);
				//not sure about this action (maybe we need commented stuff)
				//terms.push(" ");
				//this.value = terms.join( ", ");
				this.value = terms;
				// we already submit here, when value is selected
				$("#main_form").submit();
				return false;
			}
		});
		//return false;
    });    
    

//-------------------------------------------------------------------------------------------------
//-------------------------------------------------------------------------------------------------
	//AUTOCOMPLETER FOR WAVELENGTH
	$.fn.sensor_type_completer = function() {
		// don't navigate away from the field on tab when selecting an item
		$(this).bind( "keydown", function( event ) {
			if ( event.keyCode === $.ui.keyCode.TAB &&
					$( this ).data( "autocomplete" ).menu.active ) {
				event.preventDefault();
			}
		});
		$(this).autocomplete({
			source: function( request, response ) {
				$.getJSON( "js/sensorTypes.php", {
					term: extractLast( request.term )
				}, response );
			},
			search: function() {
				// custom minLength
				var term = extractLast( this.value );
				if ( term.length < 1 ) {
					return false;
				}
			},
			focus: function() {
				// prevent value inserted on focus
				return false;
			},
			select: function( event, ui ) {
				var terms = split( this.value );
				// remove the current input
				terms.pop();
				// add the selected item
				terms.push( ui.item.value );
				// add placeholder to get the comma-and-space at the end
				terms.push( "" );
				this.value = terms.join( ", " );
				return false;
			}
		});
	};

//------------------------------------------------------------------------------------------------- 
//-------------------------------------------------------------------------------------------------    
    //ROUTINES for EDIT SPACE MISSION - SENSORS
    //REMOVE EXISTING SENSORS IN EDIT
    $('a.remove_sensor').click(function() {
        $(this).parent().parent().parent().
        parent().parent().remove();
        //newSensorNum--;
        return false;
    });
    
	$('input.sensor_type').each(function() {
		$(this).sensor_type_completer();
		/** @todo check this with documentation, do we need return? */
		//return false;
	});
    
    //DYNAMIC ROW ADDING ROUTINE for SENSORS
	// NEW TABS FUNCTIONALITY
	$('#tabbed-sens').tabs({
			/* fx: { opacity: 'toggle', duration:'fast'}, */
			tabTemplate: "<li><a href='#{href}'>#{label}</a> <span class='ui-icon ui-icon-close'>Remove Tab</span></li>",
		    add: function(event, ui) {
		        $('#tabbed-sens').tabs('select', '#' + ui.panel.id);
		    }}
//			add: function( event, ui ) {
//				var tab_content = $tab_content_input.val() || "Tab " + tab_counter + " content.";
//				$( ui.panel ).append( "<p>" + tab_content + "</p>" );		
	);    
    // NEW TABS FUNCTIONALITY
	$('#tabbed-sens span.ui-icon-close').live( "click", function() {
		var tabbed = $("#tabbed-sens");
		var SensorNum = $('li',tabbed).index($(this).parent());
		
		if(SensorNum != 0)
			$("#tabbed-sens").tabs('remove', SensorNum);
		else
		{
	        // clear lines of the last one!
			var lastSensor = $("#tabbed-sens").find("#sensor-0");
	        //clear values for each input
	        $('input', lastSensor).val('');
	        //clear value for each select
	        $('select', lastSensor).val('');
	        //clear value for each textarea
	        $('textarea', lastSensor).val('');
	        //clear value of each checkbox
	        $("input[type='checkbox']", lastSensor).attr('checked', false);
		}
			
	});
    var newSensorNum = 0;
    $('a.add_sensor').click(function () {
        newSensorNum++;

        var addSensor = $(this).parent().parent().
        parent().find('div.sensor:last');

        var newSensor = addSensor.clone();

        //remove additional scientific contacts here afer cloning
        if ($('a.remove_contact').length>0) {
            $('a.remove_contact', newSensor).parent().parent().remove();
        }
        //clear values for each input
        $('input', newSensor).val('');

        //clear value for each select
        $('select', newSensor).val('');
        
        //clear value for each textarea
        $('textarea', newSensor).val('');

        //save old necessary old names
        var inputs = new Array();
        var select = new Array();
        var textarea = new Array();
        var con_names = new Array();
        var goal_classes = new Array();
        var goal_table = new Array();
        var sci_con_inputs = new Array();
        $('input', addSensor).each(function(i) {
        	inputs[i] = $(this).attr('name');
        });
        $('select', addSensor).each(function(i) {
        	select[i] = $(this).attr('name');
        });
        $('textarea', addSensor).each(function(i) {
        	textarea[i] = $(this).attr('name');
        });
        $('input.contact', addSensor).each(function(i) {
        	con_names[i] = $(this).attr('name');
        });

        $('table.scientific_contacts input', addSensor).each(function(i) {
        	sci_con_inputs[i] = $(this).attr('name');
        });
        
		/** @todo THIS IS A NEW APPROACH TO GETTING ACTUAL NUMBER */
        var sensorCount = inputs[0];
        //remove everything up to the last 0-9 (1 or more times)
		sensorCount = sensorCount.replace(/^.*\[(\d*)\]$/, '$1');
		if(newSensorNum <= sensorCount)
			newSensorNum = ++sensorCount;
        
        //inputs for sensors
        $('input', newSensor).each(function(i) {
        	//remove trailing [0-9] with regexp
        	inputs[i] = inputs[i].replace(/^(.*)\[[0-9]{1,3}\].*$/, '$1');
            var newName = inputs[i] + '[' + newSensorNum + ']';
            $(this).attr('name', newName);
        });
        //selects for sensors (science goals)
        $('select', newSensor).each(function(i) {
        	//remove trailing [0-9] with regexp
        	select[i] = select[i].replace(/^(.*)\[[0-9]{1,3}\].*$/, '$1');
        	var newName = select[i] + '[' + newSensorNum + ']' + '[]';
            $(this).attr('name', newName);
        });
        //textareas for sensors
        $('textarea', newSensor).each(function(i) {
        	//remove trailing [0-9] with regexp
        	textarea[i] = textarea[i].replace(/^(.*)\[[0-9]{1,3}\].*$/, '$1');
        	var newName = textarea[i] + '[' + newSensorNum + ']';
            $(this).attr('name', newName);
        });
        //inputs for scientific contacts
        $('input.contact', newSensor).each(function(i) {
        	//remove all indices [0-9][0-9] with regexp
        	con_names[i] = con_names[i].replace(/^([^[\[0-9\]]*)\[[0-9\]]+.*$/, '$1');
            var newName = con_names[i] + '[' + newSensorNum + ']' + '[0]';
            $(this).attr('name', newName);
        });
        //inputs for scientific contacts
        $('table.scientific_contacts input', newSensor).each(function(i) {
        	//remove all indices [0-9][0-9] with regexp
        	sci_con_inputs[i] = sci_con_inputs[i].replace(/^([^[\[0-9\]]*)\[[0-9\]]+.*$/, '$1');
            var newName = sci_con_inputs[i] + '[' + newSensorNum + ']' + '[0]';
            $(this).attr('name', newName);
        });
        
        // NEW TABS FUNCTIONALITY
        $("#tabbed-sens").tabs("add", "#sensor-" + newSensorNum , 'Sensor ' + (newSensorNum +1));
        newSensor = newSensor.find('fieldset.rfield:first');
        $("#sensor-" + newSensorNum).append(newSensor);

        //DYNAMIC ROW ADDING ROUTINE for ADD "Scientific Contacts"
        var newContactNum = 0;
        $('a.add_contact', newSensor).click(function() {
            newContactNum++;     
            newContactNum = $(this).add_contact(newContactNum);    
            return false;
        });
        
    	$('input.sensor_type').each(function() {
    		$(this).sensor_type_completer();
    		/** @todo check this with documentation, do we need return? */
    		//return false;
    	});

        return false;
	});
});

//JQUERY VALIDATOR STANDARD MESSAGES - ADOPTED FOR INLINE VALIDATION LABELS
jQuery.extend(jQuery.validator.messages, {
    required: "Please enter a new entry or delete and select existing from above!",
    number: "Plase enter a float number!"
});

