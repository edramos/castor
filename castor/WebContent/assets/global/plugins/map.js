    //JQuery (accessed using $j) needs to be loaded before this file
    
    var geocoder;	
        
    //Initialization of Google Map, pass in the div container, width and height of the required map
    function initGoogleMap(container, width, height)
    {
        $j(container).css("width", width);
        $j(container).css("height", height);
        
        //-- ADD CUSTOM STYLE TO THE MAP
        //1.Turns off the visibility of green colored parks
        //2.Makes the map slightly grayscale with saturation levels
        //3.Turns road layer on, will turn off far zoom levels
        //4.Turns transit layer on, will turn off far zoom levels
		var style = [
		  {
		    "featureType": "poi.park",
		    "stylers": [
		      { "visibility": "off" }
		    ]
		  },{
			featureType: "all",
      		elementType: "all",
      		stylers: [
        		{ saturation: -100 }
      		]		  
		  },{
		    "featureType": "road",
		    "stylers": [
		      { "visibility": "on" }
		    ]
		  },{
			"featureType": "transit",
			"stylers": [
			  { "visibility": "on" }
			]
		  }		  		  
		];
		//--
		        
        var mapOptions = {
            mapTypeId: google.maps.MapTypeId.ROADMAP,
            zoom: 14,
            scrollwheel: false,
            streetViewControl: false,
            mapTypeControlOptions: {style: google.maps.MapTypeControlStyle.HORIZONTAL_BAR},
            navigationControlOptions: {style: google.maps.NavigationControlStyle.DEFAULT}, /*DEPRECATED*/            
            /* PEGMAN CONTROL FOR STREET VIEW */
            streetViewControl: true,
            /*
            streetViewControlOptions: {
                position: google.maps.ControlPosition.LEFT_TOP
            },
            */
            styles: style,
            scaleControl: true
        }; 
         
        var googleMap = new google.maps.Map($j(container).get(0), mapOptions); 
                      
        google.maps.event.addListener(googleMap, 'click', function(event) {
            if(infoWindow != null)
              infoWindow.close();
            if(typeof onMapClick == 'function')
                onMapClick(googleMap, event.latLng); //This function must be implemented
        });
        
        google.maps.event.addListener(googleMap, 'drag', function() {
            if(typeof onMapDrag == 'function')
                onMapDrag(googleMap); //This function must be implemented
        });
        
        google.maps.event.addListener(googleMap, 'zoom_changed', function() {
            if(typeof onMapZoomChanged == 'function')
                onMapZoomChanged(googleMap); //This function must be implemented              
            google.maps.event.addListenerOnce(googleMap, 'tilesloaded', function()
            {
                var d = centerToCornerDistance(googleMap);
                var approximateMapRadius = d * 0.80; //Map div may not be a square
                if(typeof onMapZoomChangedAndTileLoaded == 'function')
                    onMapZoomChangedAndTileLoaded(googleMap, approximateMapRadius.toFixed(1)); //This function must be implemented                
            });                                    
            if (googleMap.getZoom() < 11) //Turn off road and transit layer style when zoom level is less than 11
            {
	            var zoomLessThan11Style = [
				  {
				    "featureType": "poi.park",
				    "stylers": [
				      { "visibility": "off" }
				    ]
				  },{
					featureType: "all",
		      		elementType: "all",
		      		stylers: [
		        		{ saturation: -100 }
		      		]		  
				  },	            
	              {
				    "featureType": "road",
				    "stylers": [
				      { "visibility": "off" }
				    ]
				  },{
					"featureType": "transit",
					"stylers": [
					  { "visibility": "off" }
					]
				  }	
	            ];
	            var options = {
	            	styles: zoomLessThan11Style
	            };
	            googleMap.setOptions(options);            	
            }
            else //set the initial style back
            {
	            var options = {
	            	styles: style
	            };
	            googleMap.setOptions(options);            
            }
        });
        
        /*
        var streetview = googleMap.getStreetView();        
        google.maps.event.addListener(streetview, 'pano_changed', function() {            
            alert('pano_changed');
        });        
        google.maps.event.addListener(streetview, 'position_changed', function() {            
            alert('position_changed');
        });            
        google.maps.event.addListener(streetview, 'visible_changed', function() {            
            if (streetview.getVisible())
            {
                onPegmanDropped(streetview);
            }                
        });                 
        */
        
        if (typeof resetMap == 'function')
        	addButton(googleMap, 'Reset', 'Reset', resetMap);
        
        return googleMap;
    }
    
    function addMarker(googleMap, latLng, markerIcon, markerId)
    {
    	var shadow = null;
    	var size;
    	var origin;
    	if (markerIcon == null || 
    		markerIcon == "markerGreen" || markerIcon == "markerRed" || markerIcon == "markerOrange" || markerIcon == "markerGray" || 
    		markerIcon == "markerSmallRed" || markerIcon == "markerSmallOrange" ||
    		markerIcon == "markerLargeGreen" || markerIcon == "markerLargeOrange" || markerIcon == "markerLargeGray")
    	{    		
    		var markerImageUrl = '../images/map_icons.png'; //Relative url, this image must be put inside images folder
    		
    		var shadowSize = new google.maps.Size(23,21);
    		var shadowOrigin = new google.maps.Point(316,166);
    		var shadowAnchor = new google.maps.Point(0,21);
    		shadow = new google.maps.MarkerImage(markerImageUrl, shadowSize, shadowOrigin, shadowAnchor);
    		    		
    		size = new google.maps.Size(20,34);
    		if (markerIcon == null || markerIcon == "markerRed")
    			origin = new google.maps.Point(113,154);
			if (markerIcon == "markerGreen")
				origin = new google.maps.Point(42,154);
			if (markerIcon == "markerOrange")
				origin = new google.maps.Point(183,154);
			if (markerIcon == "markerGray")
				origin = new google.maps.Point(252,154);								
			if (markerIcon == "markerSmallRed")
			{
				origin = new google.maps.Point(117,256);
				size = new google.maps.Size(12,20);
				shadow = null;
			}
			if (markerIcon == "markerSmallOrange")
			{
				origin = new google.maps.Point(187,256);
				size = new google.maps.Size(12,20);
				shadow = null;
			}			
			if (markerIcon == "markerLargeGreen" || markerIcon == "markerLargeOrange" || markerIcon == "markerLargeGray")
			{
	    		var shadowSize = new google.maps.Size(32,30);
	    		var shadowOrigin = new google.maps.Point(316,38);
	    		var shadowAnchor = new google.maps.Point(0,30);	    		
	    		shadow = new google.maps.MarkerImage(markerImageUrl, shadowSize, shadowOrigin, shadowAnchor);
	    		size = new google.maps.Size(27,47);
	    		if (markerIcon == "markerLargeGreen")
	    			origin = new google.maps.Point(38,21);
	    		if (markerIcon == "markerLargeOrange")
	    			origin = new google.maps.Point(179,21);
	    		if (markerIcon == "markerLargeGray")
	    			origin = new google.maps.Point(248,21);	    			
			}
    		var markerImage = new google.maps.MarkerImage(markerImageUrl, size, origin);    		
    		//markerIcon = markerImage; 
    	}    	
        var marker = new google.maps.Marker({
            map: googleMap, 
            position: latLng,
            icon: markerImage,
            shadow: shadow,
            id: markerId,
            markerIcon: markerIcon
        });
       		
        return marker;                                                 
    }
    
    //Add text to marker image icon using HTML5 canvas
    function addMarkerText(marker, text)
    {
    	var markerImage = marker.getIcon();
    	var url = markerImage.url; //The url of the sprite image
    	var origin = markerImage.origin; //The position of the image within a sprite
    	var size = markerImage.size; //The display size of the sprite or image
    	    	
		var canvas = document.createElement("canvas"); //Create a canvas node 
		var context = canvas.getContext("2d"); //Set the canvas context to draw in 2d mode
		var image = new Image(); //Create a new image object
		image.onload = function() //Asynchronous function to execute when image has loaded 
		{
			canvas.width = size.width;
			canvas.height = size.height;				
			context.drawImage(image, origin.x, origin.y, size.width, size.height, 0, 0, size.width, size.height); //Draw image on canvas with specified attributes
			context.textAlign = "center";
			context.textBaseline = "bottom";
			context.font = "bold 12px Arial";
			context.fillStyle = "white";
			if (marker.markerIcon == "markerLargeGray")
				context.fillStyle = "black";			
			context.fillText(text, canvas.width/2, canvas.height/2); //Draw the text on the canvas

			var newImageData = canvas.toDataURL("image/png"); //Get the new image in Data URI scheme	
			var newMarkerImage = new google.maps.MarkerImage(newImageData); //Create a new google markerImage object
			marker.setIcon(newMarkerImage); //assign the new image as the marker icon
		}
		image.src = url;    	
    }

    //Remove a previously added marker from the map in which it was added
    function removeMarker(marker)
    {
        marker.setMap(null);
    } 

    function addStyledMarker(googleMap, latLng, markerId, color, letter)
    {
        var marker = new StyledMarker({
            map: googleMap,
            position: latLng,
            styleIcon: new StyledIcon(StyledIconTypes.MARKER, {color: color , text:letter}),
            id : markerId                                                   
        });        
        return marker;                                                 
    }    
    
    var infoWindow = null; //Only 1 infoWindow should be open at a time    
    function addInfoWindow(googleMap, marker, infoWindowContent, width, height)
    {                    
        google.maps.event.addListener(marker, 'click', function()
        {
            if (infoWindow != null) //Close previously open infowindow if exists
                infoWindow.close(googleMap, marker);
            var markerPoint = pointFromMarker(marker, googleMap);
            var quadrant = quadrantFromPoint(markerPoint, googleMap);           	            	
            var pixelOffset = pixelOffsetFromQuadrant(quadrant, parseInt(width), parseInt(height));                
            infoWindow = getInfoBox(infoWindowContent, width, height, pixelOffset);

			var anchorPositionClass;
            if (quadrant == 1)
            	anchorPositionClass = "topRight";
            if (quadrant == 2)
            	anchorPositionClass = "topLeft";
            if (quadrant == 3)
            	anchorPositionClass = "bottomLeft";
            if (quadrant == 4)
            	anchorPositionClass = "bottomRight";             	

        	infoWindow.setOptions({
        		boxClass: "hover " + anchorPositionClass
        	});        	       	
        				            	            
            google.maps.event.addListener(infoWindow, 'closeclick', function()
            {             
                infoWindow.close(googleMap, marker);
                infoWindow = null;
                if(typeof onInfoWindowCloseClick == 'function')
                    onInfoWindowCloseClick(marker); //This function must be implemented
            });                        
            infoWindow.open(googleMap, marker);
            if(typeof onMarkerClick == 'function')
                onMarkerClick(marker); //This function must be implemented               
        });        
    }
    
    function fitMarkers(googleMap, markers)
    {
        var bounds = new google.maps.LatLngBounds();
        for ( var i = 0; i < markers.length; i++ )        
            bounds.extend(markers[i].getPosition());        
        if(markers.length > 1)
            googleMap.fitBounds(bounds);                        
        else
        {
            googleMap.setCenter(bounds.getCenter());
            googleMap.setZoom(15);                                          
        }
    }
    
    function refreshGoogleMap(googleMap, markers)
    {                
        var center = googleMap.getCenter();
        google.maps.event.trigger(googleMap, 'resize');                    
        googleMap.setCenter(center); 
        fitMarkers(googleMap, markers);              
    }

    //This function should be called whenever the map div is 
    //resized or refreshed or redisplayed (hide/show)
    //This will redraw the map on the screen and prevent gray colours from appearing    
    function resizeGoogleMap(googleMap)
    {
        var center = googleMap.getCenter(); //Use the current center position to center the map after resize
        google.maps.event.trigger(googleMap, 'resize');                    
        googleMap.setCenter(center);
    }                
    
    //Adds a button to the googleMap at the Top Right position
    //actionOnClick is a function which will be passed and run on button click
    function addButton(googleMap, label, title, actionOnClick)
    {
        var buttonControl = document.createElement('DIV');        
        buttonControl.innerHTML = label;
        $j(buttonControl).attr('title', title);
        $j(buttonControl).addClass('googleMapButton noSelect pointer');        
        googleMap.controls[google.maps.ControlPosition.TOP_RIGHT].push(buttonControl);
        google.maps.event.addDomListener(buttonControl, 'click', actionOnClick); 
        return buttonControl;   
    } 
        
    function initStreetView(container, width, height)
    {
        $j(container).css("width", width);
        $j(container).css("height", height);
        var streetviewOptions = {
            addressControl: false,
            panControl: true,
            scrollwheel: false
        };
        var panorama = new google.maps.StreetViewPanorama($j(container).get(0), streetviewOptions); 
        return panorama;               
    }

    function getStreetView(container, panorama, latLng)
    {
        var streetViewService = new google.maps.StreetViewService();
        //getPanoramaByLocation takes in lat/long, radius, callback function
        //Searches for StreetView within the given radius
        //Note from Google documentation: "If the radius is 50 meters or less, 
        //the panorama returned will be the nearest panorama to the given location."
        streetViewService.getPanoramaByLocation(latLng, 50, function(data,status)
        {          
            if (status == google.maps.StreetViewStatus.OK) 
            {          
                var panoramaID = data.location.pano;
                panorama.setPano(panoramaID);
                var heading = google.maps.geometry.spherical.computeHeading(data.location.latLng, latLng);
                var pov = new Object();
                pov.heading = heading; //Points towards the latlng from the location of streetview camera
                pov.pitch = 0; //default pitch
                pov.zoom = 1; //default zoom
                panorama.setPov(pov);
                panorama.setVisible(true);
            }
            else
            {
                //alert('Street View not found within 50 metres of the address. Reason: '+status);
                //panorama.setVisible(false);
            	/*
                var msgContainer = $j("<div></div>");
                msgContainer.css("text-align", "center");
                msgContainer.css("width", "100%");
                msgContainer.css("height", "100%");
                msgContainer.css("position", "absolute");
                msgContainer.css("top", "45%");
                msgContainer.css("font-size", "13px");
                msgContainer.css("font-weight", "bold");
                msgContainer.html('Street View Not Available');
                $j(container).html(msgContainer);
                */
            	$("#streetview").hide();
            	$("#streetviewNA").show();
            }  
        });           
    }
    
    function resizeStreetView(panorama)
    {
        var pano = panorama.getPano();
        google.maps.event.trigger(panorama, 'resize');        
        panorama.setPano(pano);
    }    
           
    //This function will zoom the googleMap at the given centerLatLng
    //by the given radiusInMiles
    function zoomByDistance(googleMap, centerLatLng, radiusInMiles)
    {
        var radiusInMeters = radiusInMiles * 1609.344; //miles to meters
        var circle = new google.maps.Circle(
            {
                map: googleMap,
                center: centerLatLng,
                radius: radiusInMeters,
                fillOpacity: 0,
                strokeOpacity: 0                 
            });
        var latLngBounds = circle.getBounds();
        googleMap.fitBounds(latLngBounds);
    }
       
    //-------------------------------------------------------------------------------------------- 
 
    //Add Custom controls to the map
    //Control to expand the map/streetview for property page
    function initGoogleMapResizeControl(googleMap, panorama)
    {
        var mapDiv = googleMap.getDiv();
        var streetViewDiv = $j("#streetview"); //!Need to find a way to get Div from streetview object!
        var controlExpandMap = document.createElement('div');
        controlExpandMap.index = -1;
        $j(controlExpandMap).attr("title","Maximize");
        $j(controlExpandMap).addClass('controlExpandMapStyle');
        $j(controlExpandMap).addClass('googleMapButton pointer noSelect');
        googleMap.controls[google.maps.ControlPosition.TOP_RIGHT].push(controlExpandMap);  
        google.maps.event.addDomListener(controlExpandMap, 'click', function() {
        var status = $j(controlExpandMap).attr("title");
        if(status=='Maximize')
        {
            $j(streetViewDiv).hide();
            $j(mapDiv).css("width","100%");
            resizeGoogleMap(googleMap);
            resizeStreetView(panorama);
            $j(controlExpandMap).attr("title","Minimize");
            $j(controlExpandMap).removeClass('controlExpandMapStyle');
            $j(controlExpandMap).addClass('controlContractMapStyle');
        }    
        if(status=='Minimize')
        {
            $j(streetViewDiv).show();
            $j(mapDiv).css("width","50%");
            resizeGoogleMap(googleMap);
            resizeStreetView(panorama);
            $j(controlExpandMap).attr("title","Maximize");
            $j(controlExpandMap).removeClass('controlContractMapStyle');
            $j(controlExpandMap).addClass('controlExpandMapStyle');          
        }
        });    
    }
    
    function initStreetViewResizeControl(googleMap, panorama)
    {
        var mapDiv = googleMap.getDiv();
        var streetViewDiv = $j("#streetview"); //!Need to find a way to get Div from streetview object!    
        var controlExpandStreetview = document.createElement('div');
        $j(controlExpandStreetview).attr("title","Maximize");
        $j(controlExpandStreetview).addClass('controlContractMapStyle');
        $j(controlExpandStreetview).addClass('googleMapButton pointer noSelect');
        panorama.controls[google.maps.ControlPosition.TOP_RIGHT].push(controlExpandStreetview);  
        google.maps.event.addDomListener(controlExpandStreetview, 'click', function() {
            var status = $j(controlExpandStreetview).attr("title");
            if(status=='Maximize')
            {
                $j(mapDiv).hide();
                $j(streetViewDiv).css("width","100%");
                resizeStreetView(panorama);
                resizeGoogleMap(googleMap);        
                $j(controlExpandStreetview).attr("title","Minimize");
                $j(controlExpandStreetview).removeClass('controlContractMapStyle');
                $j(controlExpandStreetview).addClass('controlExpandMapStyle'); 
            }    
            if(status=='Minimize')
            {
                $j(mapDiv).show();
                $j(streetViewDiv).css("width","49%");
                resizeStreetView(panorama);
                resizeGoogleMap(googleMap);
                $j(controlExpandStreetview).attr("title","Maximize");   
                $j(controlExpandStreetview).removeClass('controlExpandMapStyle');
                $j(controlExpandStreetview).addClass('controlContractMapStyle');        
            }
        });
        
        //Fullscreen control
        /*
        var e = document.getElementById('streetview');
        if (e.requestFullscreen || e.webkitRequestFullscreen || e.mozRequestFullScreen || e.msRequestFullscreen)
    	{
	        var fullscreenBtn = document.createElement('div');
	        var fullscreenIcon = document.createElement('i');
	        $j(fullscreenBtn).addClass('googleMapButton pointer noSelect');
	        $j(fullscreenIcon).addClass('icon-fullscreen');
	        $j(fullscreenBtn).append($j(fullscreenIcon));
	        panorama.controls[google.maps.ControlPosition.TOP_RIGHT].push(fullscreenBtn);
	        google.maps.event.addDomListener(fullscreenBtn, 'click', function() {
	            var i = document.getElementById('streetview');
	            
	            //If already in full screen exit fullscreen mode
	            if (document.fullscreenElement || document.webkitFullscreenElement || document.mozFullScreenElement || document.msFullscreenElement)
	        	{
		            if (document.exitFullscreen)
		                document.exitFullscreen();
		            else if (document.webkitExitFullscreen)
		                document.webkitExitFullscreen();
		            else if (document.mozCancelFullScreen)
		                document.mozCancelFullScreen();
		            else if (document.msExitFullscreen)
		                document.msExitFullscreen();            
	        	}
	            else
	        	{
		            if (i.requestFullscreen)
		                i.requestFullscreen();
		            else if (i.webkitRequestFullscreen)
		                i.webkitRequestFullscreen();
		            else if (i.mozRequestFullScreen)
		                i.mozRequestFullScreen();
		            else if (i.msRequestFullscreen)
		                i.msRequestFullscreen();
	        	}
	        });
    	}
    	*/
    }

    function initStreetViewSaveControl(panorama)
    {
        var saveControl = document.createElement('DIV'); 
        panorama.controls[google.maps.ControlPosition.TOP_RIGHT].push(saveControl);  
        saveControl.innerHTML = "Save";
        $j(saveControl).addClass('googleMapButton noSelect pointer');
        $j(saveControl).prop('id','btnSaveStreetview');
        google.maps.event.addDomListener(saveControl, 'click', function()
        {        	
        	$j(saveControl).removeClass('pointer');
            $j(saveControl).html("Saving...");
            $j(saveControl).css("color","gray");            
        	saveStreetview(JSON.stringify(panorama.getPov()), panorama.getPosition().toUrlValue());
        	$j(saveControl).addClass('pointer');
            $j(saveControl).html("Save");
            $j(saveControl).css("color","black");        	
            //clearInstanceListeners(saveControl);
        }); 
        return saveControl;   
    }    
    
    function resetStreetViewSaveControl()
    {                
    	$j('#btnSaveStreetview').addClass('pointer');
        $j('#btnSaveStreetview').html("Save");
        $j('#btnSaveStreetview').css("color","black");
    	//saveControl.innerHTML = "Save";
        //saveControl.style.color = "black";        
    }    
    
    //Convert Address to a Latitude/Longitude position
    //geocoder.geocode is an asynchronous call to google's servers
    //onGeocodeComplete is a function which takes in the result as the argument
    //Note: Geocoding many addresses at the same time can produce the OVER_QUERY_LIMIT error.
    function geocode(address, onGeocodeComplete)
    {
        if (geocoder == null)
            geocoder = new google.maps.Geocoder();            
        geocoder.geocode({'address':address}, function(results, status)
        {
        	var result;            
            if (status == google.maps.GeocoderStatus.OK)
            {
                result = results[0]; //Take only the first result returned from geocoding                
            }
            else
            {
            	result = null;
                //alert('Geocode of Address: \"'+ address +'\" was not successful for the following reason: '+status);
            }            
            onGeocodeComplete(result);   
        });      
    }
    
    //Geocode with a partial address and return all matches
    function partialGeocode(address, onPartialGeocodeComplete)
    {
    	var results = matchingAddress(address);
    	onPartialGeocodeComplete(results);
    }
    
    //Find full address matches given a part of the address
    function matchingAddress(address, stateFilter)
    {
    	var deferred = $j.Deferred();
        if (geocoder == null)
            geocoder = new google.maps.Geocoder();
        var request = new Object();
        request.address = address;
        var componentRestrictions = new Object();
        componentRestrictions.country = 'US';
        //console.log("stateFilter is: " + stateFilter);
        if (stateFilter != null && stateFilter != '')
        	componentRestrictions.administrativeArea = stateFilter;
        request.componentRestrictions = componentRestrictions;        
        geocoder.geocode(request, function(results, status) //asynchronous
        {
        	var matches = new Array();     
            if (status == google.maps.GeocoderStatus.OK)
            {            
            	for (var i=0; i<results.length; i++)
                	matches.push(results[i]);
            }
            else
            {
            	matches = null;
            }             
 
    		deferred.resolve(matches);
        }); 
        return deferred.promise();    	
    }
    
    function getInfoBox(content, width, height, pixelOffset)
    {
        var infoBoxOptions = {
            content: content,
            disableAutoPan: true,
            pixelOffset: pixelOffset,
            zIndex: null,
            /*
            boxStyle: { 
                background: "white",
                width: width,
                height: height,
                fontSize: "12px",
                padding: "2px",
                border: "1px solid gray", 
                overflow: "hidden",
                borderRadius: "10px"                 
            },
            */
            boxClass: "hover",
            boxStyle: { 
                width: width,
                height: height                
            }, 
            /*           
            closeBoxMargin: "2px 2px 2px 2px",
            closeBoxURL: "https://ama-llc.s3.amazonaws.com/Venus/Public/close.gif",
            */
            closeBoxURL: "",
            infoBoxClearance: new google.maps.Size(1, 1),
            isHidden: false,
            pane: "floatPane",
            enableEventPropagation: false
        };
        return (new InfoBox(infoBoxOptions));      
    }
    
    function getMarker(markers, markerId)
    {
        for(var i=0; i< markers.length; i++)
        {
            if(markers[i].id == markerId) 
                return markers[i];
        }     
    }

    //Given a marker this function returns the point with reference to the current visible map in pixels
    function pointFromMarker(marker, map)
    {
        var markerLatLng = marker.getPosition();
        var bounds = map.getBounds();
        var projection = map.getProjection();
        var northEastBound = bounds.getNorthEast();            
        var southWestBound = bounds.getSouthWest();
        var northWestBound = new google.maps.LatLng(northEastBound.lat(), southWestBound.lng());
        var northEastPoint = projection.fromLatLngToPoint(northEastBound); //A Point on world coordinates
        var southWestPoint = projection.fromLatLngToPoint(southWestBound);           
        var northWestPoint = projection.fromLatLngToPoint(northWestBound);
        var markerPoint = projection.fromLatLngToPoint(markerLatLng);
        var scale = Math.pow(2, map.getZoom()); //Scale Point size to actual Pixel size          
        var width = (northEastPoint.x - southWestPoint.x) * scale; //width in pixels of the visible map
        var height = (southWestPoint.y - northEastPoint.y) * scale; //height in pixels of the visible map
        //alert('width: '+width + ' height: '+height);
        //width and height obtained above should be the same width and height as the map div
        var markerOffsetX = (markerPoint.x - northWestPoint.x) * scale;
        var markerOffsetY = (markerPoint.y - northWestPoint.y) * scale;
        var scaledMarkerPoint = new google.maps.Point(markerOffsetX, markerOffsetY);
        return scaledMarkerPoint;  
    }
            
    //Given a google map point, return the quadrant in which it lies
    //There are four quadrants - 1,2,3,4
    //1 is Top Right, 2 is Top Left, 3 is Botton Left, 4 is Bottom Right
    //This function helps in calculating where to display the popup based on the marker point
    function quadrantFromPoint(point, map)
    {
        var mapWidth = $j(map.getDiv()).width();
        var mapHeight = $j(map.getDiv()).height();
        var referenceX = mapWidth/2;
        var referenceY = mapHeight/2;
        if (point.x >= referenceX)
        {
            if (point.y <= referenceY)
                return 1;
            if (point.y > referenceY)
                return 4;
        }
        if (point.x < referenceX)
        {
            if (point.y <= referenceY)
                return 2;
            if (point.y > referenceY)
                return 3;
        } 
    }
    
    //pixelOffset is the offset, in pixels, of the tip of the info window from
    //the point on the map at whose geographical coordinates the info window is anchored.
    function pixelOffsetFromQuadrant(quadrant, popupWidth, popupHeight)
    { 
        if (quadrant == 1)
            return (new google.maps.Size(-(popupWidth+35), -40));
        if (quadrant == 2)
            return (new google.maps.Size(35, -40)); 
        if (quadrant == 3)
            return (new google.maps.Size(35, -(popupHeight+5)));
        if (quadrant == 4)
            return (new google.maps.Size(-(popupWidth+35), -(popupHeight+5)));
    	/*       
        if (quadrant == 1)
            return (new google.maps.Size(-(popupWidth+5), 0));
        if (quadrant == 2)
            return (new google.maps.Size(0, 0));
        if (quadrant == 3)
            return (new google.maps.Size(0, -(popupHeight+40)));
        if (quadrant == 4)
            return (new google.maps.Size(-(popupWidth+5), -(popupHeight+40)));  
        */                                  
    }    
    
    function urlValueToLatLng(value)
    {        
        if (value != null && value != '')
            return new google.maps.LatLng(value.split(",")[0] , value.split(",")[1]);
        else
            return null;
    }
    
    //Distance from the center to the corner of the map div
    function centerToCornerDistance(googleMap)
    {
        var bounds = googleMap.getBounds();        
        var center = bounds.getCenter();
        var ne = bounds.getNorthEast();        
        var distance = computeDistanceBetween(center, ne);        
        //alert(distance);        
        return distance;     
    }
    
    //Returns distance between two latlng points in miles
    //Uses Google Maps API Geometry library, "libraries=geometry" parameter required in script src
    function computeDistanceBetween(latLng1, latLng2)
    {
        var distanceInMetres = google.maps.geometry.spherical.computeDistanceBetween(latLng1, latLng2);
        var distanceInMiles = distanceInMetres * 0.000621371192;
        return distanceInMiles;
    } 
    
    //Get the postal code from the GeocoderResult object
    function postalCodeFromGeocoderResult(result)
    {
    	var addressComponents = result.address_components;
    	for (a in addressComponents)
    	{
    		var types = addressComponents[a].types;
    		for (t in types)
    		{
    			if (types[t] == 'postal_code')
    				return addressComponents[a].long_name;
    		}
    	}
    	return null;
    }
    
    //Get the street address from the GeocoderResult object
    function streetAddressFromGeocoderResult(result)
    {
    	var addressComponents = result.address_components;
		var street_number = '';
		var route = '';    	
    	for (a in addressComponents)
    	{
    		var types = addressComponents[a].types;
    		for (t in types)
    		{
    			if (types[t] == 'street_address')
    				return addressComponents[a].long_name;
    			if (types[t] == 'street_number')
    				street_number = addressComponents[a].long_name;
    			if (types[t] == 'route')
    				route = addressComponents[a].long_name;	    				
    		}
    	}
    	return $j.trim(street_number + ' ' + route);    	
    }
    
    //Get the city from the GeocoderResult object
    function cityFromGeocoderResult(result)
    {
    	var addressComponents = result.address_components;
    	for (a in addressComponents)
    	{
    		var types = addressComponents[a].types;
    		for (t in types)
    		{
    			if (types[t] == 'locality')
    				return addressComponents[a].long_name;
    			if (types[t] == 'administrative_area_level_3')
    				return addressComponents[a].long_name;    			
    		}
    	}
    	return null;
    }
    
    //Get the city from the GeocoderResult object
    function countyFromGeocoderResult(result)
    {
    	var addressComponents = result.address_components;
    	for (a in addressComponents)
    	{
    		var types = addressComponents[a].types;
    		for (t in types)
    		{
    			if (types[t] == 'administrative_area_level_2')
				{
    				var county = addressComponents[a].long_name;
    				county = county.replace("County", ""); //Remove the word "County"
    				county = county.trim();
    				return county;
				}
    		}
    	}
    	return null;
    }     
    
    //Get the state from the GeocoderResult object
    function stateFromGeocoderResult(result)
    {
    	var addressComponents = result.address_components;
    	for (a in addressComponents)
    	{
    		var types = addressComponents[a].types;
    		for (t in types)
    		{
    			if (types[t] == 'administrative_area_level_1')
					return addressComponents[a].short_name;
    				//return addressComponents[a].short_name + ' - ' + addressComponents[a].long_name;
    		}
    	}
    	return null;
    }      