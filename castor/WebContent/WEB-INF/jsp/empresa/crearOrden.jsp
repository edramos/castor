<!DOCTYPE html>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Castor | Crear Orden</title>
<jsp:include page="../comps/headMandatory.jsp"/>
<!-- BEGIN PAGE LEVEL STYLES -->
<link rel="stylesheet" type="text/css" href="assets/global/plugins/bootstrap-datepicker/css/datepicker.css"/>
<!-- END PAGE LEVEL STYLES -->
<style>
.table > tbody > tr > td, .table > tbody > tr > th, .table > tfoot > tr > td, .table > tfoot > tr > th, .table > thead > tr > td, .table > thead > tr > th{
	border-top: 0px solid #DDD;
}
.well {
	padding: 0px;margin-bottom: 0px;
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
				<div class="caption"><i class="icon-share"></i>Crear Orden de Trabajo</div>
				<div class="actions">							
					<a class="btn btn-icon-only btn-default btn-sm fullscreen" href="#" data-original-title="" title=""></a>
				</div>
			</div>
			<div class="portlet-body form">
			
				<form:form id="frmCrearOrden" class="form-horizontal" action="crearOrden" method="post" commandName="ordenBean">
					<div class="form-body">
						<h4 class="form-section">General</h4>
						<div class="row">
							<div class="col-md-3">
								<div class="form-group">
									<div class="col-md-12">
										<input id="txtNombre" class="form-control" placeholder="Nombre Orden" name="nombre"/>
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
								<div class="form-group">
									<div class="col-md-12">
										<select id="sltTipo" class="form-control" name="tipoOrden">
											<option value="OC">Obra Civil</option>
											<option value="TV">Trabajos Varios</option>
										</select>
									</div>
								</div>
							</div>
							<div class="col-md-3">
								<div class="form-group">
									<div class="col-md-12">
										<select id="sltTipo" class="form-control" name="tipoTrabajo">
											<option value="Obra">Obra</option>
											<option value="Estudio">Estudio</option>
											<option value="Adecuacion">Adecuacion</option>
											<option value="Proyecto">Proyecto</option>
											<option value="Estructura Metalica">Estructura Metalica</option>
										</select>
									</div>
								</div>
							</div>
						</div>
						
						<div class="row">
							<div class="col-md-3">
								<div class="form-group">
									<div class="col-md-12">
										<input id="txtLat" class="form-control" placeholder="Latitud" name="lat"/>
									</div>
								</div>
							</div>
							<div class="col-md-3">
								<div class="form-group">
									<div class="col-md-12">
										<input id="txtLon" class="form-control" placeholder="Longitud" name="lon"/>
									</div>
								</div>
							</div>
							<div class="col-md-3">
								<div class="form-group">
									<div class="col-md-12">
										<input id="txtCiudad" class="form-control" placeholder="Ciudad" name="ciudad"/>
									</div>
								</div>
							</div>							
							<div class="col-md-3">
								<div class="form-group">
									<div class="col-md-12">
										<select id="sltDepartamento" class="form-control" name="departamento">
											<option value="Lima">Lima</option>
											<option value="Cajamarca">Cajamarca</option>
											<option value="Ancash">Ancash</option>
										</select>
									</div>
								</div>
							</div>
						</div>
						
						<div class="row">
							<div class="col-md-3">
								<div class="form-group">
									<div class="col-md-12">
										<div id="txtFechaEntrega" class="input-group date date-picker margin-bottom-5" data-date-format="dd/mm/yyyy">
											<input type="text" class="form-control form-filter" placeholder="Fecha Entrega" name="fechaEntrega"/>											
											<span class="input-group-btn">
											<button class="btn default" type="button"><i class="fa fa-calendar"></i></button>
											</span>
										</div>
									</div>
								</div>
							</div>
						</div>
						
						
						<!-- INFORMACION FINANCIERA -->
						
						<h4 class="form-section">Informacion Financiera</h4>
						<div class="row">
							<div class="col-md-3">
								<div class="form-group">
									<div class="col-md-12">
										<select id="sltClienteMoneda" class="form-control" name="moneda">
											<option value="dolar americano">USD ($/.)</option>
											<option value="nuevo sol">PEN (S/.)</option>
										</select>
									</div>
								</div>
							</div>
							<div class="col-md-3">
								<div class="form-group">
									<div class="col-md-12">
										<input id="txtOferta" data-inputmask="'alias': 'numeric', 'groupSeparator': ',', 'autoGroup': true, 'digits': 2, 'digitsOptional': false, 'prefix': '$ ','placeholder': '0'" class="form-control" placeholder="Oferta" name="oferta"/>
									</div>
								</div>
							</div>
							<div class="col-md-3">
								<div class="form-group">
									<div class="col-md-12">
										<input id="txtEficiencia" class="form-control" style="text-align:right;" disabled="disabled" placeholder="Eficiencia %" name="eficiencia"/>
									</div>
								</div>
							</div>
							<div class="col-md-3">
								<div class="form-group">
									<div class="col-md-12">
										<input id="txtUtilidadBruta" data-inputmask="'alias': 'numeric', 'groupSeparator': ',', 'autoGroup': true, 'digits': 2, 'digitsOptional': false, 'prefix': '$ ','placeholder': '0'" class="form-control" disabled="disabled" placeholder="Utilidad Bruta" name="utilidadBruta"/>
									</div>
								</div>
							</div>
						</div>
						
						
						<!-- COBRO CLIENTE -->
						
						<h4 class="form-section">Cobro Cliente</h4>
						<!-- <div class="row">
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
						</div> -->
						
						
						<!-- SUBCONTRATOS -->
						
						<h4 class="form-section">Subcontratos</h4>
						<div class="row">
							<div class="col-md-12">
								<div class="table-container">
									<div class="table-scrollable">
										<table class="table table-striped table-bordered table-hover dataTable no-footer">
										<thead>
											<tr role="row" class="heading">
												<th width="20%">Proveedor</th>
												<th width="20%">Tipo</th>
												<th width="10%">Moneda</th>
												<th width="20%">Monto</th>
												<th width="20%">Termino Obra</th>
												<th width="10%">Acciones</th>
											</tr>
											<tr role="row" class="filter" id="fila_SC_0">
												<td>
													<select id="sltProveedorSC_0" class="form-control" name="idProveedorSC" onchange="cambiarSelectorProveedorPago(0);">
														<option>Proveedores</option>
													</select>
												</td>
												<td>
													<select id="sltTipoTrabajoSC_0" class="form-control" name="tipoTrabajoSC">
														<option>Obra</option>
														<option>Estudio</option>
														<option>Adecuacion</option>
														<option>Proyecto</option>
														<option>Estructura Metalica</option>
													</select>
												</td>
												<td>
													<div class="form-group">
														<div class="col-md-12">
															<select id="sltMonedaSC_0" class="form-control" name="monedaSC">
																<option value="dolar americano">USD ($/.)</option>
																<option value="nuevo sol">PEN (S/.)</option>
															</select>
														</div>
													</div>
												</td>
												<td>
													<input onchange="recalcularTotalesSubcontratos(); cambiarPagoProveedor(0);" id="txtMontoSC_0" class="form-control" placeholder="Monto" name="montoSC"/>
												</td>
												<td>
													<div class="input-group date date-picker margin-bottom-5" data-date-format="dd/mm/yyyy">
														<input id="txtTerminoObraSC_0" type="text" class="form-control form-filter" name="fechaTerminoObra" placeholder="Termino Obra">
														<span class="input-group-btn">
														<button class="btn default" type="button"><i class="fa fa-calendar"></i></button>
														</span>
													</div>
													<input style="display:none" id="txtEstadoSC_0" class="form-control" placeholder="Estado" name="estadoSC" value="enabled"/>
												</td>
												<td>
													<div class="margin-bottom-5">
														<span class="btn btn-sm green filter-submit margin-bottom" onclick="agregarNuevaFilaSubcontratos();"><i class="fa fa-plus"></i></span>
														<!-- <span class="btn btn-sm red filter-cancel"><i class="fa fa-times"></i></span> -->
													</div>
												</td>
											</tr>
										</thead>
										
										<tbody id="vistaTablaSubcontratosProveedores">
										</tbody>
										
										
										<tbody>
										<tr>
											<td></td><td></td><td></td>
											<td>
												<div class="well" style="text-align: right;">
													Subtotal: <input size="12" id="txtSubTotal" data-inputmask="'alias': 'numeric', 'groupSeparator': ',', 'autoGroup': true, 'digits': 2, 'digitsOptional': false, 'prefix': '$ ','placeholder': '0'" disabled="disabled" placeholder="SubTotal" name="subTotal"/><br/>
													G.G.: <input size="12" id="txtGastosGenerales" data-inputmask="'alias': 'numeric', 'groupSeparator': ',', 'autoGroup': true, 'digits': 2, 'digitsOptional': false, 'prefix': '$ ','placeholder': '0'" onchange="recalcularTotalesSubcontratos();" placeholder="Gastos Generales" name="gastosGenerales"/><br/>
													<strong>Total: </strong><input size="12" id="txtTotal" data-inputmask="'alias': 'numeric', 'groupSeparator': ',', 'autoGroup': true, 'digits': 2, 'digitsOptional': false, 'prefix': '$ ','placeholder': '0'" disabled="disabled" placeholder="Total" name="total"/>
												</div>
											</td>
											<td></td><td></td>
										</tr>
										</tbody>	
										</table>
									</div>
								</div>
							</div>
						</div>
						
						
						
						<!-- PAGO PROVEEDORES -->
						
						<h4 class="form-section">Pago Proveedores</h4>
						<div class="row">
							<div class="col-md-12">
								<div class="table-container">
									<div class="table-scrollable">
										<table class="table table-striped table-bordered table-hover dataTable no-footer">
										<thead>
										<tr role="row" class="heading">
											<th width="20%">Proveedor</th>
											<th width="20%">Pago 1</th>
											<th width="20%">Pago 2</th>
											<th width="20%">Pago 3</th>
											<th width="10%">Acciones</th>
										</tr>
										<tr role="row" class="filter" id="fila_pago_0">
											<td>
												<span id="spnProveedor_0"></span>
			 									<span id="spnMontoTotal_0"></span>
												<select style="display:none" id="sltProveedor_0" name="pago_idProveedor" class="form-control form-filter input-sm">
												</select>
												<input style="display:none" id="montoTotal_0" type="text" class="form-control form-filter input-sm" name="pago_montoTotal" placeholder="Monto USD $/.">
												<input style="display:none" id="txtEstado_0" class="form-control" placeholder="Estado" name="estado" value="enabled"/>
											</td>
											<td>
												<table class="table" style="margin-bottom: 5px;">
												<tr>
													<td width="35%" style="padding: 1px;"><input onchange="calcularMontoParcialxPorcentaje_Pago1(0)" id="txtPorcentaje_pago1_0" type="text" class="form-control form-filter input-sm" name="pago_porcentaje" placeholder="%"></td>
													<td style="padding: 1px;"><input id="txtPagoParcial_pago1_0" type="text" class="form-control form-filter input-sm" name="pago_montoParcial" placeholder="USD $/."></td>
												</tr>
												<tr>
													<td style="padding: 1px;" colspan="2">
														<div class="input-group date date-picker margin-bottom-5" data-date-format="dd/mm/yyyy">
															<input id="txtFechaCobroProv_pago1_0" type="text" class="form-control form-filter input-sm" name="pago_fecha" placeholder="Cobrar">
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
													<td width="35%" style="padding: 1px;"><input onchange="calcularMontoParcialxPorcentaje_Pago2(0)" id="txtPorcentaje_pago2_0" type="text" class="form-control form-filter input-sm" name="pago_porcentaje" placeholder="%"></td>
													<td style="padding: 1px;"><input id="txtPagoParcial_pago2_0" type="text" class="form-control form-filter input-sm" name="pago_montoParcial" placeholder="USD $/."></td>
												</tr>
												<tr>
													<td style="padding: 1px;" colspan="2">
														<div class="input-group date date-picker margin-bottom-5" data-date-format="dd/mm/yyyy">
															<input id="txtFechaCobroProv_pago2_0" type="text" class="form-control form-filter input-sm" name="pago_fecha" placeholder="Cobrar">
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
													<td width="35%" style="padding: 1px;"><input onchange="calcularMontoParcialxPorcentaje_Pago3(0)" id="txtPorcentaje_pago3_0" type="text" class="form-control form-filter input-sm" name="pago_porcentaje" placeholder="%"></td>
													<td style="padding: 1px;"><input id="txtPagoParcial_pago3_0" type="text" class="form-control form-filter input-sm" name="pago_montoParcial" placeholder="USD $/."></td>
												</tr>
												<tr>
													<td style="padding: 1px;" colspan="2">
														<div class="input-group date date-picker margin-bottom-5" data-date-format="dd/mm/yyyy">
															<input id="txtFechaCobroProv_pago3_0" type="text" class="form-control form-filter input-sm" name="pago_fecha" placeholder="Cobrar">
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
					<input id="hdnSubcontratos" type="hidden" name="subcontratos" value=""/>
					<input id="hdnPagoProveedores" type="hidden" name="pagoproveedores" value=""/>
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
<script type="text/javascript" src="assets/global/plugins/jquery-inputmask/jquery.inputmask.bundle.js"></script>
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
   	//FormValidation.init();

	datePickerInit();
	
	//Cargo Selector de Cliente
	listarSelectorClientes('sltCliente');
	listarSelectorProveedores('sltProveedor_0');
	listarSelectorProveedores('sltProveedorSC_0');
	
	$("#txtMontoSC_0").inputmask("decimal",{
		radixPoint: ".", 
        groupSeparator: ",", 
        digits: 2,
        autoGroup: true,
    });
    
    $(":input").inputmask();
});

