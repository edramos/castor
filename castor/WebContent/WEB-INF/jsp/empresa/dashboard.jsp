<!DOCTYPE html>
<html lang="en" class="no-js">
<head>
<meta charset="utf-8"/>
<title>Castor | Dashboard</title>
<jsp:include page="../comps/headMandatory.jsp"/>
<!-- BEGIN PAGE LEVEL PLUGIN STYLES -->
<link href="assets/global/plugins/bootstrap-daterangepicker/daterangepicker-bs3.css" rel="stylesheet" type="text/css"/>
<link href="assets/global/plugins/fullcalendar/fullcalendar.min.css" rel="stylesheet" type="text/css"/>
<link href="assets/global/plugins/jqvmap/jqvmap/jqvmap.css" rel="stylesheet" type="text/css"/>
<link href="assets/global/plugins/morris/morris.css" rel="stylesheet" type="text/css">
<!-- END PAGE LEVEL PLUGIN STYLES -->
<!-- BEGIN PAGE STYLES -->
<link href="assets/admin/pages/css/tasks.css" rel="stylesheet" type="text/css"/>
<!-- END PAGE STYLES -->
<!-- BEGIN THEME STYLES -->
<!-- DOC: To use 'rounded corners' style just load 'components-rounded.css' stylesheet instead of 'components.css' in the below style tag -->
<link href="assets/global/css/components-rounded.css" id="style_components" rel="stylesheet" type="text/css"/>
<link href="assets/global/css/plugins.css" rel="stylesheet" type="text/css"/>
<link href="assets/admin/layout4/css/layout.css" rel="stylesheet" type="text/css"/>
<link href="assets/admin/layout4/css/themes/light.css" rel="stylesheet" type="text/css" id="style_color"/>
<link href="assets/admin/layout4/css/custom.css" rel="stylesheet" type="text/css"/>
<!-- END THEME STYLES -->
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
			<div class="col-md-6">
				<div class="portlet box blue-hoki">
					<div class="portlet-title">
						<div class="caption"><i class="icon-share"></i>Proyectos</div>
						<div class="actions">
							<a id="btnCrearProy" class="btn btn-default btn-sm eventBtn"><i class="fa fa-plus"></i> Crear Proyecto </a>							
							<a class="btn btn-icon-only btn-default btn-sm fullscreen" href="#" data-original-title="" title=""></a>
						</div>
					</div>
					<div class="portlet-body">
						<div class="table-scrollable table-scrollable-borderless">
							<table class="table table-hover table-light">
							<thead>
							<tr class="uppercase">
								<th>N°</th>
								<th colspan="2">Estado</th>
								<th>Oferta</th>
								<th>Plazas</th>
								<th>RATE</th>
							</tr>
							</thead>
							<tbody>
							<tr>
								<td><span class="bold theme-font-color">85</span></td>
								<td class="fit"><i class="icon-paper-plane font-green-sharp"></i></td>
								<td>Nuevo</td>
								<td>S/. 2,500</td>
								<td>750</td>
								<td><span class="bold theme-font-color">70%</span></td>
							</tr>
							<tr>
								<td><span class="bold theme-font-color">7</span></td>
								<td class="fit"><i class="icon-plane font-green-sharp"></i></td>
								<td>Esperando</td>
								<td>S/. 4,500</td>
								<td>450</td>
								<td><span class="bold theme-font-color">10%</span></td>
							</tr>
							<tr>
								<td><span class="bold theme-font-color">12</span></td>
								<td class="fit"><i class="icon-rocket font-green-sharp"></i></td>
								<td>En proceso</td>
								<td>S/. 3,500</td>
								<td>425</td>
								<td><span class="bold theme-font-color">13%</span></td>
							</tr>
							<tr>
								<td><span class="bold theme-font-color">18</span></td>
								<td class="fit"><i class="icon-trophy font-green-sharp"></i></td>
								<td>Finalizado</td>
								<td>S/. 4,500</td>
								<td>950</td>
								<td><span class="bold theme-font-color">24%</span></td>
							</tr>
							</tbody>
							</table>
						</div>
					</div>
				</div>
				<div class="portlet box blue-hoki">
					<div class="portlet-title">
						<div class="caption"><i class="icon-basket"></i>Ordenes</div>
						<div class="actions">							
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
								<th colspan="2">Estado</th>
								<th>Oferta</th>
								<th>Plazas</th>
								<th>RATE</th>
							</tr>
							</thead>
							<tbody>
							<tr>
								<td><span class="bold theme-font-color">85</span></td>
								<td class="fit"><i class="icon-paper-plane font-green-sharp"></i></td>
								<td>Nuevo</td>
								<td>S/. 2,500</td>
								<td>750</td>
								<td><span class="bold theme-font-color">70%</span></td>
							</tr>
							<tr>
								<td><span class="bold theme-font-color">7</span></td>
								<td class="fit"><i class="icon-plane font-green-sharp"></i></td>
								<td>Esperando</td>
								<td>S/. 4,500</td>
								<td>450</td>
								<td><span class="bold theme-font-color">10%</span></td>
							</tr>
							<tr>
								<td><span class="bold theme-font-color">12</span></td>
								<td class="fit"><i class="icon-rocket font-green-sharp"></i></td>
								<td>En proceso</td>
								<td>S/. 3,500</td>
								<td>425</td>
								<td><span class="bold theme-font-color">13%</span></td>
							</tr>
							<tr>
								<td><span class="bold theme-font-color">18</span></td>
								<td class="fit"><i class="icon-trophy font-green-sharp"></i></td>
								<td>Finalizado</td>
								<td>S/. 4,500</td>
								<td>950</td>
								<td><span class="bold theme-font-color">24%</span></td>
							</tr>
							</tbody>
							</table>
						</div>
					</div>
				</div>
				<div class="portlet box blue-hoki">
					<div class="portlet-title">
						<div class="caption"><i class="icon-speedometer"></i>Facturas</div>
						<div class="actions">							
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
								<th colspan="2">Estado</th>
								<th>Oferta</th>
								<th>Plazas</th>
								<th>RATE</th>
							</tr>
							</thead>
							<tbody>
							<tr>
								<td><span class="bold theme-font-color">85</span></td>
								<td class="fit"><i class="icon-paper-plane font-green-sharp"></i></td>
								<td>Nuevo</td>
								<td>S/. 2,500</td>
								<td>750</td>
								<td><span class="bold theme-font-color">70%</span></td>
							</tr>
							<tr>
								<td><span class="bold theme-font-color">7</span></td>
								<td class="fit"><i class="icon-plane font-green-sharp"></i></td>
								<td>Esperando</td>
								<td>S/. 4,500</td>
								<td>450</td>
								<td><span class="bold theme-font-color">10%</span></td>
							</tr>
							<tr>
								<td><span class="bold theme-font-color">12</span></td>
								<td class="fit"><i class="icon-rocket font-green-sharp"></i></td>
								<td>En proceso</td>
								<td>S/. 3,500</td>
								<td>425</td>
								<td><span class="bold theme-font-color">13%</span></td>
							</tr>
							<tr>
								<td><span class="bold theme-font-color">18</span></td>
								<td class="fit"><i class="icon-trophy font-green-sharp"></i></td>
								<td>Finalizado</td>
								<td>S/. 4,500</td>
								<td>950</td>
								<td><span class="bold theme-font-color">24%</span></td>
							</tr>
							</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
			
			
			<div class="col-md-6">
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
<!-- IMPORTANT! fullcalendar depends on jquery-ui.min.js for drag & drop support -->
<!-- END PAGE LEVEL PLUGINS -->
<!-- BEGIN PAGE LEVEL SCRIPTS -->
<script src="assets/global/scripts/metronic.js" type="text/javascript"></script>
<script src="assets/admin/layout4/scripts/layout.js" type="text/javascript"></script>
<script src="assets/admin/layout4/scripts/demo.js" type="text/javascript"></script>
<script src="assets/admin/pages/scripts/index3.js" type="text/javascript"></script>
<script src="assets/admin/pages/scripts/tasks.js" type="text/javascript"></script>
<!-- END PAGE LEVEL SCRIPTS -->
<script>
jQuery(document).ready(function() {    
	Metronic.init(); // init metronic core componets
    Layout.init(); // init layout
    Demo.init(); // init demo features 
    //Index.init(); // init index page
 	Tasks.initDashboardWidget(); // init tash dashboard widget  
});
</script>
<!-- END JAVASCRIPTS -->
</body>
<!-- END BODY -->
</html>