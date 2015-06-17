<!DOCTYPE html>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta charset="utf-8"/>
<title>Castor | Dashboard</title>
<jsp:include page="../comps/headMandatory.jsp"/>
<!-- BEGIN PAGE LEVEL PLUGIN STYLES -->
<!-- END PAGE LEVEL PLUGIN STYLES -->

<!-- BEGIN PAGE STYLES -->
<link href="assets/admin/pages/css/tasks.css" rel="stylesheet" type="text/css"/>
<!-- END PAGE STYLES -->
<link rel="shortcut icon" href="favicon.ico"/>
<style>
.table-scrollable {
    width: 100%;
    overflow-x: auto;
    overflow-y: hidden;
    border: 1px solid #DDD;
    margin: 0px 0px !important;
}
.note {
    margin: 0px;
    padding: 15px 30px 15px 15px;
    border-left: 5px solid #EEE;
    border-radius: 0px 4px 4px 0px;
}
</style>
</head>

<body class="page-header-fixed page-sidebar-closed-hide-logo page-sidebar-closed-hide-logo">
<jsp:include page="../comps/cabecera.jsp"/>
<div class="clearfix"></div>

<!-- BEGIN CONTAINER -->
<div class="page-container">
<jsp:include page="../comps/menuCostado.jsp"/>
<!-- BEGIN CONTENT -->
<div class="page-content-wrapper">
	<div class="page-content">
	<!-- BEGIN PAGE CONTENT INNER -->
	<div class="row">
		<div class="col-md-12">
			<div class="portlet box blue-hoki">
				<div class="portlet-title">
					<div class="caption">Ordenes</div>
					<div class="actions">
						<a class="btn btn-icon-only btn-default btn-sm fullscreen" href="#" data-original-title="" title=""></a>
					</div>
				</div>
				<div class="portlet-body">
					<div id="map-container" class="gmaps" style="height: 700px;"></div>
					
					<table class="table table-scrollable table-hover">
						<tbody id="viewOficinasHandlerbars"></tbody>
					</table>
				</div>
			</div>
		</div>		
	</div>			
	<!-- END PAGE CONTENT INNER -->
	</div>
</div>
<!-- END CONTENT -->
</div>
<!-- END CONTAINER -->
<jsp:include page="../comps/footer.jsp"/>
<jsp:include page="../comps/corePlugins.jsp"/>
<!-- BEGIN PAGE LEVEL PLUGINS -->
<script src="assets/global/plugins/amcharts/amcharts/amcharts.js" type="text/javascript"></script>
<script src="assets/global/plugins/amcharts/amcharts/serial.js" type="text/javascript"></script>
<script src="http://maps.google.com/maps/api/js?sensor=true" type="text/javascript"></script>
<!-- END PAGE LEVEL PLUGINS -->

<!-- BEGIN PAGE LEVEL SCRIPTS -->
<script src="assets/global/scripts/metronic.js" type="text/javascript"></script>
<script src="assets/admin/layout4/scripts/layout.js" type="text/javascript"></script>
<!-- END PAGE LEVEL SCRIPTS -->
<script>
var tipo = '<%= session.getAttribute("tipo") %>';

jQuery(document).ready(function() {    
	Metronic.init(); // init metronic core componets
    Layout.init(); // init layout 
    
    getOrdenes();
});
</script>
<script>
function getOrdenes(){
	$.ajax({
 		url: 'ajaxBuscarOrden',
 		type: 'post',
 		dataType: 'json',
 		success: function(ordenes){
 			
 			initMapa(ordenes);
 			
 		}
 	});
}
function initMapa(entidades){
	
	var var_location = new google.maps.LatLng(-10.045, -75.030);
	
    var var_mapoptions = {
      center: var_location,
      zoom: 6,
      mapTypeId: google.maps.MapTypeId.TERRAIN 
    };
    
    var tipoCliente = (tipo == "cliente")? "Operador":"Cliente";
    
    var var_map = new google.maps.Map(document.getElementById("map-container"), var_mapoptions);
    var infowindow = new google.maps.InfoWindow({});
    var image = 'assets/admin/layout4/img/marker-red_00.png';
    $.each(entidades, function(i, entidad){
    	var var_location2 = new google.maps.LatLng(entidad.lat, entidad.lon);
		var marker = new google.maps.Marker({
			position: var_location2,
			map: var_map,
			title: entidad.nombre,
			icon: image,
			animation: google.maps.Animation.DROP
		});
	
		marker.setMap(var_map);
		
		var contentString = '<div class="note note-warning" style="width:250px;">'+
		'<h4><strong>'+ entidad.nombre +'</strong></h4><ul style="padding-left:10px;"><li>'+ tipoCliente +': '+ entidad.nombreCliente +'</li>'+
		'<li>Tipo: '+ entidad.tipoTrabajo +'</li><li>Estado: '+ entidad.estado +'</li><li>Ubicacion: '+ entidad.ciudad + ', ' + entidad.departamento +'</li></ul></div>';
	    
	    
		
		google.maps.event.addListener(marker, 'click', function() {
			infowindow.setContent(contentString);
			infowindow.open(var_map, this);
	    });
    });
    
    
    
    

}
</script>
<script type="text/javascript">
/* AmCharts.loadJSON = function(url) {
	if(window.XMLHttpRequest){
		  	// IE7+, Firefox, Chrome, Opera, Safari
			var request = new XMLHttpRequest();
	  }else{
	    	// code for IE6, IE5
	    	var request = new ActiveXObject('Microsoft.XMLHTTP');
	  }
	  request.open('GET', url, false);
	  request.send();

	  // parse adn return the output
	  return eval(request.responseText);
	};
	AmCharts.makeChart("divChart",{
			"type": "serial",
			"theme": "dark",
			"pathToImages": "http://cdn.amcharts.com/lib/3/images/",
			"categoryField": "fechaOperacion",
			"dataDateFormat": "YYYY-MM-DD",
			"categoryAxis": {
				"parseDates": true,
		        "dashLength": 1,
		        "minorGridEnabled": true
			},
			"chartCursor": {},
			"chartScrollbar": {},
			"trendLines": [],
			"graphs": [
				{
					"id": "g1",
					"bullet": "round",
					"bulletBorderAlpha": 1,
			        "bulletColor": "#FFFFFF",
			        "bulletSize": 5,
			        "hideBulletsCount": 50,
			        "lineThickness": 2,
			        "lineColor": "#67B7DC",
					"title": "Ctas x Cobrar",
					"useLineColorForBulletBorder": true,
					"valueField": "saldo"
				},
			],
			"guides": [],
			"allLabels": [],
			"balloon": {
				"borderThickness": 1,
		        "shadowAlpha": 0
			},
			"dataProvider": AmCharts.loadJSON('getChartDashboard')
		}
	); */
</script>
<!-- END JAVASCRIPTS -->
</body>
<!-- END BODY -->
</html>