$(document).ready(function(){
	$("#frmCrearOrden").validate({
		rules: {
			nombre: {
				required: true,
			},   
			idCliente: {
				required: true,
			},   
			tipoOrden: {
				required: true,
			},   
			tipoTrabajo: {
				required: true,
			},   
			departamento: {
				required: true,
			}
		},
		messages: {
			nombre: "*",
			idCliente: "*",
			tipoOrden: "*",
			tipoTrabajo: "*",
			departamento: "*"
		},
		submitHandler: function(form){
			if($('#txtLat').val()==''){
				$('#txtLat').val(0.0);
			}
			if($('#txtLon').val()==''){
				$('#txtLon').val(0.0);
			}
			form.submit();
		}
	});
});

/*GRABAR ORDEN DE TRABAJO*/
function grabarProyecto(){
	if($('#txtEficiencia').val() == ""){
		$('#txtEficiencia').val(0);
	}
	
	//SUBCONTRATOS
	var subcontratos = [];
	
	for(x = 0; x <= idFila; x++){
		//var subc = {idProveedorSC:$('#sltProveedorSC_' + x).val(), tipoTrabajoSC:$('#sltTipoTrabajoSC_' + x).val(), monedaSC:$('#sltMonedaSC_' + x).val(), montoSC:$('#txtMontoSC_' + x).val()};
		if($('#sltProveedorSC_' + x).val()== ""){
			subcontratos.push("1");
		}else{
			subcontratos.push($('#sltProveedorSC_' + x).val());
		}
		subcontratos.push($('#sltTipoTrabajoSC_' + x).val());
		subcontratos.push($('#sltMonedaSC_' + x).val());
		//Cuando se pase a JSON la coma ya no sera un problema y se podra pasar el Objeto Subcontrato
		var currencyMonto = Number($('#txtMontoSC_' + x).val().replace(/[^0-9\.]+/g,""));
		subcontratos.push(currencyMonto);
		
		if($('#txtTerminoObraSC_' + x).val()== ""){
			var d = new Date(); 
			//var strDate = d.getFullYear() + "/" + (d.getMonth()+1) + "/" + d.getDate();
			var strDate = d.getDate() + "/" + (d.getMonth()+1) + "/" + d.getFullYear();
			subcontratos.push(strDate);
		}else{
			subcontratos.push($('#txtTerminoObraSC_' + x).val());
		}

		subcontratos.push($('#txtEstadoSC_' + x).val());
		//subcontratos.push(subc);
	}
		
	//PAGO PROVEEDORES
	var pagoProveedores = [];
	
	for(x = 0; x <= idFila; x++){
		
		pagoProveedores.push($('#sltProveedor_' + x).val());
		//Cuando se pase a JSON la coma ya no sera un problema y se podra pasar el Objeto Subcontrato
		//Pago 1
		var currencyMontoParcial_Pago1 = Number($('#txtPagoParcial_pago1_' + x).val().replace(/[^0-9\.]+/g,""));
		pagoProveedores.push(currencyMontoParcial_Pago1);
		pagoProveedores.push($('#txtFechaCobroProv_pago1_' + x).val());
		//Pago 2
		var currencyMontoParcial_Pago2 = Number($('#txtPagoParcial_pago2_' + x).val().replace(/[^0-9\.]+/g,""));
		pagoProveedores.push(currencyMontoParcial_Pago2);
		pagoProveedores.push($('#txtFechaCobroProv_pago2_' + x).val());
		//Pago 3
		var currencyMontoParcial_Pago3 = Number($('#txtPagoParcial_pago3_' + x).val().replace(/[^0-9\.]+/g,""));
		pagoProveedores.push(currencyMontoParcial_Pago3);
		pagoProveedores.push($('#txtFechaCobroProv_pago3_' + x).val());
		
		pagoProveedores.push($('#txtEstado_' + x).val());
		
		//subcontratos.push(subc);
	}
	
	
	$('#hdnSubcontratos').val(subcontratos);
	
	$('#hdnPagoProveedores').val(pagoProveedores);
	
	$('#frmCrearOrden').submit();
}

