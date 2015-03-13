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
			
				<form:form id="frmCrearProyecto" method="post" action="ajaxCrearProyecto" class="form-horizontal" commandName="proyecto">
					<div class="form-body">
						<h4 class="form-section">General</h4>
						<div class="row">
							<div class="col-md-3">
								<div class="form-group">
									<div class="col-md-12">
										<input id="txtNombre" class="form-control" placeholder="Nombre Proyecto" name="nombre"/>
									</div>
								</div>
							</div>
							<div class="col-md-3">
								<div class="form-group">
									<div class="col-md-12">
										<select id="sltTipo" class="form-control" name="tipo">
											<option value="Obra">Obra</option>
											<option value="Estudio">Estudio</option>
											<option value="Adecuacion">Adecuacion</option>
											<option value="Proyecto">Proyecto</option>
											<option value="Estructura Metalica">Estructura Metalica</option>
										</select>
									</div>
								</div>
							</div>
							<div class="col-md-3">
								<div class="form-group">
									<div class="col-md-12">
										<select id="sltCliente" class="form-control" name="idCliente">
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
										<input id="txtDireccion" class="form-control" placeholder="Direccion" name="direccion"/>
									</div>
								</div>
							</div>
							<div class="col-md-2">
								<div class="form-group">
									<div class="col-md-12">
										<input id="txtDistrito" class="form-control" placeholder="Distrito" name="distrito"/>
									</div>
								</div>
							</div>
							<div class="col-md-2">
								<div class="form-group">
									<div class="col-md-12">
										<input id="txtCiudad" class="form-control" placeholder="Ciudad" name="ciudad"/>
									</div>
								</div>
							</div>							

							<div class="col-md-2">
								<div class="form-group">
									<div class="col-md-12">
										<select id="sltDepartamento" class="form-control" name="departamento">
											<option>Lima</option>
											<option>Cajamarca</option>
											<option>Ancash</option>
										</select>
									</div>
								</div>
							</div>
						</div>
						
						<!-- Seccion subcontratos -->
						
						<h4 class="form-section">Subcontratos</h4>
						<div class="row">
							<div class="col-md-4">
								<div class="form-group">
									<div class="col-md-12">
										<input id="txtOferta" class="form-control" placeholder="Oferta USD $/." name="oferta"/>
									</div>
								</div>
							</div>
							<div class="col-md-4">
								<div class="form-group">
									<div class="col-md-12">
										<input id="txtEficiencia" class="form-control" placeholder="% Eficiencia" name="eficiencia"/>
									</div>
								</div>
							</div>
							<div class="col-md-4">
								<div class="form-group">
									<div class="col-md-12">
										<input id="txtUtilidadBruta" class="form-control" placeholder="Utilidad Bruta" name="utilidadBruta"/>
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
											<tr role="row" class="filter" id="fila_SC_0">
												<td>
													<select id="sltProveedorSC_0" class="form-control" name="idProveedorSC" onchange="cambiarSelectorProveedorPago(0);">
														<option>Proveedores</option>
													</select>
												</td>
												<td>
													<select id="sltTipoSC_0" class="form-control" name="tipoSC">
														<option>Obra</option>
														<option>Estudio</option>
														<option>Adecuacion</option>
														<option>Proyecto</option>
														<option>Estructura Metalica</option>
													</select>
												</td>
												<td>
													<input onchange="recalcularTotalesSubcontratos(); cambiarPagoProveedor(0);" id="txtMontoSC_0" class="form-control" placeholder="Monto USD$/." name="montoSC"/>
												</td>
												<td>
													<div class="margin-bottom-5">
														<span class="btn btn-sm green filter-submit margin-bottom" onclick="agregarNuevaFilaSubcontratos();"><i class="fa fa-plus"></i></span>
														<span class="btn btn-sm red filter-cancel"><i class="fa fa-times"></i></span>
													</div>
												</td>
											</tr>
										</thead>
										
										<tbody id="vistaTablaSubcontratosProveedores">
										
										</tbody>
										
										
										<tbody>
											<tr>
												<td></td>
												<td></td>
												<td>SubTotal</td>
												<td><input id="txtSubTotal" class="form-control" placeholder="SubTotal" name="subTotal"/></td>
											</tr>
											<tr>
												<td></td>
												<td></td>
												<td>GG</td>
												<td><input id="txtGastosGenerales" onchange="recalcularTotalesSubcontratos();" class="form-control" placeholder="Gastos Generales" name="gastosGenerales"/></td>
											</tr>
											<tr>
												<td></td>
												<td></td>
												<td>TOTAL:</td>
												<td><input id="txtTotal" class="form-control" placeholder="Total" name="total"/></td>
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
														<td width="15%" style="padding: 1px;"><input type="text" class="form-control form-filter input-sm" name="cobro_porcentaje" placeholder="%"></td>
														<td style="padding: 1px;"><input type="text" class="form-control form-filter input-sm" name="cobro_monto" placeholder="USD $/."></td>
														<td style="padding: 1px;">
															<div class="input-group date date-picker margin-bottom-5" data-date-format="dd/mm/yyyy">
																<input type="text" class="form-control form-filter input-sm" name="cobro_fecha" placeholder="Cobrar">
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
														<td width="15%" style="padding: 1px;"><input type="text" class="form-control form-filter input-sm" name="cobro_porcentaje" placeholder="%"></td>
														<td style="padding: 1px;"><input type="text" class="form-control form-filter input-sm" name="cobro_monto" placeholder="USD $/."></td>
														<td style="padding: 1px;">
															<div class="input-group date date-picker margin-bottom-5" data-date-format="dd/mm/yyyy">
																<input type="text" class="form-control form-filter input-sm" name="cobro_fecha" placeholder="Cobrar">
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
														<td width="15%" style="padding: 1px;"><input type="text" class="form-control form-filter input-sm" name="cobro_porcentaje" placeholder="%"></td>
														<td style="padding: 1px;"><input type="text" class="form-control form-filter input-sm" name="cobro_monto" placeholder="USD $/."></td>
														<td style="padding: 1px;">
															<div class="input-group date date-picker margin-bottom-5" data-date-format="dd/mm/yyyy">
																<input type="text" class="form-control form-filter input-sm" name="cobro_fecha" placeholder="Cobrar">
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
										<tr role="row" class="filter" id="fila_pago_0">
											<td>
												<select id="sltProveedor_0" name="pago_idProveedor" class="form-control form-filter input-sm">
												</select>
												<input id="montoTotal_0" type="text" class="form-control form-filter input-sm" name="pago_montoTotal" placeholder="Monto USD $/.">
											</td>
											<td>
												<table class="table" style="margin-bottom: 5px;">
												<tr>
													<td width="25%" style="padding: 1px;"><input onchange="calcularMontoParcialxPorcentaje_Pago1(0)" id="txtPorcentaje_pago1_0" type="text" class="form-control form-filter input-sm" name="pago_porcentaje" placeholder="%"></td>
													<td style="padding: 1px;"><input id="txtPagoParcial_pago1_0" type="text" class="form-control form-filter input-sm" name="pago_montoParcial" placeholder="USD $/."></td>
												</tr>
												<tr>
													<td style="padding: 1px;" colspan="2">
														<div class="input-group date date-picker margin-bottom-5" data-date-format="dd/mm/yyyy">
															<input type="text" class="form-control form-filter input-sm" name="pago_fecha" placeholder="Cobrar">
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
													<td width="25%" style="padding: 1px;"><input onchange="calcularMontoParcialxPorcentaje_Pago2(0)" id="txtPorcentaje_pago2_0" type="text" class="form-control form-filter input-sm" name="pago_porcentaje" placeholder="%"></td>
													<td style="padding: 1px;"><input id="txtPagoParcial_pago2_0" type="text" class="form-control form-filter input-sm" name="pago_montoParcial" placeholder="USD $/."></td>
												</tr>
												<tr>
													<td style="padding: 1px;" colspan="2">
														<div class="input-group date date-picker margin-bottom-5" data-date-format="dd/mm/yyyy">
															<input type="text" class="form-control form-filter input-sm" name="pago_fecha" placeholder="Cobrar">
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
													<td width="25%" style="padding: 1px;"><input onchange="calcularMontoParcialxPorcentaje_Pago3(0)" id="txtPorcentaje_pago3_0" type="text" class="form-control form-filter input-sm" name="pago_porcentaje" placeholder="%"></td>
													<td style="padding: 1px;"><input id="txtPagoParcial_pago3_0" type="text" class="form-control form-filter input-sm" name="pago_montoParcial" placeholder="USD $/."></td>
												</tr>
												<tr>
													<td style="padding: 1px;" colspan="2">
														<div class="input-group date date-picker margin-bottom-5" data-date-format="dd/mm/yyyy">
															<input type="text" class="form-control form-filter input-sm" name="pago_fecha" placeholder="Cobrar">
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
													<span class="btn btn-sm green filter-submit margin-bottom"><i class="fa fa-plus"></i></span>
													<span class="btn btn-sm red filter-cancel"><i class="fa fa-times"></i></span>
												</div>
											</td>
										</tr>
										
										</thead>
										
										<tbody id="vistaTablaPagos">
										
										</tbody>
										
										</table>
									</div>
								</div>
							</div>
						</div>
						
						
						 <a id="btnGrabar" class="btn btn-default btn-sm eventBtn" onclick="grabarProyecto();"><i class="fa fa-plus"></i> Grabar</a>
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
	listarSelectorProveedores('sltProveedor_0');
	
	
	listarSelectorProveedores('sltProveedorSC_0');
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
var idFila=0;

