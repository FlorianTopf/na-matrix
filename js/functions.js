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
 */

//OPENWIN for VIEW single resource
function openwin(content)
{
  W=window.open(content,'RESULTS','status=yes,menubar=yes,hotkeys=no,resizable=yes,scrollbars=yes,width=650,height=600');
  W.focus();

  return false;
}

//-----------------------------------------------------------------------------------------------------------
//SOME VARIABLES FOR GOOGLE MAPS
//User Location
var initialLocation;
//Standard Locations
var siberia = new google.maps.LatLng(60, 105);
var newyork = new google.maps.LatLng(40.69847032728747, -73.9514422416687);
//Flag for User Location Support
var browserSupportFlag =  new Boolean();
//Custom Icons (maybe introduce new ones)
var customIcons = {
	      myLocation: {
	        icon: 'images/mm_20_blue.png',
	        shadow: 'images/mm_20_shadow.png'
	      },
	      observatory: {
	        icon: 'images/mm_20_red.png',
	        shadow: 'images/mm_20_shadow.png'
	      }
};

//Google Maps Integration Testing (Google Maps Api v3)

//Note that using Google Gears requires loading the Javascript
//at http://code.google.com/apis/gears/gears_init.js
$(document).bind('mapIsReady', function() {   	
	var myOptions = {
        zoom: 4,
        mapTypeId: google.maps.MapTypeId.ROADMAP
	};
    	
    //Generate Map
    var map = new google.maps.Map(document.getElementById("map"), myOptions);
    //Generate Infowindow
    var infoWindow = new google.maps.InfoWindow;
        
    //Set User Location
    //Variables for marker
    var html = "<b>Your current location</b>";
    var icon = customIcons["myLocation"];
    // Try W3C Geolocation (Preferred)
    if(navigator.geolocation) {
    	browserSupportFlag = true;
        navigator.geolocation.getCurrentPosition(function(position) {
        	initialLocation = new google.maps.LatLng(position.coords.latitude,position.coords.longitude);
        	map.setCenter(initialLocation, 4);
        	// Set marker at User Location
        	var marker = new google.maps.Marker({
        		map: map,
        		position: initialLocation,
        		icon: icon.icon,
        		shadow: icon.shadow
        	});
        	bindInfoWindow(marker, map, infoWindow, html);
        }, function() {
        	handleNoGeolocation(browserSupportFlag);	
        });
        // Try Google Gears Geolocation
        } else if (google.gears) {
        	browserSupportFlag = true;
        	var geo = google.gears.factory.create('beta.geolocation');
        	geo.getCurrentPosition(function(position) {
        		initialLocation = new google.maps.LatLng(position.latitude,position.longitude);
        		map.setCenter(initialLocation, 4);
        		// Set marker at User Location
        		var marker = new google.maps.Marker({
        			map: map,
        			position: initialLocation,
        			icon: icon.icon,
        			shadow: icon.shadow
        		});
        		bindInfoWindow(marker, map, infoWindow, html);
        	}, function() {
        		handleNoGeoLocation(browserSupportFlag);
        	});
        // Browser doesn't support Geolocation
        } else {
        	browserSupportFlag = false;
        	handleNoGeolocation(browserSupportFlag);
        }

        //Fetch Observatory Locations from Database
    	downloadUrl("js/observatoriesXML.php", function(data) {
    		var xml = parseXml(data);
    		var markers = xml.documentElement.getElementsByTagName("marker");
    		//Amount of Observatories
    		var markersCountHtml =  "<h2>There are " + markers.length + 
    		" ground-based facilities with GPS data listed in the matrix</h2>";
    		//Add it to DIV
    		document.getElementById("numObservatories").innerHTML = markersCountHtml;
    		for (var i = 0; i < markers.length; i++) {
    			var name = markers[i].getAttribute("name");
    			var point = new google.maps.LatLng(parseFloat(markers[i].getAttribute("lat")),
    					parseFloat(markers[i].getAttribute("lng")));
    			var id = markers[i].getAttribute("id");
    			//Set information for infowindow
    			var html = "<h3>" + name + "</h3>" + 
    				"<center><b><a href=\"#\" onClick=\"return openwin('views/ObservatoryView.php?" +
    				"id=" + id + "')\" class='hand'>Click here for details</b></center>"; 
    			var icon = customIcons["observatory"];
    			//Set marker for Observatory
    			var marker = new google.maps.Marker({
    				map: map,
    				position: point,
    				icon: icon.icon,
    				shadow: icon.shadow
    			});
    			bindInfoWindow(marker, map, infoWindow, html);
    		}
    	});  	
});

