<?php 
/**
 * @file ObservatoryMapAll.php
 * @version $Id$
 * @author Florian Topf, Robert Stöckler
 *
 * @todo maybe improve this ugly trigger on DIV
 */

print "<div><input type='hidden' name='page' value='map'/></div>" . LF ;
//show_message();
print "<h1>Interactive Map of ground-based Observatories</h1>";

print "<p class='home'>
On this map you can see the location of all currently integrated Observatories.
If you agree to the browsers notification, it will determine your current location and 
display it with a blue marker. The map is then centered to your location. You may get more 
information on an observatory by clicking on one of the red markers. Note, that this service
is in experimental state and not fully functionable.
</p>";

print "<div id='map' style='width: 775px; height: 350px'></div>" . LF ;
print "<script>$(document).trigger('mapIsReady');</script>" . LF;

?>