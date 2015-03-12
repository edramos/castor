<!DOCTYPE html>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Castor | Crear Proyecto</title>
<jsp:include page="../comps/headMandatory.jsp"/>
<!-- BEGIN PAGE LEVEL STYLES -->
<link rel="stylesheet" type="text/css" href="assets/global/plugins/bootstrap-datepicker/css/datepicker.css"/>
<!-- END PAGE LEVEL STYLES -->
<!-- BEGIN THEME STYLES -->
<!-- DOC: To use 'rounded corners' style just load 'components-rounded.css' stylesheet instead of 'components.css' in the below style tag -->
<link href="assets/global/css/components-rounded.css" id="style_components" rel="stylesheet" type="text/css"/>
<link href="assets/global/css/plugins.css" rel="stylesheet" type="text/css"/>
<link href="assets/admin/layout4/css/layout.css" rel="stylesheet" type="text/css"/>
<link href="assets/admin/layout4/css/themes/light.css" rel="stylesheet" type="text/css" id="style_color"/>
<link href="assets/admin/layout4/css/custom.css" rel="stylesheet" type="text/css"/>
<!-- END THEME STYLES -->
<style>
.table > tbody > tr > td, .table > tbody > tr > th, .table > tfoot > tr > td, .table > tfoot > tr > th, .table > thead > tr > td, .table > thead > tr > th{
	border-top: 0px solid #DDD;
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

<div class="row">
	<div class="col-md-12">
		<div class="portlet box blue-hoki">
			<div class="portlet-title">
				<div class="caption"><i class="icon-share"></i>Crear Proyecto</div>
				<div class="actions">							
					<a class="btn btn-icon-only btn-default btn-sm fullscreen" href="#" data-original-title="" title=""></a>
				</div>
			</div>
			<div class="portlet-body form">
			
				<form:form id="frmCrearProyecto" class="form-horizontal">
					<div class="form-body">
						<h4 class="form-section">General</h4>
						<div class="row">
							<div class="col-md-3">
								<div class="form-group">
									<div class="col-md-12">
										<input id="txtNombre" class="form-control" placeholder="Nombre Proyecto"/>
									</div>
								</div>
							</div>
							<div class="col-md-3">
								<div class="form-group">
									<div class="col-md-12">
										<select id="sltTipo" class="form-control">
											<option>Obra</option>
											<option>Estudio</option>
											<option>Adecuacion</option>
											<option>Proyecto</option>
											<option>Estructura Metalica</option>
										</select>
									</div>
								</div>
							</div>
							<div class="col-md-3">
								<div class="form-group">
									<div class="col-md-12">
										<select id="sltCliente" class="form-control">
										</select>
									</div>
								</div>
							</div>
							<div class="col-md-3">
								<!-- <div class="form-group">
									<div class="col-md-12">
										<input id="txtOferta" class="form-control" placeholder="Oferta USD $/."/>
									</div>
								</div> -->
							</div>
						</div>
						
						<div class="row">
							<div class="col-md-6">
								<div class="form-group">
									<div class="col-md-12">
										<input id="txtDireccion" class="form-control" placeholder="Direccion"/>
									</div>
								</div>
							</div>
							<div class="col-md-3">
								<div class="form-group">
									<div class="col-md-12">
										<input id="txtCiudad" class="form-control" placeholder="Ciudad"/>
									</div>
								</div>
							</div>
							<div class="col-md-3">
								<div class="form-group">
									<div class="col-md-12">
										<select id="sltDistrito" class="form-control">
											<option>Lima</option>
											<option>Cajamarca</option>
											<option>Ancash</option>
										</select>
									</div>
								</div>
							</div>
						</div>
						
						
						
						<h4 class="form-section">Subcontratos</h4>
						<div class="row">
							<div class="col-md-4">
								<div class="form-group">
									<div class="col-md-12">
										<input id="txtOferta" class="form-control" placeholder="Oferta USD $/."/>
									</div>
								</div>
							</div>
							<div class="col-md-4">
								<div class="form-group">
									<div class="col-md-12">
										<input id="txtOferta" class="form-control" placeholder="% Eficiencia"/>
									</div>
								</div>
							</div>
							<div class="col-md-4">
								<div class="form-group">
									<div class="col-md-12">
										<input id="txtOferta" class="form-control" placeholder="Utilidad Bruta"/>
									</div>
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-md-12">
								<div class="table-container">
									<div class="table-scrollable">
										<table class="table table-striped table-bordered table-hover dataTable no-footer">
										<thead>
											<tr role="row" class="heading">
												<th width="20%">Nombre</th>
												<th width="20%">Tipo</th>
												<th width="20%">Monto</th>
												<th width="10%">Acciones</th>
											</tr>
											<tr role="row" class="filter">
												<td>
													<select id="sltTipo" class="form-control">
														<option>Proveedores</option>
													</select>
												</td>
												<td>
													<select id="sltTipo" class="form-control">
														<option>Obra</option>
														<option>Estudio</option>
														<option>Adecuacion</option>
														<option>Proyecto</option>
														<option>Estructura Metalica</option>
													</select>
												</td>
												<td>
													<input id="txtOferta" class="form-control" placeholder="Monto USD$/."/>
												</td>
												<td>
													<div class="margin-bottom-5">
														<button class="btn btn-sm green filter-submit margin-bottom"><i class="fa fa-plus"></i></button>
														<button class="btn btn-sm red filter-cancel"><i class="fa fa-times"></i></button>
													</div>
												</td>
											</tr>
										</thead>
										
										<tbody>
											<tr>
												<td></td>
												<td></td>
												<td>SubTotal</td>
												<td></td>
											</tr>
											<tr>
												<td></td>
												<td></td>
												<td>GG</td>
												<td></td>
											</tr>
											<tr>
												<td></td>
												<td></td>
												<td>TOTAL:</td>
												<td></td>
											</tr>
										</tbody>	
										</table>
									</div>
								</div>
							</div>
						</div>
						
						
						
						<h4 class="form-section">Cobro Cliente</h4>
						<div class="row">
							<div class="col-md-12">
								<div class="table-container">
									<div class="table-scrollable">
										<table class="table table-striped table-bordered table-hover dataTable no-footer">
										<thead>
											<tr role="row" class="heading">
												<th width="20%">Cobro 1</th>
												<th width="20%">Cobro 2</th>
												<th width="20%">Cobro 3</th>
											</tr>
											<tr role="row" class="filter">
												<td style="padding-bottom: 0px;">
													<table class="table" style="margin-bottom: 5px;">
													<tr>
														<td width="15%" style="padding: 1px;"><input type="text" class="form-control form-filter input-sm" name="order_customer_name" placeholder="%"></td>
														<td style="padding: 1px;"><input type="text" class="form-control form-filter input-sm" name="order_customer_name" placeholder="USD $/."></td>
														<td style="padding: 1px;">
															<div class="input-group date date-picker margin-bottom-5" data-date-format="dd/mm/yyyy">
																<input type="text" class="form-control form-filter input-sm" name="order_date_from" placeholder="Cobrar">
																<span class="input-group-btn">
																<button class="btn btn-sm default" type="button"><i class="fa fa-calendar"></i></button>
																</span>
															</div>
														</td>
													</tr>
													</table>
												</td>
												<td style="padding-bottom: 0px;">
													<table class="table" style="margin-bottom: 5px;">
													<tr>
														<td width="15%" style="padding: 1px;"><input type="text" class="form-control form-filter input-sm" name="order_customer_name" placeholder="%"></td>
														<td style="padding: 1px;"><input type="text" class="form-control form-filter input-sm" name="order_customer_name" placeholder="USD $/."></td>
														<td style="padding: 1px;">
															<div class="input-group date date-picker margin-bottom-5" data-date-format="dd/mm/yyyy">
																<input type="text" class="form-control form-filter input-sm" name="order_date_from" placeholder="Cobrar">
																<span class="input-group-btn">
																<button class="btn btn-sm default" type="button"><i class="fa fa-calendar"></i></button>
																</span>
															</div>
														</td>
													</tr>
													</table>
												</td>
												<td style="padding-bottom: 0px;">
													<table class="table" style="margin-bottom: 5px;">
													<tr>
														<td width="15%" style="padding: 1px;"><input type="text" class="form-control form-filter input-sm" name="order_customer_name" placeholder="%"></td>
														<td style="padding: 1px;"><input type="text" class="form-control form-filter input-sm" name="order_customer_name" placeholder="USD $/."></td>
														<td style="padding: 1px;">
															<div class="input-group date date-picker margin-bottom-5" data-date-format="dd/mm/yyyy">
																<input type="text" class="form-control form-filter input-sm" name="order_date_from" placeholder="Cobrar">
																<span class="input-group-btn">
																<button class="btn btn-sm default" type="button"><i class="fa fa-calendar"></i></button>
																</span>
															</div>
														</td>
													</tr>
													</table>
												</td>
											</tr>
										</thead>
											
										</table>
									</div>
								</div>
							</div>
						</div>
						
						
						
						<h4 class="form-section">Pago Proveedores</h4>
						<div class="row">
							<div class="col-md-12">
								<div class="table-container">
									<div class="table-scrollable">
										<table class="table table-striped table-bordered table-hover dataTable no-footer">
										<thead>
										<tr role="row" class="heading">
											<th width="15%">Proveedor</th>
											<th width="20%">Pago 1</th>
											<th width="20%">Pago 2</th>
											<th width="20%">Pago 3</th>
											<th width="10%">Acciones</th>
										</tr>
										<tr role="row" class="filter">
											<td>
												<select id="sltProveedor_1" name="order_status" class="form-control form-filter input-sm">
												</select>
												<input type="text" class="form-control form-filter input-sm" name="order_customer_name" placeholder="Monto USD $/.">
											</td>
											<td>
												<table class="table" style="margin-bottom: 5px;">
												<tr>
													<td width="25%" style="padding: 1px;"><input type="text" class="form-control form-filter input-sm" name="order_customer_name" placeholder="%"></td>
													<td style="padding: 1px;"><input type="text" class="form-control form-filter input-sm" name="order_customer_name" placeholder="USD $/."></td>
												</tr>
												<tr>
													<td style="padding: 1px;" colspan="2">
														<div class="input-group date date-picker margin-bottom-5" data-date-format="dd/mm/yyyy">
															<input type="text" class="form-control form-filter input-sm" name="order_date_from" placeholder="Cobrar">
															<span class="input-group-btn">
															<button class="btn btn-sm default" type="button"><i class="fa fa-calendar"></i></button>
															</span>
														</div>
													</td>
												</tr>
												</table>
											</td>
											<td>
												<table class="table" style="margin-bottom: 5px;">
												<tr>
													<td width="25%" style="padding: 1px;"><input type="text" class="form-control form-filter input-sm" name="order_customer_name" placeholder="%"></td>
													<td style="padding: 1px;"><input type="text" class="form-control form-filter input-sm" name="order_customer_name" placeholder="USD $/."></td>
												</tr>
												<tr>
													<td style="padding: 1px;" colspan="2">
														<div class="input-group date date-picker margin-bottom-5" data-date-format="dd/mm/yyyy">
															<input type="text" class="form-control form-filter input-sm" name="order_date_from" placeholder="Cobrar">
															<span class="input-group-btn">
															<button class="btn btn-sm default" type="button"><i class="fa fa-calendar"></i></button>
															</span>
														</div>
													</td>
												</tr>
												</table>
											</td>
											<td>
												<table class="table" style="margin-bottom: 5px;">
												<tr>
													<td width="25%" style="padding: 1px;"><input type="text" class="form-control form-filter input-sm" name="order_customer_name" placeholder="%"></td>
													<td style="padding: 1px;"><input type="text" class="form-control form-filter input-sm" name="order_customer_name" placeholder="USD $/."></td>
												</tr>
												<tr>
													<td style="padding: 1px;" colspan="2">
														<div class="input-group date date-picker margin-bottom-5" data-date-format="dd/mm/yyyy">
															<input type="text" class="form-control form-filter input-sm" name="order_date_from" placeholder="Cobrar">
															<span class="input-group-btn">
															<button class="btn btn-sm default" type="button"><i class="fa fa-calendar"></i></button>
															</span>
														</div>
													</td>
												</tr>
												</table>
											</td>
											<td>
												<div class="margin-bottom-5">
													<button class="btn btn-sm green filter-submit margin-bottom"><i class="fa fa-plus"></i></button>
													<button class="btn btn-sm red filter-cancel"><i class="fa fa-times"></i></button>
												</div>
											</td>
										</tr>
										
										</thead>
										</table>
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
	
</div>
</div>
<!-- END CONTENT -->
</div>
<!-- END CONTAINER -->

<jsp:include page="../comps/footer.jsp"/>
<jsp:include page="../comps/corePlugins.jsp"/>
<!-- BEGIN PAGE LEVEL PLUGINS -->
<script type="text/javascript" src="assets/global/plugins/jquery-validation/js/jquery.validate.min.js"></script>
<script type="text/javascript" src="assets/global/plugins/jquery-validation/js/additional-methods.min.js"></script>
<script type="text/javascript" src="assets/global/plugins/select2/select2.min.js"></script>
<script type="text/javascript" src="assets/global/plugins/bootstrap-datepicker/js/bootstrap-datepicker.js"></script>
<script type="text/javascript" src="assets/global/plugins/bootstrap-wysihtml5/wysihtml5-0.3.0.js"></script>
<script type="text/javascript" src="assets/global/plugins/bootstrap-wysihtml5/bootstrap-wysihtml5.js"></script>
<script type="text/javascript" src="assets/global/plugins/ckeditor/ckeditor.js"></script>
<script type="text/javascript" src="assets/global/plugins/bootstrap-markdown/js/bootstrap-markdown.js"></script>
<script type="text/javascript" src="assets/global/plugins/bootstrap-markdown/lib/markdown.js"></script>
<!-- END PAGE LEVEL PLUGINS -->
<!-- BEGIN PAGE LEVEL STYLES -->
<script src="assets/global/scripts/metronic.js" type="text/javascript"></script>
<script src="assets/admin/layout4/scripts/layout.js" type="text/javascript"></script>
<script src="assets/admin/layout4/scripts/demo.js" type="text/javascript"></script>
<script src="assets/admin/pages/scripts/form-validation.js"></script>
<!-- END PAGE LEVEL STYLES -->
<script>
jQuery(document).ready(function() {   
	Metronic.init(); // init metronic core components
	Layout.init(); // init current layout
	Demo.init(); // init demo features
   	FormValidation.init();
	
	//Cargo Selector de Cliente
	listarSelectorClientes('sltCliente');
	listarSelectorProveedores('sltProveedor_1');
	listarSelectorProveedores('sltProveedor_2');
});

function listarSelectorClientes(nombreSelector){
	var html = '';
    $.ajax({
 		url: 'ajaxListarClientes',
 		type: 'post',
 		dataType: 'json',
 		data: '',
 		success: function(clientes){
 			$.each(clientes, function(i, cliente){
	 			var source = $("#templateSelectorClientes").html();
	 			var template = Handlebars.compile(source);
	 			html += template(cliente);
	 			
 			});		
 			$("#"+nombreSelector).html(html);	        
 		},
 		complete: function() {	 			
 			
  		}
 	});
}

function listarSelectorProveedores(nombreSelector){
	var html = '';
    $.ajax({
 		url: 'ajaxListarProveedores',
 		type: 'post',
 		dataType: 'json',
 		data: '',
 		success: function(proveedores){
 			$.each(proveedores, function(i, proveedor){
	 			var source = $("#templateSelectorProveedores").html();
	 			var template = Handlebars.compile(source);
	 			html += template(proveedor);	 			
 			});		
 			$("#"+nombreSelector).html(html);	        
 		},
 		complete: function() {	 			
 			
  		}
 	});
}
</script>
<script id="templateSelectorClientes" type="text/x-handlebars-template">
	<option value="{{idCliente}}">{{nombre}}</option>
</script>
<script id="templateSelectorProveedores" type="text/x-handlebars-template">
	<option value="{{idProveedor}}">{{nombre}}</option>
</script>
</body>
</html>