//HELPER FUNCTIONS for GOOGLE MAPS
function handleNoGeolocation(errorFlag) {
	//unbedingt bessere default plätze definieren
	if (errorFlag == true) {
		alert("Geolocation service failed.");
		initialLocation = newyork;
    } else {
    	alert("Your browser doesn't support geolocation. We've placed you in Siberia.");
    	initialLocation = siberia;
    }
    map.setCenter(initialLocation);
}

function bindInfoWindow(marker, map, infoWindow, html) {
	google.maps.event.addListener(marker, 'click', function() {
		infoWindow.setContent(html);
		infoWindow.open(map, marker);
    });
}

function downloadUrl(url, callback) {
	var request = window.ActiveXObject ?
		new ActiveXObject('Microsoft.XMLHTTP') :
        new XMLHttpRequest;
		
	request.onreadystatechange = function() {
		if (request.readyState == 4) {
			request.onreadystatechange = doNothing;
			callback(request.responseText, request.status);
		}
	};

    request.open('GET', url, true);
    request.send(null);
}

function parseXml(str) {
	if (window.ActiveXObject) {
		var doc = new ActiveXObject('Microsoft.XMLDOM');
		doc.loadXML(str);
		return doc;
	} else if (window.DOMParser) {
		return (new DOMParser).parseFromString(str, 'text/xml');
		
	}
}

