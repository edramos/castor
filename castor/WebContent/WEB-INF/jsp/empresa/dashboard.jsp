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
		
		
		
		
		
			<!-- <div class="col-md-6">
				
				 <div class="portlet box blue-hoki">
					<div class="portlet-title">
						<div class="caption"><i class="icon-graph"></i>Diagrama</div>
						<div class="tools">
							<a title="" data-original-title="" href="javascript:;" class="collapse"></a>
							<a title="" data-original-title="" href="javascript:;" class="reload"></a>
							<a title="" data-original-title="" href="javascript:;" class="fullscreen"></a>	
						</div>
					</div>
					<div class="portlet-body form">
						<div id="divChart" class="chart" style="height: 300px;"></div>
					</div>
				</div>
				
				<div class="portlet box blue-hoki">
					<div class="portlet-title">
						<div class="caption"><i class="icon-basket"></i>Ordenes</div>
						<div class="actions">
							<a id="btnBuscarOrden" href="toBuscarOrden" class="btn btn-default btn-sm eventBtn"><i class="fa fa-search"></i> Buscar </a>	
							<a id="btnCrearProy" href="toCrearOrden" class="btn btn-default btn-sm eventBtn"><i class="fa fa-plus"></i> Crear </a>
							<a class="btn btn-icon-only btn-default btn-sm fullscreen" href="#" data-original-title="" title="">
							</a>
						</div>
					</div>
					<div class="portlet-body">
						<div class="table-scrollable table-scrollable-borderless">
							<table class="table table-hover table-light">
							<thead>
							<tr class="uppercase">
								<th>N°</th>
								<th>Estado</th>
								<th>Oferta</th>
								<th>Costos</th>
								<th>Utilidad</th>
							</tr>
							</thead>
							<tbody>
							<c:forEach items="${panelOrden}" var="panelOrdenFila" varStatus="loop"> 
							<tr> 
						  		<td><span class="bold theme-font-color">${panelOrdenFila.contador}</span></td>
						  		<td>${panelOrdenFila.estado}</td>
						  		<td>${panelOrdenFila.sumOferta}</td>
						  		<td>${panelOrdenFila.sumMonto}</td>
						  		<td><span class="bold theme-font-color">${panelOrdenFila.utilidad}</span></td>  
							</tr>
							</c:forEach>
							</tbody>
							</table>
						</div>
					</div>
				</div> 
				
			</div> -->
			
			
			<!-- <div class="col-md-6">
				 <div class="portlet box blue-hoki">
					<div class="portlet-title">
						<div class="caption"><i class="icon-bubbles"></i>Mensajes</div>
						<div class="actions">							
							<a class="btn btn-icon-only btn-default btn-sm fullscreen" href="#" data-original-title="" title=""></a>
						</div>
					</div>
					<div class="portlet-body">
						<div class="scroller" style="height: 706px;" data-always-visible="1" data-rail-visible1="0" data-handle-color="#D7DCE2">
						<div class="general-item-list">
							<div class="item">
								<div class="item-head">
									<div class="item-details">
										<img class="item-pic" src="assets/admin/layout3/img/avatar4.jpg">
										<a href="" class="item-name primary-link">Nick Larson</a>
										<span class="item-label">3 hrs ago</span>
									</div>
									<span class="item-status"><span class="badge badge-empty badge-success"></span> Open</span>
								</div>
								<div class="item-body">
									 Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat.
								</div>
							</div>
							<div class="item">
								<div class="item-head">
									<div class="item-details">
										<img class="item-pic" src="assets/admin/layout3/img/avatar3.jpg">
										<a href="" class="item-name primary-link">Mark</a>
										<span class="item-label">5 hrs ago</span>
									</div>
									<span class="item-status"><span class="badge badge-empty badge-warning"></span> Pending</span>
								</div>
								<div class="item-body">
									 Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat tincidunt ut laoreet.
								</div>
							</div>
							<div class="item">
								<div class="item-head">
									<div class="item-details">
										<img class="item-pic" src="assets/admin/layout3/img/avatar6.jpg">
										<a href="" class="item-name primary-link">Nick Larson</a>
										<span class="item-label">8 hrs ago</span>
									</div>
									<span class="item-status"><span class="badge badge-empty badge-primary"></span> Closed</span>
								</div>
								<div class="item-body">
									 Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh.
								</div>
							</div>
							<div class="item">
								<div class="item-head">
									<div class="item-details">
										<img class="item-pic" src="assets/admin/layout3/img/avatar7.jpg">
										<a href="" class="item-name primary-link">Nick Larson</a>
										<span class="item-label">12 hrs ago</span>
									</div>
									<span class="item-status"><span class="badge badge-empty badge-danger"></span> Pending</span>
								</div>
								<div class="item-body">
									 Consectetuer adipiscing elit Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat.
								</div>
							</div>
							<div class="item">
								<div class="item-head">
									<div class="item-details">
										<img class="item-pic" src="assets/admin/layout3/img/avatar9.jpg">
										<a href="" class="item-name primary-link">Richard Stone</a>
										<span class="item-label">2 days ago</span>
									</div>
									<span class="item-status"><span class="badge badge-empty badge-danger"></span> Open</span>
								</div>
								<div class="item-body">
									 Lorem ipsum dolor sit amet, consectetuer adipiscing elit, ut laoreet dolore magna aliquam erat volutpat.
								</div>
							</div>
							<div class="item">
								<div class="item-head">
									<div class="item-details">
										<img class="item-pic" src="assets/admin/layout3/img/avatar8.jpg">
										<a href="" class="item-name primary-link">Dan</a>
										<span class="item-label">3 days ago</span>
									</div>
									<span class="item-status"><span class="badge badge-empty badge-warning"></span> Pending</span>
								</div>
								<div class="item-body">
									 Lorem ipsum dolor sit amet, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat.
									 Lorem ipsum dolor sit amet, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat.
									 Lorem ipsum dolor sit amet, sed diam nonummy nibh euismod tincidunt.
								</div>
							</div>
							
						</div>
						</div>
					</div>
				</div>
			</div> -->
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
<!-- END PAGE LEVEL PLUGINS -->

<!-- BEGIN PAGE LEVEL SCRIPTS -->
<script src="assets/global/scripts/metronic.js" type="text/javascript"></script>
<script src="assets/admin/layout4/scripts/layout.js" type="text/javascript"></script>
<!-- END PAGE LEVEL SCRIPTS -->
<script>
jQuery(document).ready(function() {    
	Metronic.init(); // init metronic core componets
    Layout.init(); // init layout    
});
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