function datePickerInit(){
	$('.date-picker').datepicker({
		rtl: Metronic.isRTL(),
        autoclose: true
    });
    $('.date-picker .form-control').change(function() {
    	$('#frmCrearOrden').validate().element($(this)); 
    })
}

function listarSelectorClientes(nombreSelector){
	var html = '';
    $.ajax({
 		url: 'ajaxListarClientes',
 		type: 'post',
 		dataType: 'json',
 		data: '',
 		success: function(clientes){
 			html = '<option value="">Escoger Cliente</option>';
 			$.each(clientes, function(i, cliente){
	 			var source = $("#templateSelectorClientes").html();
	 			var template = Handlebars.compile(source);
	 			html += template(cliente);
	 			
 			});		
 			$("#" + nombreSelector).html(html);	        
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
 			html = '<option value="">Escoger Proveedor</option>';
 			$.each(proveedores, function(i, proveedor){
	 			var source = $("#templateSelectorProveedores").html();
	 			var template = Handlebars.compile(source);
	 			html += template(proveedor);	 			
 			});		
 			$("#" + nombreSelector).html(html);	        
 		},
 		complete: function() {	 			
 			
  		}
 	});
}
var idFila = 0;

function agregarNuevaFilaSubcontratos(){
	idFila++;
	var entidadFila = new Object();
	entidadFila.idFila = idFila;
	var html = '';
	var source = $("#templateProveedoresSubcontratos_tabla").html();
	var template = Handlebars.compile(source);
	html += template(entidadFila);
	$("#vistaTablaSubcontratosProveedores").append(html);
	
	$("#txtMontoSC_" + idFila).inputmask("decimal",{
		radixPoint: ".", 
        groupSeparator: ",", 
        digits: 2,
        autoGroup: true,
    });
	
	//datePickerInit();
	
	listarSelectorProveedores('sltProveedorSC_' + idFila);
	recalcularTotalesSubcontratos();
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
	
	datePickerInit()
}

