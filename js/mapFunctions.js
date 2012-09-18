/**
 * @file mapFunctions.js
 * @version $Id$
 * @author Florian Topf
**/
//-----------------------------------------------------------------------------------------------------------
//SOME VARIABLES FOR GOOGLE MAPS
//User Location (Default 0 0)
var initialLocation = new google.maps.LatLng(30, 0);
//Standard Locations (not used)
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

//HELPER FUNCTIONS for GOOGLE MAPS
function handleNoGeolocation(errorFlag, map) {
	//unbedingt bessere default plätze definieren
	//var html = "<b>Default location</b>";
    //var icon = customIcons["myLocation"];
	
	if (errorFlag == true) {
		//alert("Geolocation service failed.");
		//initialLocation = newyork;
    } else {
    	//alert("Your browser doesn't support geolocation. We've placed you in Siberia.");
    	//initialLocation = siberia;
    }
    map.setCenter(initialLocation);
    map.setZoom(2);
    //var marker = new google.maps.Marker({
	//	map: map,
	//	position: initialLocation,
	//	icon: icon.icon,
	//	shadow: icon.shadow
	//});
	//bindInfoWindow(marker, map, infoWindow, html);
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
//Google Maps Integration Testing (Google Maps Api v3)

//Note that using Google Gears requires loading the Javascript
//at http://code.google.com/apis/gears/gears_init.js

//THIS IS FOR THE GENERAL MAP
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
    var html = "<h3>Your current location</h3>";
    var icon = customIcons["myLocation"];
    // Try W3C Geolocation (Preferred)
    if(navigator.geolocation) {
    	browserSupportFlag = true;
        navigator.geolocation.getCurrentPosition(function(position) {
        	initialLocation = new google.maps.LatLng(position.coords.latitude,position.coords.longitude);
        	map.setCenter(initialLocation);
        	// Set marker at User Location
        	var marker = new google.maps.Marker({
        		map: map,
        		position: initialLocation,
        		icon: icon.icon,
        		shadow: icon.shadow
        	});
        	bindInfoWindow(marker, map, infoWindow, html);
        }, function() {
        	handleNoGeolocation(browserSupportFlag, map);	
        });
        // Try Google Gears Geolocation
        } else if (google.gears) {
        	browserSupportFlag = true;
        	var geo = google.gears.factory.create('beta.geolocation');
        	geo.getCurrentPosition(function(position) {
        		initialLocation = new google.maps.LatLng(position.latitude,position.longitude);
        		map.setCenter(initialLocation);
        		// Set marker at User Location
        		var marker = new google.maps.Marker({
        			map: map,
        			position: initialLocation,
        			icon: icon.icon,
        			shadow: icon.shadow
        		});
        		bindInfoWindow(marker, map, infoWindow, html);
        	}, function() {
        		handleNoGeoLocation(browserSupportFlag, map);
        	});
        // Browser doesn't support Geolocation
        } else {
        	browserSupportFlag = false;
        	handleNoGeolocation(browserSupportFlag, map);
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

//-----------------------------------------------------------------------------------------------------------
//THIS IS FOR THE BROWSE/FILTER MAP
$(document).bind('filterMapIsReady', function(e, filterXML) {   	
	$('div.map').hide();
	
	var myOptions = {
      zoom: 4,
      mapTypeId: google.maps.MapTypeId.ROADMAP
	};
	
	//alert(filterXML);
  		
	//Generate Map
	var map = new google.maps.Map(document.getElementById("map"), myOptions);
	//Generate Infowindow
	var infoWindow = new google.maps.InfoWindow;
	
	map.setCenter(initialLocation);
  
    //Fetch Observatory Locations from XML String
  	var json = JSON.parse(filterXML);
	
  	var bounds = new google.maps.LatLngBounds();
  	
 	for (var i = 0; i < json.length; i++) {
 		if (json[i].lat && json[i].lng) {
	  		var point = new google.maps.LatLng(parseFloat(json[i].lat),
	  					parseFloat(json[i].lng));
	  			
	  		bounds.extend (point);
	  			
	  		var id = json[i].id;
	  		//Set information for infowindow
	  		var html = "<h3>" + json[i].name + "</h3>" + 
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
  	}
 	
 	//not needed - never called with toggle
 	map.fitBounds(bounds);
 	
 	if(json.length < 2)
 		map.setZoom(4);
  	
  	map.redraw = function() {
  		gmOnLoad = true;
  	    if(gmOnLoad) {
  	      google.maps.event.trigger(map, "resize");
  	      //map.setCenter(initialLocation);
  	      map.fitBounds(bounds);
  	      
  	      if(json.length < 2)
  	 		map.setZoom(4);
  	      gmOnLoad = false;
  	    } 
  	}

  	$('a.toggle_map').click(function() {
  		$(this).parent().parent().next('div.map').toggle();
  		
  		var text = $(this).text();
  		$(this).text(
  			text == "Show Map" ? "Hide Map" : "Show Map");
  	    
  		if (map != undefined) {
  	        map.redraw(); }
  		return false;
  	});  	
});
