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
.gm-style-iw {
    width: 150px !important;
    top: 1px !important;
    left: 0px !important;
    background-color: #fff;
    box-shadow: 0 1px 6px rgba(178, 178, 178, 0.6);
    border: 1px solid rgba(108, 108, 108, 0.6);
   	border-radius: 2px 2px 0 0;
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
						<div class="btn-group">
				        	<a aria-expanded="false" class="btn btn-default btn-sm dropdown-toggle eventBtn" data-toggle="dropdown">Estados <i class="fa fa-angle-down"></i></a>
				        	<ul class="dropdown-menu pull-right">
								<li><a href="javascript:;"> Pendiente </a></li>
								<li><a href="javascript:;"> Sin inicio </a></li>
								<li><a href="javascript:;"> Por iniciar </a></li>
								<li><a href="javascript:;"> Proceso </a></li>
								<li><a href="javascript:;"> Aceptado </a></li>
								<li><a href="javascript:;"> Terminado </a></li>
							</ul>
				        </div>
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
		
		var contentString = '';
			
		switch(entidad.estado){
		case "Sin inicio":
			contentString = '<div><strong><a href="ordenPag-'+ entidad.idOrden +'" target="_blank" style="color: #939393;">'+ entidad.nombre +'</a></strong>'+
			'<br>'+ tipoCliente +': '+ entidad.nombreCliente+'</div>';
			break;
		case "Por iniciar":
			contentString = '<div><strong><a href="ordenPag-'+ entidad.idOrden +'" target="_blank" style="color: #428bca;">'+ entidad.nombre +'</a></strong>'+
			'<br>'+ tipoCliente +': '+ entidad.nombreCliente+'</div>';
			break;
		case "Proceso":
			contentString = '<div><strong><a href="ordenPag-'+ entidad.idOrden +'" target="_blank" style="color: #dfba49;">'+ entidad.nombre +'</a></strong>'+
			'<br>'+ tipoCliente +': '+ entidad.nombreCliente+'</div>';
			break;
		case "Aceptado":
			contentString = '<div><strong><a href="ordenPag-'+ entidad.idOrden +'" target="_blank" style="color: #428bca;">'+ entidad.nombre +'</a></strong>'+
			'<br>'+ tipoCliente +': '+ entidad.nombreCliente+'</div>';
			break;
		case "Terminado":
			contentString = '<div><strong><a href="ordenPag-'+ entidad.idOrden +'" target="_blank" style="color: #45b6af;">'+ entidad.nombre +'</a></strong>'+
			'<br>'+ tipoCliente +': '+ entidad.nombreCliente+'</div>';
			break;
		case "Aceptacion Pendiente":
			contentString = '<div><strong><a href="ordenPag-'+ entidad.idOrden +'" target="_blank" style="color: #cb5a5e;">'+ entidad.nombre +'</a></strong>'+
			'<br>'+ tipoCliente +': '+ entidad.nombreCliente+'</div>';
			break;
		}
		
			
		var infowindow = new google.maps.InfoWindow({
		      content: contentString
		});
		
		google.maps.event.addListener(marker, 'click', function() {
			infowindow.setContent(contentString);
			infowindow.open(var_map, this);
	    });
		infowindow.open(var_map, marker);
		
		google.maps.event.addListener(infowindow, 'domready', function() {
			// Reference to the DIV which receives the contents of the infowindow using jQuery
			var iwOuter = $('.gm-style-iw');
			
			
			
			   /* The DIV we want to change is above the .gm-style-iw DIV.
			    * So, we use jQuery and create a iwBackground variable,
			    * and took advantage of the existing reference to .gm-style-iw for the previous DIV with .prev().
			    */
			var iwBackground = iwOuter.prev();
			
			// Moves the infowindow
			iwOuter.parent().parent().css({top: '50px'});
			
			   // Remove the background shadow DIV
			iwBackground.children(':nth-child(2)').css({'display' : 'none'});

			   // Remove the white background DIV
			iwBackground.children(':nth-child(4)').css({'display' : 'none'});
			
			var iwCloseBtn = iwOuter.next();
			//Mueve el 'x'
			iwCloseBtn.css({
				right: '20px', top: '3px'
			});
			//Oculta la punta del infowindow y su sombra , 3 es la sombra y 1 es el grafico
			iwBackground.children(':nth-child(1)').attr('style', function(i,s){ return s + 'opacity: 0 !important;'});
			iwBackground.children(':nth-child(3)').attr('style', function(i,s){ return s + 'opacity: 0 !important;'});
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