function recalcularTotalesSubcontratos(){
	var subtotal = 0;
	var gastosg = 0;
	var total = 0;
	
	arregloMontoSC = document.getElementsByName('montoSC');
	
	arregloEstadoSC = document.getElementsByName('estadoSC');
	
	for(var x = 0; x < arregloMontoSC.length; x++){
		//alert("montos: " + arregloMontoSC[x].value);
		if(arregloMontoSC[x].value == ''){
			;
		}else{
			if(arregloEstadoSC[x].value == 'enabled'){
				//subtotal = parseFloat(arregloMontoSC[x].value) + subtotal;
				//alert('monto ' + x + ': ' + arregloMontoSC[x].value);
				var currency = Number(arregloMontoSC[x].value.replace(/[^0-9\.]+/g,""));
				//alert('currency: ' + currency);
				subtotal += currency;
				//alert("subtotal: " + subtotal);
			}			
		}
  	}
	
	
	if($('#txtGastosGenerales').val()==''){
		gastosg = 0;
		$('#txtGastosGenerales').val(gastosg);
	}else{
		//gastosg = ;
		var currencyGG = Number($('#txtGastosGenerales').val().replace(/[^0-9\.]+/g,""));
		gastosg = currencyGG;
	}
	
	total = subtotal + gastosg;
	$('#txtSubTotal').val(subtotal);
	$('#txtTotal').val(total);
	
	$('#spnSubtotal').val(subtotal);
	
	//
	var eficiencia = 0;
	var oferta = 0; 
	var utilidadBruta = 0;
	
	if($('#txtOferta').val()==''){
		oferta = 0;
	}else{
		oferta = Number($('#txtOferta').val().replace(/[^0-9\.]+/g,""));
	}
	
	eficiencia =  total / oferta;
	$('#txtEficiencia').val((eficiencia*100).toFixed(1) + "%");
	
	utilidadBruta = oferta - total;
	$('#txtUtilidadBruta').val(utilidadBruta);
}

