/**
 * @file functions.js
 * @version $Id: functions.js 237 2011-02-28 15:11:10Z rst $
 * @author Florian Topf
 *
 * @todo refactor every jquery function (see JQUERY API http://api.jquery.com/)
 * @todo there is a certain problem with validating IDs, which lets us only providing them AFTER
 * dynamic rows routines
 */

function openwin(content)
{
  W=window.open(content,'RESULTS','status=yes,menubar=yes,hotkeys=no,resizable=yes,scrollbars=yes,width=600,height=600');
  W.focus();

  return false;
}

//HERE ALL JQUERY STUFF STARTS
$(document).ready(function(){
	//hide all .error labels, if costum labels are inserted in html
	//$('.error').hide();
		
	//HELPER FUNCTIONS for AUTOCOMPLETER
	function split( val ) {
		return val.split( /,\s*/ );
	}
	function extractLast( term ) {
		return split( term ).pop();
	}
	
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
				$.getJSON( "inc/search.php", {
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

	$("input.wavelength").each(function() {
		//CALLING AUTOCOMPLETER FOR WAVELENGTH
		$(this).wavelength_completer();
	});
	
	//VALIDATION ROUTINE FROM JQUERY
	//Including all necessary rules and messages
	$("#main_form").validate({
		rules: {
				add_obs_name: {
					required: true,
					//calling an external php file for checking the name
					remote: "inc/observatories.php" },
				add_obs_founded: {
      				//gets required when something is entered in this field
					required: function(element) {
      			        return $("#add_obs_founded").val() != ''; },
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
					remote: "inc/spacemissions.php" },
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

	//DYNAMIC ROW ADDING ROUTINE for ADD "Scientific Contacts"
	var newRowNum = 0;
    $('a.add_contact').click(function() {

        newRowNum++;

        var addRow = $(this).parent().parent();

        var newRow = addRow.clone();
        $('input', addRow).val('');

        var names = new Array();
        $('input', addRow).each(function(i) {
        	//names[i] = $(this).attr('id');
        	names[i] = $(this).attr('name');
        });

        $('td:first-child', newRow).html('<a href="" class="remove_con">Del<\/a>');
        $('input', newRow).each(function(i) {
            //remove trailing [0] with regexp
        	names[i] = names[i].replace(/^(.*)\[0\].*$/, '$1');
        	var newID = names[i] + '[' + newRowNum + ']';
            //$(this).attr('id', newID).attr('name', newID);
            $(this).attr('name', newID);
        });
        addRow.after(newRow);

        $('a.remove_con', newRow).click(function() {
            $(this).parent().parent().remove();
            //newRowNum--;
            return false;
        });

        return false;
    });

	//DYNAMIC ROW ADDING ROUTINE for SELECTION "Other" in RESEARCH AREAS
	var newArea = 0;
    $('#add_other_area').click(function() {

		newArea++;

  		var strToAdd = '<tr><td><a href="" class="remove_area">Delete<\/a></td>' +
  		'<td><b>New Research Area:&nbsp;</b>' +
  		'<input type="text" class="required" name="add_res_are[' + newArea +
  		']" size="50" value="" /></td></tr>';

		$('#research_areas').append(strToAdd);

		$('a.remove_area').click(function() {
            $(this).parent().parent().remove();
            //newArea--;
            return false;
        });
	});

    //DYNAMIC ROW ADDING ROUTINE for ADD "Instruments"
    var newInstrumentNum = 0;
    $('#add_instrument').click(function() {

        newInstrumentNum++;

        var addInstrument = $(this).parent().parent();

        var newInstrument = addInstrument.clone();
        $('input', newInstrument).val('');
        //$('select', newInstrument).val('');

        var names = new Array();
        var select = new Array();
        $('input', addInstrument).each(function(i) {
        	//names[i] = $(this).attr('id');
        	names[i] = $(this).attr('name');
        });
        $('select', addInstrument).each(function(i) {
        	//select[i] = $(this).attr('id');
        	select[i] = $(this).attr('name');
        });

        $('td:first-child', newInstrument).html('<a href="" class="remove_instr">Del<\/a>');
        $('input', newInstrument).each(function(i) {
            //remove trailing [0] with regexp
        	names[i] = names[i].replace(/^(.*)\[0\].*$/, '$1');
        	var newID = names[i] + '[' + newInstrumentNum + ']';
            //$(this).attr('id', newID).attr('name', newID);
            $(this).attr('name', newID);
        });
        $('select', newInstrument).each(function(i) {
            //remove trailing [0] with regexp
        	select[i] = select[i].replace(/^(.*)\[0\].*$/, '$1');
        	var newID = select[i] + '[' + newInstrumentNum + ']';
            //$(this).attr('id', newID).attr('name', newID);
            $(this).attr('name', newID);
        });
        addInstrument.after(newInstrument);

        $('a.remove_instr', newInstrument).click(function() {
            $(this).parent().parent().remove();
            //newInstrumentNum--;
            return false;
        });

		//CALLING AUTOCOMPLETER FOR WAVELENGTH
        $("input.wavelength").each(function() {
			$(this).wavelength_completer();
		});
                
		return false;
	});

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
		//remove everything before [0-9]
		sensorCount = sensorCount.replace(/^[^\[]*(\[.*)$/, '$1');
		//remove trailing []
		sensorCount = sensorCount.replace(/^(.*)\[\].*$/, '$1');

  		var strToAdd = '<tr><td><a href="" class="remove_goal">Delete<\/a></td>' +
  		'<td><b>New Science Goal:&nbsp;</b>' +
  		'<input type="text" class="required" name="add_sci_goal' + sensorCount + '[' + newGoal +
  		']" size="45" value="" />&nbsp;&nbsp;&nbsp;&nbsp;<b>Acronym:</b>&nbsp;' +
  		'<input type="text" class="required" name="add_sci_acro' + sensorCount + '[' + newGoal +
  		']" size="5" value="" /</td></tr>';

		//$('table.science_goals').append(strToAdd);
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
        if ($('a.remove_con').length>0) {
            $('a.remove_con', newSensor).parent().parent().remove();
        }

        //remove any loaded scientific contact here after cloning
        if ($('input.load_con').length>0) {
        	$('input.load_con', newSensor).parent().parent().remove();
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

        //clear value for one select
        $('select', newSensor).val('');

        //save old necessary old names
        var names = new Array();
        var select = new Array();
        var con_names = new Array();
        var goal_classes = new Array();
        var goal_table = new Array();
        $('input', addSensor).each(function(i) {
        	//names[i] = $(this).attr('id');
        	names[i] = $(this).attr('name');
        });
        $('select', addSensor).each(function(i) {
        	//select[i] = $(this).attr('id');
        	select[i] = $(this).attr('name');
        });
        $('input.contact', addSensor).each(function(i) {
        	//con_names[i] = $(this).attr('id');
        	con_names[i] = $(this).attr('name');
        });
        $('option.add_other_goal', addSensor).each(function(i) {
        	goal_classes[i] = $(this).attr('class');
        });
        $('table.science_goals', addSensor).each(function(i) {
        	goal_table[i] = $(this).attr('class');
        });

        //add delete sensor button
        $('table.linkfield', newSensor).
        //html('<tr><td><a href="" class="remove_sensor">Delete Sensor<\/a><\/td><td><a href="" class="add_sensor">Add Sensor<\/a><\/td><\/tr>');
        html('<tr><td><a href="" class="remove_sensor">Delete Sensor<\/a><\/td><\/tr>');

        //save all new names
        $('input', newSensor).each(function(i) {
        	//remove trailing [0-9] with regexp
        	names[i] = names[i].replace(/^(.*)\[[0-9]\].*$/, '$1');
            var newID = names[i] + '[' + newSensorNum + ']';
            //$(this).attr('id', newID).attr('name', newID);
            $(this).attr('name', newID);
        });
        //this will be only for science goals right now!
        $('select', newSensor).each(function(i) {
        	//remove trailing [0-9] with regexp
        	select[i] = select[i].replace(/^(.*)\[[0-9]\].*$/, '$1');
        	var newID = select[i] + '[' + newSensorNum + ']' + '[]';
            //$(this).attr('id', newID).attr('name', newID);
            $(this).attr('name', newID);
        });
        //inputs for scientific contacts
        $('input.contact', newSensor).each(function(i) {
        	//remove all indices [0-9][0-9] with regexp
        	con_names[i] = con_names[i].replace(/^([^[\[0-9\]]*)\[[0-9\]]+.*$/, '$1');
        	//we have to replace the leading zero index
        	//con_names[i] = con_names[i].replace("[0]", "");
            var newID = con_names[i] + '[' + newSensorNum + ']' + '[0]';
            //$(this).attr('id', newID).attr('name', newID);
            $(this).attr('name', newID);
        });
        $('option.add_other_goal', newSensor).each(function(i) {
        	var newID = goal_classes[i] + '_' + newSensorNum;
        	$(this).attr('class', newID);
        });
        $('table.science_goals', newSensor).each(function(i) {
        	var newID = goal_table[i] + '_' + newSensorNum;
        	$(this).attr('class', newID);
        });

        //append new sensor field
        addSensor.after(newSensor);

        //reomve sensor routine
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

            var addRow = $(this).parent().parent();

            var newRow = addRow.clone();
            $('input', addRow).val('');

            var names = new Array();
            $('input', addRow).each(function(i) {
            	//names[i] = $(this).attr('id');
            	names[i] = $(this).attr('name');
            });

            $('td:first-child', newRow).html('<a href="" class="remove_con">Del<\/a>');
            $('input', newRow).each(function(i) {
            	//remove trailing [0-9] with regexp
            	names[i] = names[i].replace(/^(.*)\[[0-9]\].*$/, '$1');
                //var newID = names[i] + '[' + newSensorNum + ']' + '[' + newContactNum + ']';
            	var newID = names[i] + '[' + newContactNum + ']';
                //$(this).attr('id', newID).attr('name', newID);
                $(this).attr('name', newID);
            });
            addRow.after(newRow);

            $('a.remove_con', newRow).click(function() {
                $(this).parent().parent().remove();
                //newContactNum--;
                return false;
            });

            return false;
        });

        return false;
	});

});

//JQUERY VALIDATOR STANDARD MESSAGES - ADOPTED FOR INLINE VALIDATION LABELS
jQuery.extend(jQuery.validator.messages, {
    required: "Please enter a new Entry or delete and select existing from above!",
    number: "Plase enter a float numnber!"
});


