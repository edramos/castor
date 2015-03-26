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
													<input onkeyup="recalcularTotalesSubcontratos(); cambiarPagoProveedor(0);" data-inputmask="'alias': 'numeric', 'groupSeparator': ',', 'autoGroup': true, 'digits': 2, 'digitsOptional': false, 'prefix': '$ ','placeholder': '0'" id="txtMontoSC_0" class="form-control" placeholder="Monto" name="montoSC"/>
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
										
										<!-- Tabla contenedora de Proveedor y Monto -->
										<table id="tablaDatosPagoProv_0" class="table table-striped table-bordered table-hover dataTable no-footer">
											<thead>
												<tr role="row" class="heading">
													<th width="20%">Proveedor</th>
													<th width="20%">Monto</th>
												</tr>
											</thead>
											<tbody>
												<tr role="row" class="filter">
													<td>
														<span id="spnProveedor_0"></span>
													</td>
													<td>
														<span id="spnMontoTotal_0"></span>												
													</td>					
												</tr>
											</tbody>										
										</table>
										
										
										<!-- Tabla contenedora de Pagos del Proveedor de la tabla anterior -->
										<table id="tablaPagoProvDetalles_0" class="table table-striped table-bordered table-hover dataTable no-footer">
											<thead>
												<tr role="row" class="heading">
													<th width="10%">Porcentaje</th>
													<th width="20%">Monto Parcial</th>
													<th width="20%">Tipo Pago</th>
													<th width="20%">Fecha Vencimiento</th>
													<th width="20%">Fecha Pago Programada</th>
													<th width="10%">Acciones</th>
												</tr>
											</thead>
											<tbody>
												<tr role="row" class="filter" id="fila_pago_0_0">
													<td>
														<input style="display:none" id="txtIdProveedor_pago_0_0" type="text" class="form-control form-filter input-sm" name="pago_filaProveedor" placeholder="idProveedor" value="0">
														<input onkeyup="calcularMontoParcialxPorcentaje_Pago(0,0);" id="txtPorcentaje_pago_0_0" type="text" class="form-control form-filter input-sm pago_porcentaje_0" name="pago_porcentaje" placeholder="%">
													</td>
													<td>
														<input id="txtPagoParcial_pago_0_0" type="text" class="form-control form-filter input-sm" name="pago_montoParcial" placeholder="USD $/.">
													</td>
													<td>
														<select id="sltTipoPago_pago_0_0" class="form-control" name="pago_tipoPago">
															<option value="efectivo">Efectivo</option>
															<option value="deposito">Deposito</option>
															<option value="cheque">Cheque</option>
															<option value="transferencia">Transferencia</option>
														</select>
													</td>
													<td>
														<div class="input-group date date-picker margin-bottom-5" data-date-format="dd/mm/yyyy">
															<input id="txtFechaVencimientoProv_pago_0_0" type="text" class="form-control form-filter input-sm" name="pago_fechaVencimiento" placeholder="Vencimiento">
															<span class="input-group-btn">
															<button class="btn btn-sm default" type="button"><i class="fa fa-calendar"></i></button>
															</span>
														</div>
													</td>
													<td>
														<div class="input-group date date-picker margin-bottom-5" data-date-format="dd/mm/yyyy">
															<input id="txtFechaProgramadaProv_pago_0_0" type="text" class="form-control form-filter input-sm" name="pago_fechaProgramada" placeholder="Programada">
															<span class="input-group-btn">
															<button class="btn btn-sm default" type="button"><i class="fa fa-calendar"></i></button>
															</span>
														</div>
														<input style="display:none" id="txtEstado_pago_0_0" class="form-control pago_estado_0" placeholder="Estado" name="pago_estado" value="enabled"/>
													</td>
													
													<td>
														<div class="margin-bottom-5">
															<span onclick="agregarNuevaFilaPagos_Prov(0);" class="btn btn-sm green filter-submit margin-bottom"><i class="fa fa-plus"></i></span>
															<!-- <span class="btn btn-sm red filter-cancel"><i class="fa fa-times"></i></span> -->
														</div>
													</td>
													
												</tr>
											</tbody>
											
											<tbody id="vistaTablaPagos_Filas_0">
											
											</tbody>
										
										</table>
										
										<div id="vistaTablaPagos">
										</div>
										
										
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
				required: true
			},   
			idCliente: {
				required: true
			},   
			tipoOrden: {
				required: true
			},   
			tipoTrabajo: {
				required: true
			},   
			departamento: {
				required: true
			},
			fechaEntrega: {
				required: true
			}
		},
		messages: {
			nombre: "*",
			idCliente: "*",
			tipoOrden: "*",
			tipoTrabajo: "*",
			departamento: "*",
			fechaEntrega: "*"
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
		if($('#txtEstadoSC_' + x).val()== "enabled"){
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
	}
		
	//PAGO PROVEEDORES
	var pagoProveedores = [];
	
	arreglo_FilaSelector = document.getElementsByName('pago_filaProveedor');
	arreglo_Porcentaje = document.getElementsByName('pago_porcentaje');
	arreglo_MontoParcial = document.getElementsByName('pago_montoParcial');
	arreglo_TipoPago = document.getElementsByName('pago_tipoPago');
	arreglo_FechaVen = document.getElementsByName('pago_fechaVencimiento');
	arreglo_FechaProg = document.getElementsByName('pago_fechaProgramada');
	arreglo_Estado = document.getElementsByName('pago_estado');
	
	for(var x = 0; x <= idFila_Pagos; x++){		
		if(arreglo_Estado[x] == undefined){
			;
		}
		else if(arreglo_Estado[x].value == 'disabled'){
			;
		}
		else{
			pagoProveedores.push($('#sltProveedorSC_'+arreglo_FilaSelector[x].value).val());		
			var montoParcial_Temp = Number(arreglo_MontoParcial[x].value.replace(/[^0-9\.]+/g,""));
			pagoProveedores.push(montoParcial_Temp);
			pagoProveedores.push(arreglo_TipoPago[x].value);
			pagoProveedores.push(arreglo_FechaVen[x].value);
			pagoProveedores.push(arreglo_FechaProg[x].value);
		}		
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
		alias: 'numeric',
		groupSeparator: ',',
		autoGroup: true,
		digits: 2,
		digitsOptional: false,
		prefix: '$ ',
		placeholder: '0'
	});
	
	listarSelectorProveedores('sltProveedorSC_' + idFila);
	recalcularTotalesSubcontratos();
	
	agregarNuevaTablaPagos_Prov(idFila);
}

