var MapsGoogle = function () {

	var init_map = function() {
		var var_location = new google.maps.LatLng(-12.045937, -77.030530);

	    var var_mapoptions = {
	      center: var_location,
	      zoom: 4
	    };

		var var_marker = new google.maps.Marker({
			position: var_location,
			map: var_map,
			title:"Lima"});

	    var var_map = new google.maps.Map(document.getElementById("map-container"),
	        var_mapoptions);

		var_marker.setMap(var_map);	

	  }

	
	
	

    /*var mapMarker = function () {
        var map = new GMaps({
            div: '#gmap_marker',
           lat: -51.38739,
                lng: -6.187181,
        });
        map.addMarker({
           lat: -51.38739,
                lng: -6.187181,
            title: 'Lima',
            details: {
                database_id: 42,
                author: 'HPNeo'
            },
            click: function (e) {
                if (console.log) console.log(e);
                alert('You clicked in this marker');
            }
        });
        map.addMarker({
            lat: -12.042,
            lng: -77.028333,
            title: 'Marker with InfoWindow',
            infoWindow: {
                content: '<span style="color:#000">HTML Content!</span>'
            }
        });
        map.setZoom(5);
    }*/

    /*var mapPolylines = function () {
        var map = new GMaps({
            div: '#gmap_polylines',
            lat: -12.043333,
            lng: -77.028333,
            click: function (e) {
                console.log(e);
            }
        });

        path = [
            [-12.044012922866312, -77.02470665341184],
            [-12.05449279282314, -77.03024273281858],
            [-12.055122327623378, -77.03039293652341],
            [-12.075917129727586, -77.02764635449216],
            [-12.07635776902266, -77.02792530422971],
            [-12.076819390363665, -77.02893381481931],
            [-12.088527520066453, -77.0241058385925],
            [-12.090814532191756, -77.02271108990476]
        ];

        map.drawPolyline({
            path: path,
            strokeColor: '#131540',
            strokeOpacity: 0.6,
            strokeWeight: 6
        });
    }*/

    /*var mapGeolocation = function () {

        var map = new GMaps({
            div: '#gmap_geo',
            lat: -12.043333,
            lng: -77.028333
        });

        GMaps.geolocate({
            success: function (position) {
                map.setCenter(position.coords.latitude, position.coords.longitude);
            },
            error: function (error) {
                alert('Geolocation failed: ' + error.message);
            },
            not_supported: function () {
                alert("Your browser does not support geolocation");
            },
            always: function () {
                //alert("Geolocation Done!");
            }
        });
    }*/

    var mapGeocoding = function () {
    	var map = null;
    	var myMarker = null;
    	
    	map = new google.maps.Map(document.getElementById('gmap_geocoding'), {
    	    zoom: 7,
    	    center: new google.maps.LatLng(-12.045937, -77.030530),
    	    mapTypeId: google.maps.MapTypeId.ROADMAP
    	});    	
    	
    	
    	var handleAction = function(){
    		var text = $.trim($('#gmap_geocoding_address').val());
	        geocoder = new google.maps.Geocoder();
	        
	        geocoder.geocode({'address':text}, function(results, status){
	        	var result; 
	        	
	            if(status == google.maps.GeocoderStatus.OK){
	                result = results[0]; //Take only the first result returned from geocoding
	                
	                map = new google.maps.Map(document.getElementById('gmap_geocoding'), {
	            	    zoom: 15,
	            	    mapTypeId: google.maps.MapTypeId.ROADMAP
	            	});
	                
	                myMarker = new google.maps.Marker({
	            	    position: results[0].geometry.location,
	            	    draggable: true
	            	});
	                
	            	google.maps.event.addListener(myMarker, 'dragend', function(e) {
	            		alert('Hi' + e.latLng.lat().toFixed(6) + ', ' + e.latLng.lng().toFixed(6));
	            		map.setCenter(myMarker.position);
	            		//
	            		$('#txtLatitud').val(e.latLng.lat().toFixed(6));
	            		$('#txtLongitud').val(e.latLng.lng().toFixed(6));
	            		
	            	});
	                
	                //map.setCenter(results[0].geometry.location);
	                
	                map.setCenter(myMarker.position);
	            	myMarker.setMap(map);
	            	//
	            	var markerLatLng = myMarker.getPosition();
	                alert('Hi2' + markerLatLng.lat().toFixed(6) + ', ' + markerLatLng.lng().toFixed(6));
	                //
            		$('#txtLatitud').val(markerLatLng.lat().toFixed(6));
            		$('#txtLongitud').val(markerLatLng.lng().toFixed(6));
	            }else{
	            	result = null;
	                //alert('Geocode of Address: \"'+ address +'\" was not successful for the following reason: '+status);
	            }            
	               
	        });      
    	    
    		
    		
    		
    		
    		
    	}
    	
    	$('#gmap_geocoding_btn').click(function (e) {
            e.preventDefault();
            handleAction();
        });
    	
        /*var map = new GMaps({
            div: '#gmap_geocoding',
            lat: -12.043333,
            lng: -77.028333
        });

        var handleAction = function () {
            var text = $.trim($('#gmap_geocoding_address').val());
            GMaps.geocode({
                address: text,
                callback: function (results, status) {
                    if (status == 'OK') {
                        var latlng = results[0].geometry.location;
                        map.setCenter(latlng.lat(), latlng.lng());
                        map.addMarker({
                            lat: latlng.lat(),
                            lng: latlng.lng(),
                            drag: true,
                        });
                        Metronic.scrollTo($('#gmap_geocoding'));
                    }
                }
            });
        }
        
        

        $('#gmap_geocoding_btn').click(function (e) {
            e.preventDefault();
            handleAction();
        });

        $("#gmap_geocoding_address").keypress(function (e) {
            var keycode = (e.keyCode ? e.keyCode : e.which);
            if (keycode == '13') {
                e.preventDefault();
                handleAction();
            }
        });*/

    }

   /*var mapPolygone = function () {
        var map = new GMaps({
            div: '#gmap_polygons',
            lat: -12.043333,
            lng: -77.028333
        });

        var path = [
            [-12.040397656836609, -77.03373871559225],
            [-12.040248585302038, -77.03993927003302],
            [-12.050047116528843, -77.02448169303511],
            [-12.044804866577001, -77.02154422636042]
        ];

        var polygon = map.drawPolygon({
            paths: path,
            strokeColor: '#BBD8E9',
            strokeOpacity: 1,
            strokeWeight: 3,
            fillColor: '#BBD8E9',
            fillOpacity: 0.6
        });
    }*/

    /*var mapRoutes = function () {

        var map = new GMaps({
            div: '#gmap_routes',
            lat: -12.043333,
            lng: -77.028333
        });
        $('#gmap_routes_start').click(function (e) {
            e.preventDefault();
            Metronic.scrollTo($(this), 400);
            map.travelRoute({
                origin: [-12.044012922866312, -77.02470665341184],
                destination: [-12.090814532191756, -77.02271108990476],
                travelMode: 'driving',
                step: function (e) {
                    $('#gmap_routes_instructions').append('<li>' + e.instructions + '</li>');
                    $('#gmap_routes_instructions li:eq(' + e.step_number + ')').delay(800 * e.step_number).fadeIn(500, function () {
                        map.setCenter(e.end_location.lat(), e.end_location.lng());
                        map.drawPolyline({
                            path: e.path,
                            strokeColor: '#131540',
                            strokeOpacity: 0.6,
                            strokeWeight: 6
                        });
                    });
                }
            });
        });
    }*/

    return {
        //main function to initiate map samples
        init: function () {
        	init_map();
            //mapMarker();
            //mapGeolocation();
            mapGeocoding();
            /*mapPolylines();
            mapPolygone();
            mapRoutes();*/
        }

    };

}();