function agregarNuevaFilaSubcontratos(){
	idFila++;
	var entidadFila = new Object();
	entidadFila.idFila = idFila;
	var html = '';
	var source = $("#templateProveedoresSubcontratos_tabla").html();
	var template = Handlebars.compile(source);
	html += template(entidadFila);
	$("#vistaTablaSubcontratosProveedores").append(html);
	listarSelectorProveedores('sltProveedorSC_'+idFila);
	recalcularTotalesSubcontratos();
	
	//
	agregarNuevaFilaPagos(idFila);
}

function agregarNuevaFilaPagos(idFilaTemp){
	var entidadFila2 = new Object();
	entidadFila2.idFila = idFilaTemp;
	var html = '';
	var source = $("#templateProveedoresPago_tabla").html();
	var template = Handlebars.compile(source);
	html += template(entidadFila2);
	$("#vistaTablaPagos").append(html);
	listarSelectorProveedores('sltProveedor_'+idFilaTemp);	
}

function recalcularTotalesSubcontratos(){
	var subtotal = 0;
	var gastosg = 0;
	var total = 0;
	
	arregloMontoSC = document.getElementsByName('montoSC');
		for (var x=0; x < arregloMontoSC.length; x++) {
			if(arregloMontoSC[x].value==''){
				
			}else{
				subtotal = parseFloat(arregloMontoSC[x].value) + subtotal;	
			}
	  	}
	
	if($('#txtGastosGenerales').val()==''){
		gastosg = 0;
		$('#txtGastosGenerales').val(gastosg)
	}else{
		gastosg = $('#txtGastosGenerales').val();
	}
	
	total = subtotal + parseFloat(gastosg);
	$('#txtSubTotal').val(subtotal);
	$('#txtTotal').val(total);
	
	//
	var eficiencia = 0;
	var oferta = 0; 
	var utilidadBruta = 0;
	if($('#txtOferta').val()==''){
		oferta = 0;
	}else{
		oferta = $('#txtOferta').val();
	}
	eficiencia = total / oferta;
	$('#txtEficiencia').val((eficiencia*100).toFixed(2));
	
	utilidadBruta = oferta - total;
	$('#txtUtilidadBruta').val(utilidadBruta);
}