function cambiarSelectorProveedorPago(idTempFila){
	$('#sltProveedor_'+idTempFila).val($('#sltProveedorSC_'+idTempFila).val());
	$('#spnProveedor_'+idTempFila).text($('#sltProveedorSC_'+idTempFila+' option:selected').text());
}

function cambiarPagoProveedor(idTempFila){
	//$('#montoTotal_'+idTempFila).val($('#txtMontoSC_'+idTempFila).val());
	$('#montoTotal_'+idTempFila).val(Number($('#txtMontoSC_'+idTempFila).val().replace(/[^0-9\.]+/g,"")));
	$('#spnMontoTotal_'+idTempFila).text($('#txtMontoSC_'+idTempFila).val());
}


function calcularMontoParcialxPorcentaje_Pago1(idTempFila){
	//var monto = $('#montoTotal_'+idTempFila).val();
	var monto = Number($('#montoTotal_'+idTempFila).val().replace(/[^0-9\.]+/g,""));
	var porcentaje = $('#txtPorcentaje_pago1_'+idTempFila).val();
	var montoParcial = (monto*(porcentaje/100));
	$('#txtPagoParcial_pago1_'+idTempFila).val(montoParcial);
		
}
function calcularMontoParcialxPorcentaje_Pago2(idTempFila){
	//var monto = $('#montoTotal_'+idTempFila).val();
	var monto = Number($('#montoTotal_'+idTempFila).val().replace(/[^0-9\.]+/g,""));
	var porcentaje = $('#txtPorcentaje_pago2_'+idTempFila).val();
	var montoParcial = (monto*(porcentaje/100));
	$('#txtPagoParcial_pago2_'+idTempFila).val(montoParcial);
}
function calcularMontoParcialxPorcentaje_Pago3(idTempFila){
	//var monto = $('#montoTotal_'+idTempFila).val();
	var monto = Number($('#montoTotal_'+idTempFila).val().replace(/[^0-9\.]+/g,""));
	var porcentaje = $('#txtPorcentaje_pago3_'+idTempFila).val();
	var montoParcial = (monto*(porcentaje/100));
	$('#txtPagoParcial_pago3_'+idTempFila).val(montoParcial);
}


