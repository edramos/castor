<!DOCTYPE html>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Castor | Buscar Orden</title>
<jsp:include page="../comps/headMandatory.jsp"/>
<!-- BEGIN PAGE LEVEL STYLES -->
<link rel="stylesheet" type="text/css" href="assets/global/plugins/select2/select2.css"/>
<link rel="stylesheet" type="text/css" href="assets/global/plugins/datatables/extensions/Scroller/css/dataTables.scroller.min.css"/>
<link rel="stylesheet" type="text/css" href="assets/global/plugins/datatables/extensions/ColReorder/css/dataTables.colReorder.min.css"/>
<link rel="stylesheet" type="text/css" href="assets/global/plugins/datatables/plugins/bootstrap/dataTables.bootstrap.css"/>
<link rel="stylesheet" type="text/css" href="assets/global/plugins/bootstrap-datepicker/css/datepicker.css"/>
<!-- END PAGE LEVEL STYLES -->
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

<div class="row">
	<div class="col-md-12">
		<div class="portlet box blue-hoki">
			<div class="portlet-title">
				<div class="caption"><i class="icon-basket"></i>Buscar Orden</div>
				<div class="actions">							
					<a class="btn btn-icon-only btn-default btn-sm fullscreen" href="#" data-original-title="" title=""></a>
				</div>
			</div>
			<div class="portlet-body form">
			<form:form id="frmBuscarOrden" commandName="ordenBean" method="post">
				<div class="form-body">
					<div class="row">
						<div class="col-md-3">
							<div class="form-group">
								<div class="col-md-12">
									<input id="txtCodigo" class="form-control" placeholder="Codigo Orden" name="codigo"/>
								</div>	
							</div>
						</div>
						<div class="col-md-3">
							<div class="form-group">
								<div class="col-md-12">
									<input id="txtNombreCliente" class="form-control" placeholder="Nombre Cliente" name="nombreCliente"/>
								</div>	
							</div>
						</div>
						<div class="col-md-3">
							<div class="form-group">
								<div class="col-md-12">
									<input id="txtOfertaMinima" class="form-control" placeholder="Oferta Minima" name="ofertaMinima"/>
								</div>	
							</div>
						</div>
						<div class="col-md-3">
							<div class="col-md-12">
							<a href="#" class="btn yellow" onclick="buscarOrden();">Buscar <i class="fa fa-search"></i></a>
							<input id="hdnCampo" type="hidden" name="campo"/><input id="hdnBusqueda" type="hidden" name="busqueda"/>
							</div>
						</div>
					</div>
					
					<div class="row">
						<div class="col-md-3">
							<div class="form-group">
								<div class="col-md-12">
									<div class="input-group date date-picker margin-bottom-5" data-date-format="dd/mm/yyyy">
										<input id="txtFechaMinima" type="text" class="form-control form-filter input-sm" name="fechaCreacionMinima" placeholder="Fecha Inicio">
										<span class="input-group-btn">
											<button class="btn btn-sm default" type="button"><i class="fa fa-calendar"></i></button>
										</span>
									</div>	
								</div>
							</div>
						</div>
						<div class="col-md-3">
							<div class="form-group">
								<div class="col-md-12">
									<div class="input-group date date-picker margin-bottom-5" data-date-format="dd/mm/yyyy">
										<input id="txtFechaMaxima" type="text" class="form-control form-filter input-sm" name="fechaCreacionMaxima" placeholder="Fecha Fin">
										<span class="input-group-btn">
											<button class="btn btn-sm default" type="button"><i class="fa fa-calendar"></i></button>
										</span>
									</div>	
								</div>
							</div>
						</div>
						<div class="col-md-3">
							<div class="form-group">
								<div class="col-md-12">
									<input id="txtOfertaMaxima" class="form-control" placeholder="Oferta Maxima" name="ofertaMaxima"/>
								</div>
							</div>
						</div>
					</div>
					
				</div>
			</form:form>
			</div>
		</div>
	</div>
</div>