function cambiarSelectorProveedorPago(idTempFila){
	$('#sltProveedor_'+idTempFila).val($('#sltProveedorSC_'+idTempFila).val());
}

function cambiarPagoProveedor(idTempFila){
	$('#montoTotal_'+idTempFila).val($('#txtMontoSC_'+idTempFila).val());
}


function calcularMontoParcialxPorcentaje_Pago1(idTempFila){
	var monto = $('#montoTotal_'+idTempFila).val();
	var porcentaje = $('#txtPorcentaje_pago1_'+idTempFila).val();
	var montoParcial = (monto*(porcentaje/100));
	$('#txtPagoParcial_pago1_'+idTempFila).val(montoParcial);
		
}
function calcularMontoParcialxPorcentaje_Pago2(idTempFila){
	var monto = $('#montoTotal_'+idTempFila).val();
	var porcentaje = $('#txtPorcentaje_pago2_'+idTempFila).val();
	var montoParcial = (monto*(porcentaje/100));
	$('#txtPagoParcial_pago2_'+idTempFila).val(montoParcial);
}
function calcularMontoParcialxPorcentaje_Pago3(idTempFila){
	var monto = $('#montoTotal_'+idTempFila).val();
	var porcentaje = $('#txtPorcentaje_pago3_'+idTempFila).val();
	var montoParcial = (monto*(porcentaje/100));
	$('#txtPagoParcial_pago3_'+idTempFila).val(montoParcial);
}

function grabarProyecto(){
	$('#frmCrearProyecto').submit();
}

</script>
<script id="templateSelectorClientes" type="text/x-handlebars-template">
	<option value="{{idCliente}}">{{nombre}}</option>