var idFila_Pagos = 0;

function agregarNuevaFilaPagos_Prov(idFilaProv){
	var totalPorcentajeTemp = sumarPorcentajesTablaPagos_Prov(idFilaProv);
	if(totalPorcentajeTemp < 100){
		//
		idFila_Pagos++;
		var entidadFila2 = new Object();
		entidadFila2.idFilaPago = idFila_Pagos;
		entidadFila2.idFilaProv = idFilaProv;
		var html = '';
		var source = $("#templateProveedoresPago_fila").html();
		var template = Handlebars.compile(source);
		html += template(entidadFila2);
		$("#vistaTablaPagos_Filas_"+idFilaProv).append(html);
		//listarSelectorProveedores('sltProveedor_'+idFila_Pagos);
		
		datePickerInit();
		
		//Calculamos el nuevo porcentaje
		$('#txtPorcentaje_pago_'+idFilaProv+'_'+idFila_Pagos).val(100-totalPorcentajeTemp);
		calcularMontoParcialxPorcentaje_Pago(idFilaProv, idFila_Pagos);
	}
	else if(totalPorcentajeTemp > 100){
		alert("Esta sobreparando el 100% en los Pagos");
	}
		
} 

function sumarPorcentajesTablaPagos_Prov(idFilaProv){
	//Buscamos cuanto es el resto del porcentaje que nos falta
	var totalPorcentaje = 0; 
	var array_porcentaje_temp = new Array();
	var array_estado_temp = new Array();
	$(".pago_porcentaje_"+idFilaProv).each(
		function(){
			array_porcentaje_temp.push($(this).val());
		}
	)
	$(".pago_estado_"+idFilaProv).each(
		function(){
			array_estado_temp.push($(this).val());
		}
	)
	
	for	(var i = 0; i < array_porcentaje_temp.length; i++) {
		if(array_estado_temp[i]=='enabled'){
			totalPorcentaje = totalPorcentaje + parseInt(array_porcentaje_temp[i]);	
		}    	
	} 
	//alert(totalPorcentaje);
	return totalPorcentaje;
}

