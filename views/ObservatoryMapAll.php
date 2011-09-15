<?php 
/**
 * @file ObservatoryMapAll.php
 * @version $Id$
 * @author Florian Topf, Robert Stöckler
 *
 * @todo maybe improve this ugly trigger on DIV
 * @todo we have to think about the future, 
 * there must be a possibility to load only visible markers at zoom level
 */

print "<div><input type='hidden' name='page' value='map'/></div>" . LF ;
//show_message();
print "<h1>Interactive Map of ground-based Observatories</h1>";

print "<p class='home'>
On this map you can see the location of all <b>currently integrated Observatories</b>.
If you agree to the browsers notification, it will determine <b>your current location</b> and 
display it with a <b>blue marker</b>. The map is then centered to your location. You may get <b>more 
information</b> on an observatory by clicking on one of the <b>red markers</b>. Note, that this service
is in experimental state and not fully functioning.
</p>";


print "<div id='numObservatories'></div>";
print "<div id='map' style='width: 775px; height: 450px'></div>" . LF ;
print "<script>$(document).trigger('mapIsReady');</script>" . LF;

?>