</script>
<script id="templateSelectorProveedores" type="text/x-handlebars-template">
	<option value="{{idProveedor}}">{{nombre}}</option>
</script>

<!-- Filas de Tabla Subcontratos -->
<script id="templateProveedoresSubcontratos_tabla" type="text/x-handlebars-template">
	<tr role="row" class="filter" id="fila_SC_{{idFila}}">
		<td>
			<select id="sltProveedorSC_{{idFila}}" class="form-control" name="idProveedorSC" onchange="cambiarSelectorProveedorPago({{idFila}});">
				<option>Proveedores</option>
			</select>
		</td>
		<td>
			<select id="sltTipoSC_{{idFila}}" class="form-control" name="tipoSC">
				<option>Obra</option>
				<option>Estudio</option>
				<option>Adecuacion</option>
				<option>Proyecto</option>
				<option>Estructura Metalica</option>
			</select>
		</td>
		<td>
			<input onchange="recalcularTotalesSubcontratos(); cambiarPagoProveedor({{idFila}});" id="txtMontoSC_{{idFila}}" class="form-control" placeholder="Monto USD$/." name="montoSC"/>
		</td>
		<td>
			<div class="margin-bottom-5">
				
				<span class="btn btn-sm red filter-cancel"><i class="fa fa-times"></i></span>
			</div>
		</td>
	</tr>
</script>

<script id="templateProveedoresPago_tabla" type="text/x-handlebars-template">
	<tr role="row" class="filter" id="fila_pago_{{idFila}}">
		 <td>
			 <select id="sltProveedor_{{idFila}}" name="pago_idProveedor" class="form-control form-filter input-sm">
			 </select>
			 <input id="montoTotal_{{idFila}}" type="text" class="form-control form-filter input-sm" name="pago_montoTotal" placeholder="Monto USD $/.">
		 </td>
		 <td>
			 <table class="table" style="margin-bottom: 5px;">
			 <tr>
				 <td width="25%" style="padding: 1px;"><input onchange="calcularMontoParcialxPorcentaje_Pago1({{idFila}})" id="txtPorcentaje_pago1_{{idFila}}" type="text" class="form-control form-filter input-sm" name="pago_porcentaje" placeholder="%"></td>
				 <td style="padding: 1px;"><input id="txtPagoParcial_pago1_{{idFila}}" type="text" class="form-control form-filter input-sm" name="pago_montoParcial" placeholder="USD $/."></td>
			 </tr>
			 <tr>
				 <td style="padding: 1px;" colspan="2">
					 <div class="input-group date date-picker margin-bottom-5" data-date-format="dd/mm/yyyy">
						 <input type="text" class="form-control form-filter input-sm" name="pago_fecha" placeholder="Cobrar">
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
				 <td width="25%" style="padding: 1px;"><input onchange="calcularMontoParcialxPorcentaje_Pago2({{idFila}})" id="txtPorcentaje_pago2_{{idFila}}" type="text" class="form-control form-filter input-sm" name="pago_porcentaje" placeholder="%"></td>
				 <td style="padding: 1px;"><input id="txtPagoParcial_pago2_{{idFila}}" type="text" class="form-control form-filter input-sm" name="pago_montoParcial" placeholder="USD $/."></td>
			 </tr>
			 <tr>
				 <td style="padding: 1px;" colspan="2">
					 <div class="input-group date date-picker margin-bottom-5" data-date-format="dd/mm/yyyy">
						 <input type="text" class="form-control form-filter input-sm" name="pago_fecha" placeholder="Cobrar">
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
				 <td width="25%" style="padding: 1px;"><input onchange="calcularMontoParcialxPorcentaje_Pago3({{idFila}})" id="txtPorcentaje_pago2_{{idFila}}" type="text" class="form-control form-filter input-sm" name="pago_porcentaje" placeholder="%"></td>
				 <td style="padding: 1px;"><input id="txtPagoParcial_pago2_{{idFila}}" type="text" class="form-control form-filter input-sm" name="pago_montoParcial" placeholder="USD $/."></td>
			 </tr>
			 <tr>
				 <td style="padding: 1px;" colspan="2">
					 <div class="input-group date date-picker margin-bottom-5" data-date-format="dd/mm/yyyy">
						 <input type="text" class="form-control form-filter input-sm" name="pago_fecha" placeholder="Cobrar">
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
				 <span class="btn btn-sm green filter-submit margin-bottom"><i class="fa fa-plus"></i></span>
				 <span class="btn btn-sm red filter-cancel"><i class="fa fa-times"></i></span>
			 </div>
		 </td>
	 </tr>
</script>

</body>
</html>