function doNothing() {}

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
	//prevent that a user hits enter when in form (for add/edit and browse)
	$(window).keydown(function(event){
	    if(event.keyCode == 13) {
	      event.preventDefault();
	      return false;
	    }
	  });
	//warning if javascript off
	$('p.warning').remove();
	//hide all .error labels, if costum labels are inserted in html
	//$('.error').hide();
	$('table.instrument').hide();
		
	$('a.toggle_instrument').click(function() {
		$(this).parent().parent().
		parent().parent().next('table.instrument').toggle();
		
		var text = $(this).text();
		$(this).text(
			text == "Show Inputs" ? "Hide Inputs" : "Show Inputs");
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
		var addInstrument = $(this).parent().parent().parent().
        parent().parent();

        var newInstrument = addInstrument.clone();
        
        //remove any added new instrument types here after cloning
        if ($('a.remove_instrument_type').length>0) {
        	//we have to remove also the changed select/options  
        	$('a.remove_instrument_type', newInstrument).parent().parent().parent().find('option.other_instrument_type').
              after($("<OPTION class='add_instrument_type'></OPTION>").val("100000").html("Add other Instrument Type")).remove();
        	$('a.remove_instrument_type', newInstrument).parent().parent().remove();
        }
        
        $('input', newInstrument).val('');
        //set instrument number, if there are more loaded in edit
//        if(newInstrumentNum < 1) {
//        	newInstrumentNum = $('input.instruments', addInstrument).val();
//        }
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
        
        //add delete instrument button
        $('table.instrument_button', newInstrument).
        html('<tr><td><a href="" class="remove_instrument">Delete Instrument<\/a><\/td><\/tr>');

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
        	$(this).parent().parent().parent().
        	parent().parent().remove();
            //newInstrumentNum--;
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
			$(this).parent().parent().
			parent().parent().next('table.instrument').toggle();
			
			var text = $(this).text();
			$(this).text(
				text == "Show Inputs" ? "Hide Inputs" : "Show Inputs");
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
  		//'<input type="text" class="required" name="add_telescope_type' + TelescopeCount + '[' + newTelescopeType +
  		//']" size="45" value="" /></td></tr>';
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
  		//'<input type="text" class="required" name="add_antenna_type' + TelescopeCount + '[' + newAntennaType +
  		//']" size="45" value="" /></td></tr>';
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
		//remove trailing []
		//InstrumentCount = InstrumentCount.replace(/^(.*)\[\].*$/, '$1');

  		var strToAdd = '<tr><td>&nbsp;&nbsp;&nbsp;<a href="" class="remove_instrument_type">Delete<\/a></td>' +
  		'<td><b>New Instrument Type:&nbsp;</b>' +
  		//'<input type="text" class="required" name="add_instrument_type' + InstrumentCount + '[' + newInstrumentType +
  		//']" size="45" value="" /></td></tr>';
  		'<input type="text" class="instrument_type" name="add_instrument_type' + InstrumentCount + '" size="40" value="" /></td></tr>';

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
    $('#add_other_area').click(function() {
		newArea++;

  		var strToAdd = '<tr><td><a href="" class="remove_area">Delete<\/a></td>' +
  		'<td><b>New Research Area:&nbsp;</b>' +
  		'<input type="text" class="research_areas" name="add_res_are[' + newArea +
  		']" size="50" value="" /></td></tr>';

		$('#research_areas').append(strToAdd);

		$('a.remove_area').click(function() {
            $(this).parent().parent().remove();
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
    	$(this).parent().parent().parent().
    	parent().parent().remove();
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
        //$(this).add_instrument('0', newInstrumentNum);
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

    //DYNAMIC ROW ADDING ROUTINE for TELESCOPES
    var newTelescopeNum = 0;
    $('a.add_telescope').click(function () {
        newTelescopeNum++;

        var addTelescope = $(this).parent().parent().
        parent().parent().parent();

        var newTelescope = addTelescope.clone();

        //remove additional instruments here afer cloning
        if ($('a.remove_instrument').length>0) {
            $('a.remove_instrument', newTelescope).parent().parent().
            parent().parent().parent().remove();
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
        //set telescope number, if there are more loaded in edit
//        if(newTelescopeNum <= 1) {
//        	newTelescopeNum = $('input.telescopes', addTelescope).val();
//        }
        //clear value for each select
        $('select', newTelescope).val('');
        //clear value for each textarea
        $('textarea', newTelescope).val('');

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

        //add delete telescope button
        $('table.telescope_button', newTelescope).
        html('<tr><td><a href="" class="remove_telescope">Delete Telescope<\/a><\/td><\/tr>');

        //save all new names
        $('input', newTelescope).each(function(i) {
        	//remove trailing [0-9] with regexp
        	inputs[i] = inputs[i].replace(/^(.*)\[[0-9]\].*$/, '$1');
            var newName = inputs[i] + '[' + newTelescopeNum + ']';
            $(this).attr('name', newName);
        });
        $('select', newTelescope).each(function(i) {
        	//remove trailing [0-9] with regexp
        	selects[i] = selects[i].replace(/^(.*)\[[0-9]\].*$/, '$1');
        	var newName = selects[i] + '[' + newTelescopeNum + ']';
            $(this).attr('name', newName);
        });
        $('textarea', newTelescope).each(function(i) {
        	//remove trailing [0-9] with regexp
        	areas[i] = areas[i].replace(/^(.*)\[[0-9]\].*$/, '$1');
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

        //append new telescope field
        addTelescope.after(newTelescope);

        //remove telescope routine
        $('a.remove_telescope', newTelescope).click(function() {
            $(this).parent().parent().parent().
            parent().parent().remove();
            return false;
        });

        /** @todo add telescope routine - needs to be recursive */
        $('a.add_telescope', newTelescope).click(function() {
            //we need a recursive call here!
        	return false;
        	//return argument.callee();
        });
        
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
        
        //DYNAMIC ROW ADDING ROUTINE for ADD "Other Instrument Type"
        var newInstrumentType = 0;
        $('option.add_instrument_type', newTelescope).click(function() {
        	newInstrumentType++;
        	$(this).add_instrument_type(newInstrumentType);
        	return false;
        });
        
    	$('a.toggle_instrument', newTelescope).click(function() {
    		$(this).parent().parent().
    		parent().parent().next('table.instrument').toggle();
    		
    		var text = $(this).text();
    		$(this).text(
    			text == "Show Inputs" ? "Hide Inputs" : "Show Inputs");
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

    //ROUTINES for EDIT SPACE MISSION - SENSORS
    //REMOVE EXISTING SENSORS IN EDIT
    $('a.remove_sensor').click(function() {
        $(this).parent().parent().parent().
        parent().parent().remove();
        //newSensorNum--;
        return false;
    });
    
    //DYNAMIC ROW ADDING ROUTINE for OTHER SENSOR - SCIENCE GOAL IN EDIT
    var newGoal = 0;
    $('option.add_other_goal').click(function() {
		newGoal++;

		var sensorCount = $(this).parent().attr('name');
		/** @todo improve this regexes */
		//remove everything before [0-9]
		sensorCount = sensorCount.replace(/^[^\[]*(\[.*)$/, '$1');
		//remove trailing []
		sensorCount = sensorCount.replace(/^(.*)\[\].*$/, '$1');

  		var strToAdd = '<tr><td><a href="" class="remove_goal">Delete<\/a></td>' +
  		'<td><b>New Science Goal:&nbsp;</b>' +
  		'<input type="text" class="science_goal" name="add_sci_goal' + sensorCount + '[' + newGoal +
  		']" size="45" value="" />&nbsp;&nbsp;&nbsp;&nbsp;<b>Acronym:</b>&nbsp;' +
  		'<input type="text" class="science_goal_acro" name="add_sci_acro' + sensorCount + '[' + newGoal +
  		']" size="5" value="" /></td></tr>';
  		
  		/** @todo add custom error labels here */
  		//strToAdd = strToAdd + '<tr><td></td><td><label for="add_sci_goal' + sensorCount + '[' + newGoal + 
  		//']" class="error" style="display: none;">Please enter a new Entry or delete and select existing from above!</label></td></tr>' +
  		//'<tr><td></td><td><label for="add_sci_acro' + sensorCount + '[' + newGoal + 
  		//']" class="error" style="display: none;">Please enter a new Entry or delete and select existing from above!</label></td></tr>';
  		
		$(this).closest('table.science_goals').append(strToAdd);

		$('a.remove_goal').click(function() {
            $(this).parent().parent().remove();
            //newArea--;
            return false;
        });
	});
    
    //DYNAMIC ROW ADDING ROUTINE for SENSORS
    var newSensorNum = 0;
    $('a.add_sensor').click(function () {
        newSensorNum++;

        var addSensor = $(this).parent().parent().
        parent().parent().parent();

        var newSensor = addSensor.clone();

        //remove additional scientific contacts here afer cloning
        if ($('a.remove_contact').length>0) {
            $('a.remove_contact', newSensor).parent().parent().remove();
        }
        //remove any added new science goals here after cloning
        if ($('a.remove_goal').length>0) {
        	$('a.remove_goal', newSensor).parent().parent().remove();
        }
        //clear values for each input
        $('input', newSensor).val('');
        //set sensor number, if there are more loaded in edit
        if(newSensorNum <= 1) {
        	newSensorNum = $('input.sensors', addSensor).val();
        }
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
        $('option.add_other_goal', addSensor).each(function(i) {
        	goal_classes[i] = $(this).attr('class');
        });
        $('table.science_goals', addSensor).each(function(i) {
        	goal_table[i] = $(this).attr('class');
        });
        $('table.scientific_contacts input', addSensor).each(function(i) {
        	sci_con_inputs[i] = $(this).attr('name');
        });

        //add delete sensor button
        $('table.sensor_button', newSensor).
        //html('<tr><td><a href="" class="remove_sensor">Delete Sensor<\/a><\/td><td><a href="" class="add_sensor">Add Sensor<\/a><\/td><\/tr>');
        html('<tr><td><a href="" class="remove_sensor">Delete Sensor<\/a><\/td><\/tr>');
        
        //inputs for sensors
        $('input', newSensor).each(function(i) {
        	//remove trailing [0-9] with regexp
        	inputs[i] = inputs[i].replace(/^(.*)\[[0-9]\].*$/, '$1');
            var newName = inputs[i] + '[' + newSensorNum + ']';
            $(this).attr('name', newName);
        });
        //selects for sensors (science goals)
        $('select', newSensor).each(function(i) {
        	//remove trailing [0-9] with regexp
        	select[i] = select[i].replace(/^(.*)\[[0-9]\].*$/, '$1');
        	var newName = select[i] + '[' + newSensorNum + ']' + '[]';
            $(this).attr('name', newName);
        });
        //textareas for sensors
        $('textarea', newSensor).each(function(i) {
        	//remove trailing [0-9] with regexp
        	textarea[i] = textarea[i].replace(/^(.*)\[[0-9]\].*$/, '$1');
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
        $('option.add_other_goal', newSensor).each(function(i) {
        	var newClass = goal_classes[i] + '_' + newSensorNum;
        	$(this).attr('class', newClass);
        });
        $('table.science_goals', newSensor).each(function(i) {
        	var newClass = goal_table[i] + '_' + newSensorNum;
        	$(this).attr('class', newClass);
        });
        //inputs for scientific contacts
        $('table.scientific_contacts input', newSensor).each(function(i) {
        	//remove all indices [0-9][0-9] with regexp
        	sci_con_inputs[i] = sci_con_inputs[i].replace(/^([^[\[0-9\]]*)\[[0-9\]]+.*$/, '$1');
            var newName = sci_con_inputs[i] + '[' + newSensorNum + ']' + '[0]';
            $(this).attr('name', newName);
        });

        //append new sensor field
        addSensor.after(newSensor);

        //remove sensor routine
        $('a.remove_sensor', newSensor).click(function() {
            $(this).parent().parent().parent().
            parent().parent().remove();
            //newSensorNum--;
            return false;
        });

        /** @todo add sensor routine - needs to be recursive */
        $('a.add_sensor', newSensor).click(function() {
            //we need a recursive call here!
        	return false;
        	//return argument.callee();
        });

        //DYNAMIC ROW ADDING ROUTINE for OTHER SENSOR - SCIENCE GOAL
        var newGoal = 0;
        $('option.add_other_goal_' + newSensorNum).click(function() {
    		newGoal++;

      		var strToAdd = '<tr><td><a href="" class="remove_goal_' + newSensorNum + '">Delete<\/a></td>' +
      		'<td><b>New Science Goal:&nbsp;</b>' +
      		'<input type="text" class="required" name="add_sci_goal[' + newSensorNum + '][' + newGoal +
      		']" size="45" value="" />&nbsp;&nbsp;&nbsp;&nbsp;<b>Acronym:</b>&nbsp;' +
      		'<input type="text" class="required" name="add_sci_acro[' + newSensorNum + '][' + newGoal +
      		']" size="5" value="" /</td></tr>';

    		$('table.science_goals_' + newSensorNum).append(strToAdd);

    		$('a.remove_goal_' + newSensorNum).click(function() {
                $(this).parent().parent().remove();
                //newArea--;
                return false;
            });
    	});

        //DYNAMIC ROW ADDING ROUTINE for ADD "Scientific Contacts"
        var newContactNum = 0;
        $('a.add_contact', newSensor).click(function() {
            newContactNum++;     
            newContactNum = $(this).add_contact(newContactNum);    
            return false;
        });

        return false;
	});
});

//JQUERY VALIDATOR STANDARD MESSAGES - ADOPTED FOR INLINE VALIDATION LABELS
jQuery.extend(jQuery.validator.messages, {
    required: "Please enter a new Entry or delete and select existing from above!",
    number: "Plase enter a float number!"
});