function agregarNuevaTablaPagos_Prov(idFilaProv){
	idFila_Pagos++;
	var entidadFila2 = new Object();
	entidadFila2.idFilaProv = idFilaProv;
	var html = '';
	var source = $("#templateProveedoresPago_tabla").html();
	var template = Handlebars.compile(source);
	html += template(entidadFila2);
	$("#vistaTablaPagos").append(html);
	//listarSelectorProveedores('sltProveedor_'+idFilaTemp);
	
	datePickerInit()
	
	//Agregamos porcentaje 100 al 1er pago
	$('#txtPorcentaje_pago_'+idFilaProv+'_0').val('100');	
}

function recalcularTotalesSubcontratos(){
	var subtotal = 0;
	var gastosg = 0;
	var total = 0;
	
	arregloMontoSC = document.getElementsByName('montoSC');
	
	arregloEstadoSC = document.getElementsByName('estadoSC');
	
	for(var x = 0; x < arregloMontoSC.length; x++){
		if(arregloMontoSC[x].value == ''){
			;
		}else{
			if(arregloEstadoSC[x].value == 'enabled'){
				//subtotal = parseFloat(arregloMontoSC[x].value) + subtotal;
				//alert('monto ' + x + ': ' + arregloMontoSC[x].value);
				var currency = Number(arregloMontoSC[x].value.replace(/[^0-9\.]+/g,""));
				//alert('currency: ' + currency);
				subtotal += currency;
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
	
	if(oferta!=0){
		eficiencia =  total / oferta;
		$('#txtEficiencia').val((eficiencia*100).toFixed(1) + "%");
		
		utilidadBruta = oferta - total;
		$('#txtUtilidadBruta').val(utilidadBruta);
	}
}

function cambiarSelectorProveedorPago(idTempFila){
	//$('#sltProveedor_'+idTempFila).val($('#sltProveedorSC_'+idTempFila).val());
	$('#spnProveedor_'+idTempFila).text($('#sltProveedorSC_'+idTempFila+' option:selected').text());
}

function cambiarPagoProveedor(idTempFila){
	//$('#montoTotal_'+idTempFila).val($('#txtMontoSC_'+idTempFila).val());
	//$('#montoTotal_'+idTempFila).val(Number($('#txtMontoSC_'+idTempFila).val().replace(/[^0-9\.]+/g,"")));
	$('#spnMontoTotal_'+idTempFila).text($('#txtMontoSC_'+idTempFila).val());
	calcularMontoParcialxPorcentaje_Pago(idTempFila, 0);
	if(idTempFila==0){
		$('#txtPorcentaje_pago_0_0').val('100');
		calcularMontoParcialxPorcentaje_Pago(0,0);
	}
}

//Metodo para calcular el Monto parcial a partir del porcentaje
function calcularMontoParcialxPorcentaje_Pago(filaProv, filaPago){
	//var monto = $('#montoTotal_'+idTempFila).val();
	var monto = Number($('#spnMontoTotal_'+filaProv).text().replace(/[^0-9\.]+/g,""));
	var porcentaje = $('#txtPorcentaje_pago_'+filaProv+'_'+filaPago).val();
	var montoParcial = (monto*(porcentaje/100));
	$('#txtPagoParcial_pago_'+filaProv+'_'+filaPago).inputmask("decimal",{
		alias: 'numeric',
		groupSeparator: ',',
		autoGroup: true,
		digits: 2,
		digitsOptional: false,
		prefix: '$ ',
		placeholder: '0'
	});
	$('#txtPagoParcial_pago_'+filaProv+'_'+filaPago).val(montoParcial.toFixed(2));

	
	//
	var totalPorcentajeTemp = sumarPorcentajesTablaPagos_Prov(filaProv);
	
	if(totalPorcentajeTemp > 100){
		alert("Esta sobreparando el 100% en los Pagos");
		$('#btnGrabar').attr('disabled', 'true');		
	}else{
		$('#btnGrabar').removeAttr("disabled");
	}
}

function borrarSubcontratoProveedor(idTempFila){
	$('#fila_SC_'+idTempFila).hide();
	$('#txtEstadoSC_'+idTempFila).val('disabled');
	
	//$('#fila_pago_'+idTempFila).hide();
	//$('#txtEstado_'+idTempFila).val('disabled');
	
	$('#tablaDatosPagoProv_'+idTempFila).remove();
	$('#tablaPagoProvDetalles_'+idTempFila).remove();
	
	recalcularTotalesSubcontratos();
}


function removerFilaPagos_Prov(idFilaProvTemp, idFilaTemp){
	$('#fila_pago_'+idFilaProvTemp+'_'+idFilaTemp).hide();
	$('#txtEstado_pago_'+idFilaProvTemp+'_'+idFilaTemp).val('disabled');
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
			<input onkeyup="recalcularTotalesSubcontratos(); cambiarPagoProveedor({{idFila}});" id="txtMontoSC_{{idFila}}" class="form-control" placeholder="Monto" name="montoSC"/>
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


<script id="templateProveedoresPago_fila" type="text/x-handlebars-template">
<tr role="row" class="filter" id="fila_pago_{{idFilaProv}}_{{idFilaPago}}">
 <td>
	 <input style="display:none" id="txtIdProveedor_pago_{{idFilaProv}}_{{idFilaPago}}" type="text" class="form-control form-filter input-sm" name="pago_filaProveedor" placeholder="idProveedor" value="{{idFilaProv}}">
	 <input onkeyup="calcularMontoParcialxPorcentaje_Pago({{idFilaProv}},{{idFilaPago}})" id="txtPorcentaje_pago_{{idFilaProv}}_{{idFilaPago}}" type="text" class="form-control form-filter input-sm pago_porcentaje_{{idFilaProv}}" name="pago_porcentaje" placeholder="%">
 </td>
 <td>
	 <input id="txtPagoParcial_pago_{{idFilaProv}}_{{idFilaPago}}" type="text" class="form-control form-filter input-sm" name="pago_montoParcial" placeholder="USD $/.">
 </td>
<td>
	<select id="sltTipoPago_pago_{{idFilaProv}}_{{idFilaPago}}" class="form-control" name="pago_tipoPago">
		<option value="efectivo">Efectivo</option>
		<option value="deposito">Deposito</option>
		<option value="cheque">Cheque</option>
		<option value="transferencia">Transferencia</option>
	</select>
</td>
 <td>
	 <div class="input-group date date-picker margin-bottom-5" data-date-format="dd/mm/yyyy">
		 <input id="txtFechaVencimientoProv_pago_{{idFilaProv}}_{{idFilaPago}}" type="text" class="form-control form-filter input-sm" name="pago_fechaVencimiento" placeholder="Vencimiento">
		 <span class="input-group-btn">
		 <button class="btn btn-sm default" type="button"><i class="fa fa-calendar"></i></button>
		 </span>
	 </div>
 </td>
 <td>
	 <div class="input-group date date-picker margin-bottom-5" data-date-format="dd/mm/yyyy">
		 <input id="txtFechaProgramadaProv_pago_{{idFilaProv}}_{{idFilaPago}}" type="text" class="form-control form-filter input-sm" name="pago_fechaProgramada" placeholder="Programada">
		 <span class="input-group-btn">
		 <button class="btn btn-sm default" type="button"><i class="fa fa-calendar"></i></button>
		 </span>
	 </div>
	<input style="display:none" id="txtEstado_pago_{{idFilaProv}}_{{idFilaPago}}" class="form-control pago_estado_{{idFilaProv}}" placeholder="Estado" name="pago_estado" value="enabled"/>
 </td>													
 <td>
	 <div class="margin-bottom-5">
		 <span onclick="removerFilaPagos_Prov({{idFilaProv}},{{idFilaPago}});" class="btn btn-sm red filter-cancel"><i class="fa fa-times"></i></span>
	 </div>
 </td>													
</tr>
</script>

<script id="templateProveedoresPago_tabla" type="text/x-handlebars-template">
<!-- Tabla contenedora de Proveedor y Monto -->
 <table id="tablaDatosPagoProv_{{idFilaProv}}" class="table table-striped table-bordered table-hover dataTable no-footer">
	 <thead>
		 <tr role="row" class="heading">
			 <th width="20%">Proveedor</th>
			 <th width="20%">Monto</th>
		 </tr>
	 </thead>
	 <tbody>
		 <tr role="row" class="filter">
			 <td>
				 <span id="spnProveedor_{{idFilaProv}}"></span>
			 </td>
			 <td>
				 <span id="spnMontoTotal_{{idFilaProv}}"></span>												
			 </td>					
		 </tr>
	 </tbody>										
 </table>
										
										
 <!-- Tabla contenedora de Pagos del Proveedor de la tabla anterior -->
 <table id="tablaPagoProvDetalles_{{idFilaProv}}" class="table table-striped table-bordered table-hover dataTable no-footer">
	 <thead>
		 <tr role="row" class="heading">
			 <th width="10%">Porcentaje</th>
			 <th width="20%">Monto Parcial</th>
			 <th width="20%">Tipo Pago</th>
			 <th width="20%">Fecha Vencimiento</th>
			 <th width="20%">Fecha Pago Programada</th>
			 <th width="10%">Acciones</th>
		 </tr>
	 </thead>
	 <tbody>
		 <tr role="row" class="filter" id="fila_pago_{{idFilaProv}}_0">
			 <td>
				<input style="display:none" id="txtIdProveedor_pago_{{idFilaProv}}_0" type="text" class="form-control form-filter input-sm" name="pago_filaProveedor" placeholder="idProveedor" value="{{idFilaProv}}"> 
				<input onkeyup="calcularMontoParcialxPorcentaje_Pago({{idFilaProv}},0);" id="txtPorcentaje_pago_{{idFilaProv}}_0" type="text" class="form-control form-filter input-sm pago_porcentaje_{{idFilaProv}}" name="pago_porcentaje" placeholder="%">
			 </td>
			 <td>
				 <input id="txtPagoParcial_pago_{{idFilaProv}}_0" type="text" class="form-control form-filter input-sm" name="pago_montoParcial" placeholder="USD $/.">
			 </td>
			 <td>
				<select id="sltTipoPago_pago_{{idFilaProv}}_0" class="form-control" name="pago_tipoPago">
					<option value="efectivo">Efectivo</option>
					<option value="deposito">Deposito</option>
					<option value="cheque">Cheque</option>
					<option value="transferencia">Transferencia</option>
				</select>
			</td>
			 <td>
				 <div class="input-group date date-picker margin-bottom-5" data-date-format="dd/mm/yyyy">
					 <input id="txtFechaVencimientoProv_pago_{{idFilaProv}}_0" type="text" class="form-control form-filter input-sm" name="pago_fechaVencimiento" placeholder="Vencimiento">
					 <span class="input-group-btn">
					 <button class="btn btn-sm default" type="button"><i class="fa fa-calendar"></i></button>
					 </span>
				 </div>
			 </td>
			 <td>
				 <div class="input-group date date-picker margin-bottom-5" data-date-format="dd/mm/yyyy">
					 <input id="txtFechaProgramadaProv_pago_{{idFilaProv}}_0" type="text" class="form-control form-filter input-sm" name="pago_fechaProgramada" placeholder="Programada">
					 <span class="input-group-btn">
					 <button class="btn btn-sm default" type="button"><i class="fa fa-calendar"></i></button>
					 </span>
				 </div>
				 <input style="display:none" id="txtEstado_pago_{{idFilaProv}}_0" class="form-control pago_estado_{{idFilaProv}}" placeholder="Estado" name="pago_estado" value="enabled"/>
			 </td>
													
			 <td>
				 <div class="margin-bottom-5">
					 <span onclick="agregarNuevaFilaPagos_Prov({{idFilaProv}});" class="btn btn-sm green filter-submit margin-bottom"><i class="fa fa-plus"></i></span>
					 <!-- <span class="btn btn-sm red filter-cancel"><i class="fa fa-times"></i></span> -->
				 </div>
			 </td>
													
		 </tr>
	 </tbody>
											
	 <tbody id="vistaTablaPagos_Filas_{{idFilaProv}}">
											
	 </tbody>
										
 </table>


</script>

</body>
</html>