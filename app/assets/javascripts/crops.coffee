# # Place all the behaviors and hooks related to the matching controller here.
# # All this logic will automatically be available in application.js.
# # You can use CoffeeScript in this file: http://coffeescript.org/
#
# <style type="text/css">
#       html { height: 100% }
#       body { height: 100%; margin: 0; padding: 0 }
#       #map-canvas { height: 100% }
#   </style>
#   <script type="text/javascript"
#       src="https://maps.googleapis.com/maps/api/js?key=AIzaSyD2hA6Vwr5frB2gsFRvK_KONWlqGC9jFak&sensor=false">
#   </script>
#   <script type="text/javascript">
#     function set_map(state, city){
#       var mapOptions = {
#         center: new google.maps.LatLng(25.687944,-100.309403),
#         zoom: 8,
#         mapTypeId: google.maps.MapTypeId.ROADMAP
#       };
#       var map = new google.maps.Map(document.getElementById("map-canvas"),
#       mapOptions);
#
#       if(state == ""){
#         address = city;
#       }else{
#         address = state + ',' + city;
#       }
#
#       var geocoder = new google.maps.Geocoder();
#
#       geocoder.geocode({
#         'address':address
#       },
#
#       function(result, status){
#         if (status == google.maps.GeocoderStatus.OK){
#           map.setCenter(result[0].geometry.location);
#
#           var marker = new google.maps.Marker({
#             map: map,
#             position: result[0].geometry.location
#           });
#         }else{
#           alert("Geocode was not successful for the following reason: " + status);
#         }
#       });
#       return false;
#     }
#
#     $(document).ready(function(){
#       set_map('<%= @user.state %>', '<%= @user.city %>');
#     })
#   </script>
#
#
#   <label>Name : </label>&nbsp;<%= @user.name %>
#   <br />
#   <label>Location :</label>
#   <br />
#   <br />
#   <div id="map-canvas" style="width:300px;height:200px"/>