function borrarSubcontratoProveedor(idTempFila){
	$('#fila_SC_'+idTempFila).hide();
	$('#txtEstadoSC_'+idTempFila).val('disabled');
	
	$('#fila_pago_'+idTempFila).hide();
	$('#txtEstado_'+idTempFila).val('disabled');
	
	recalcularTotalesSubcontratos();
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
			<select id="sltTipoTrabajoSC_{{idFila}}" class="form-control" name="tipoTrabajoSC">
				<option>Obra</option>
				<option>Estudio</option>
				<option>Adecuacion</option>
				<option>Proyecto</option>
				<option>Estructura Metalica</option>
			</select>
		</td>
		<td>
			<div class="form-group">
				<div class="col-md-12">
					<select id="sltMonedaSC_{{idFila}}" class="form-control" name="monedaSC">
						<option value="dolar americano">USD ($/.)</option>
						<option value="nuevo sol">PEN (S/.)</option>
					</select>
				</div>
			</div>
		</td>
		<td>
			<input onchange="recalcularTotalesSubcontratos(); cambiarPagoProveedor({{idFila}});" id="txtMontoSC_{{idFila}}" class="form-control" placeholder="Monto" name="montoSC"/>
		</td>
		<td>
			<div class="input-group date date-picker margin-bottom-5" data-date-format="dd/mm/yyyy">
				<input id="txtTerminoObraSC_{{idFila}}" type="text" class="form-control form-filter" name="fechaTerminoObra" placeholder="Termino Obra">
				<span class="input-group-btn">
					<button class="btn default" type="button"><i class="fa fa-calendar"></i></button>
				</span>
			</div>
			<input style="display:none" id="txtEstadoSC_{{idFila}}" class="form-control" placeholder="Estado" name="estadoSC" value="enabled"/>
		</td>
		<td>
			<div class="margin-bottom-5">
				
				<span class="btn btn-sm red filter-cancel" onclick="borrarSubcontratoProveedor({{idFila}})"><i class="fa fa-times"></i></span>
			</div>
		</td>
	</tr>
</script>

<script id="templateProveedoresPago_tabla" type="text/x-handlebars-template">
	<tr role="row" class="filter" id="fila_pago_{{idFila}}">
		 <td>
			 <span id="spnProveedor_{{idFila}}"></span>
			 <span id="spnMontoTotal_{{idFila}}"></span>
			 <select style="display:none" id="sltProveedor_{{idFila}}" name="pago_idProveedor" class="form-control form-filter input-sm">
			 </select>
			 <input style="display:none" id="montoTotal_{{idFila}}" type="text" class="form-control form-filter input-sm" name="pago_montoTotal" placeholder="Monto USD $/.">
			 <input style="display:none" id="txtEstado_{{idFila}}" class="form-control" placeholder="Estado" name="estado" value="enabled"/>
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
						 <input id="txtFechaCobroProv_pago1_{{idFila}}"  type="text" class="form-control form-filter input-sm" name="pago_fecha" placeholder="Cobrar">
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
						 <input id="txtFechaCobroProv_pago2_{{idFila}}" type="text" class="form-control form-filter input-sm" name="pago_fecha" placeholder="Cobrar">
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
				 <td width="25%" style="padding: 1px;"><input onchange="calcularMontoParcialxPorcentaje_Pago3({{idFila}})" id="txtPorcentaje_pago3_{{idFila}}" type="text" class="form-control form-filter input-sm" name="pago_porcentaje" placeholder="%"></td>
				 <td style="padding: 1px;"><input id="txtPagoParcial_pago3_{{idFila}}" type="text" class="form-control form-filter input-sm" name="pago_montoParcial" placeholder="USD $/."></td>
			 </tr>
			 <tr>
				 <td style="padding: 1px;" colspan="2">
					 <div class="input-group date date-picker margin-bottom-5" data-date-format="dd/mm/yyyy">
						 <input id="txtFechaCobroProv_pago3_{{idFila}}" type="text" class="form-control form-filter input-sm" name="pago_fecha" placeholder="Cobrar">
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