<div class="row">
	<div class="col-md-12">
		<div class="portlet box blue-hoki">
			<div class="portlet-title">
				<div class="caption">Resultados</div>
				<div class="actions">							
					<a class="btn btn-icon-only btn-default btn-sm fullscreen" href="#" data-original-title="" title=""></a>
				</div>
			</div>
			<div id="divPortletBody" class="portlet-body">
				<table class="table table-striped table-hover" id="sample_1">
				<thead>
				<tr>
					<th>Codigo</th>
					<th>Nombre</th>
					<th>Cliente</th>
					<th>Oferta</th>
				</tr>
				</thead>
				
				<tbody id="viewOrdenesHandlerbars">
				</tbody>
				</table>		
					
			</div>
		</div>
	</div>
</div>

</div>
</div>
<!-- END CONTENT -->
</div>
<!-- END CONTAINER -->

<jsp:include page="../comps/footer.jsp"/>
<jsp:include page="../comps/corePlugins.jsp"/>
<!-- BEGIN PAGE LEVEL PLUGINS -->
<script type="text/javascript" src="assets/global/plugins/select2/select2.min.js"></script>
<script type="text/javascript" src="assets/global/plugins/bootstrap-datepicker/js/bootstrap-datepicker.js"></script>
<script type="text/javascript" src="assets/global/plugins/datatables/media/js/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="assets/global/plugins/datatables/extensions/TableTools/js/dataTables.tableTools.min.js"></script>
<script type="text/javascript" src="assets/global/plugins/datatables/extensions/ColReorder/js/dataTables.colReorder.min.js"></script>
<script type="text/javascript" src="assets/global/plugins/datatables/extensions/Scroller/js/dataTables.scroller.min.js"></script>
<script type="text/javascript" src="assets/global/plugins/datatables/plugins/bootstrap/dataTables.bootstrap.js"></script>
<!-- END PAGE LEVEL PLUGINS -->

<!-- BEGIN PAGE LEVEL SCRIPTS -->
<script src="assets/global/scripts/metronic.js" type="text/javascript"></script>
<script src="assets/admin/layout4/scripts/layout.js" type="text/javascript"></script>
<script src="assets/admin/layout4/scripts/demo.js" type="text/javascript"></script>
<script src="assets/admin/pages/scripts/table-advanced.js"></script>
<!-- END PAGE LEVEL SCRIPTS -->
<script>
jQuery(document).ready(function() { 
	var table;
	
	Metronic.init(); // init metronic core components
	Layout.init(); // init current layout
	Demo.init(); // init demo features
	datePickerInit();	
	buscarOrden();
});
</script>
<script>
var flag = 0;

function buscarOrden(){
	//if($('#txtCodigo').val()!= '' && $('#txtNombreCliente').val()!= '' && $('#txtOferta').val()!= ''){
		//$('#hdnBusqueda').val($('#txtCodigo').val());
		var html = '';
		
		$.ajax({
	 		url: 'ajaxBuscarOrden',
	 		type: 'post',
	 		dataType: 'json',
	 		data: $('#frmBuscarOrden').serialize(),
	 		success: function(ordenes){
	 			removeTable();
	 			createTable();
	 			$.each(ordenes, function(i, orden){
		 			var source = $("#templateOrden").html();
		 			var template = Handlebars.compile(source);
		 			html += template(orden);
	 			});
	 			$("#viewOrdenesHandlerbars").html(html);
	 				
	 			TableAdvanced.init();
	 				 			
	 			
	 		}
	 	});	
		
	//}
}
function removeTable(){
	$('#sample_1').remove();
	$('#sample_1_wrapper').remove();
}
function createTable(){
	$('#divPortletBody').append(
			"<table class='table table-striped table-hover' id='sample_1'><thead><tr><th>Codigo</th><th>Nombre</th><th>Cliente</th><th>Oferta</th>"+
			"</tr></thead><tbody id='viewOrdenesHandlerbars'></tbody></table>"	
	);
}
function datePickerInit(){
	$('.date-picker').datepicker({
        rtl: Metronic.isRTL(),
        autoclose: true
    });
    $('.date-picker .form-control').change(function() {
    	$('#frmBuscarOrden').validate().element($(this)); 
    })
}
</script>
<script id="templateOrden" type="text/x-handlebars-template">
<tr>
	<td><a href="ordenPag-{{idOrden}}">{{codigo}}<a/></td>
	<td>{{nombre}}</td>
	<td>{{nombreCliente}}</td>
	<td>{{oferta}}</td>
</tr>
</script>
</body>
</html>