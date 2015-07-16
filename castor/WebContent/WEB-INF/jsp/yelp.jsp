<!DOCTYPE html>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>ED's Test</title>
<jsp:include page="comps/headMandatory.jsp"/>
<!-- BEGIN PAGE LEVEL STYLES -->
<!-- END PAGE LEVEL STYLES -->
</head>

<body class="page-header-fixed page-sidebar-closed-hide-logo page-sidebar-closed-hide-logo">
<jsp:include page="comps/cabecera.jsp"/>
<div class="clearfix"></div>

<!-- BEGIN CONTAINER -->
<div class="page-container">
<jsp:include page="comps/menuCostado.jsp"/>
	
<!-- BEGIN CONTENT -->
<div class="page-content-wrapper">
<div class="page-content">

<div class="row">
	<div class="col-md-9">
		<div class="portlet light">
			<div class="portlet-title">
				<div class="caption caption-md">
					<span class="caption-subject theme-font-color bold uppercase">My Retail: Game Channel</span>
				</div>
			</div>
			
			<div class="portlet-body">
				<div id="divGMap" class="gmaps" style="height:700px;"></div>
			</div>
		</div>
	</div>
	
	<div class="col-md-3">
		<div class="portlet light">
			<div class="portlet-title">
				<div class="caption caption-md">
					<span class="caption-subject theme-font-color bold uppercase">Options</span>
				</div>
			</div>
			
			<form:form id="frmYelpSearch" method="post" modelAttribute="oficina">
			<div class="portlet-body form" style="height:700px;">
				<div class="row">
					<div class="col-md-12">
						<div class="form-group">
							<input id="txtDistance" class="form-control" placeholder="Distance (miles)" name="ciudad"/>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-md-12 text-right">
						<a href="#" class="btn yellow" onclick="yelpSearch();">Yelp <i class="fa fa-search"></i></a>
					</div>
				</div>
			</div>
			</form:form>
		</div>
	</div>
</div>
	
</div>
</div>
<!-- END CONTENT -->
</div>
<!-- END CONTAINER -->

<jsp:include page="comps/footer.jsp"/>
<jsp:include page="comps/corePlugins.jsp"/>
<!-- BEGIN PAGE LEVEL PLUGINS -->
<!-- END PAGE LEVEL PLUGINS -->

<!-- BEGIN PAGE LEVEL SCRIPTS -->
<script src="assets/global/scripts/metronic.js" type="text/javascript"></script>
<script src="assets/admin/layout4/scripts/layout.js" type="text/javascript"></script>
<script src="http://maps.google.com/maps/api/js?sensor=true&v=3&libraries=geometry" type="text/javascript"></script>
<script src="http://google-maps-utility-library-v3.googlecode.com/svn/trunk/markerclusterer/src/markerclusterer.js" type="text/javascript"></script>
<!-- END PAGE LEVEL SCRIPTS -->
<script>
jQuery(document).ready(function() {   
	Metronic.init(); // init metronic core components
	Layout.init(); // init current layout
	
	yelpSearch();
});
</script>
<script>
function yelpSearch(){
	$.ajax({
 		url: 'ajaxYelp',
 		type: 'post',
 		dataType: 'json',
 		data: $('#frmYelpSearch').serialize(),
 		success: function(data){
 			initGMap(data.businesses);
 		}
 	});
}
</script>

<script>
function initGMap(entidades){
	var location = new google.maps.LatLng(40.711617, -73.941617);
	
    var mapOptions = {
      center: location,
      zoom: 12,
      mapTypeId: google.maps.MapTypeId.TERRAIN 
    };
    
    var map = new google.maps.Map(document.getElementById("divGMap"), mapOptions);
    
    var image = 'assets/admin/layout4/img/markers/m_black00.png';
    var marker = new google.maps.Marker({
		position: location,
		icon: image,
		map: map
	});
    marker.setMap(map);
    
    
	//Add circle overlay and bind to marker
	var distance = Number($('#txtDistance').val());
	var circle = new google.maps.Circle({
    	map: map,
      	radius: distance,    // in metres
      	fillColor: '#AA0000',
      	fillOpacity: 0.1,
      	strokeWeight: 2,
      	strokeOpacity: 0
    });
    circle.bindTo('center', marker, 'position');
    
    
    
    var markers  = [];
    var bounds = new google.maps.LatLngBounds();
    
	//alert(entidades.length);
	$.each(entidades, function(i, lugar){
		//alert(lugar.location.coordinate.latitude + ", " + lugar.location.coordinate.longitude);
		
		var location2 = new google.maps.LatLng(lugar.location.coordinate.latitude, lugar.location.coordinate.longitude);
		
		var marker2 = new google.maps.Marker({
			position: location2,
			map: map
		});
		
		marker2.setMap(map);
		markers.push(marker2);
		
		bounds.extend(location2);
		
		var image_url = '';
		if(typeof lugar.image_url == "undefined"){
			image_url = 'http://s3-media4.fl.yelpcdn.com/assets/srv0/yelp_styleguide/c73d296de521/assets/img/default_avatars/business_90_square.png';
		}else{
			image_url = lugar.image_url;
		}
		var contentString = '<div><a href="'+ lugar.url +'" target="_blank">'+ lugar.name +'</a></br><img src="'+ lugar.rating_img_url +'"/></br><image src="'+ image_url +'"/></div>';
	    var infowindow = new google.maps.InfoWindow({
		      content: contentString
		});
	    google.maps.event.addListener(marker2, 'click', function() {
			infowindow.setContent(contentString);
			infowindow.open(map, this);
	    });
	});
	
	map.fitBounds(bounds);
	
	var mcOptions = {gridSize: 50, maxZoom: 15};
	var mc = new MarkerClusterer(map, markers, mcOptions);
}
</script>
</body>
</html>