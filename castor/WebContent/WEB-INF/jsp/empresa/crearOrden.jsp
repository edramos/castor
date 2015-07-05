<!DOCTYPE html>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
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
[disabled] {
  pointer-events: none;
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

<form:form id="frmCrearOrden" class="form-horizontal" action="crearOrden" method="post" commandName="ordenBean">
<div class="row">
	<div class="col-md-12">
		<div class="portlet box blue-hoki">
			<div class="portlet-title">
				<div class="caption"><i class="icon-basket"></i>Crear Orden de Trabajo</div>
				<div class="actions">							
					<a class="btn btn-icon-only btn-default btn-sm fullscreen" href="#" data-original-title="" title=""></a>
				</div>
			</div>
			
			<div class="portlet-body form">
				<div class="form-body">
					<h4 class="form-section">General</h4>
					<div class="row">
						<div class="col-md-12">
							<div class="form-group">
								<div class="col-md-3">
									<input id="txtNombre" class="form-control" placeholder="Nombre Orden" name="nombre"/>
								</div>
								<div class="col-md-3">
									<select id="sltCliente" class="form-control" name="idCliente"></select>	
								</div>
								<div class="col-md-3">
									<select id="sltTipoOrden" class="form-control" name="tipoOrden">
										<option value="OC">Obra Civil</option>
										<option value="TV">Trabajos Varios</option>
									</select>
								</div>
								<div class="col-md-3">
									<select id="sltTipoTrabajo" class="form-control" name="tipoTrabajo">
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
								<div class="col-md-6" style="padding-right: 5px">
									<input id="txtLat" class="form-control" placeholder="Latitud" name="lat"/>
								</div>
								<div class="col-md-6" style="padding-left: 5px">
									<input id="txtLon" class="form-control" placeholder="Longitud" name="lon"/>
								</div>
							</div>
						</div>
						<div class="col-md-3">
							<div class="form-group">
								<div class="col-md-6" style="padding-right: 5px">
									<input id="txtCiudad" class="form-control" placeholder="Ciudad" name="ciudad"/>
								</div>
								<div class="col-md-6" style="padding-left: 5px">
									<select id="sltDepartamento" class="form-control" name="departamento">
										<option value="Amazonas">Amazonas</option><option value="Ancash">Ancash</option><option value="Apurimac">Apurimac</option>
										<option value="Arequipa">Arequipa</option><option value="Ayacucho">Ayacucho</option><option value="Cajamarca">Cajamarca</option>
										<option value="Cuzco">Cuzco</option><option value="Huancavelica">Huancavelica</option><option value="Huanuco">Huanuco</option>
										<option value="Ica">Ica</option><option value="Junin">Junin</option><option value="La Libertad">La Libertad</option>
										<option value="Lambayeque">Lambayeque</option><option value="Lima">Lima</option><option value="Loreto">Loreto</option>
										<option value="Madre de Dios">Madre de Dios</option><option value="Moquegua">Moquegua</option><option value="Pasco">Pasco</option>
										<option value="Piura">Piura</option><option value="Puno">Puno</option><option value="San Martin">San Martin</option>
										<option value="Tacna">Tacna</option><option value="Tumbes">Tumbes</option><option value="Ucayali">Ucayali</option>
									</select>
								</div>
							</div>
						</div>							
						<div class="col-md-3">
							<div class="input-group date date-picker margin-bottom-5" data-date-format="dd/mm/yyyy">
								<input id="txtFechaInicio" type="text" class="form-control form-filter" placeholder="Fecha Inicio" name="fechaInicio"/>											
								<span class="input-group-btn">
								<button class="btn default" type="button"><i class="fa fa-calendar"></i></button>
								</span>
							</div>
						</div>
						<div class="col-md-3">
							<div class="input-group date date-picker margin-bottom-5" data-date-format="dd/mm/yyyy">
								<input id="txtFechaEntrega" type="text" class="form-control form-filter" placeholder="Fecha Fin" name="fechaEntrega"/>											
								<span class="input-group-btn">
								<button class="btn default" type="button"><i class="fa fa-calendar"></i></button>
								</span>
							</div>	
						</div>	
					</div>
					
					<div class="row">
						<div class="col-md-12">
							<div class="form-group">
								<div class="col-md-3">
									<select id="sltSupervisor" class="form-control" name="supervisor"></select>
								</div>
							</div>
						</div>
					</div>
						
						
					<!-- INFORMACION FINANCIERA -->
					
					<!-- <h4 class="form-section">Informacion Financiera</h4>
					<div class="row">
						<div class="col-md-12">
							<div class="form-group">
								<div class="col-md-2">
									<select id="sltClienteMoneda" class="form-control" name="moneda">
										<option value="dolar americano">USD ($/.)</option>
										<option value="nuevo sol">PEN (S/.)</option>
									</select>	
								</div>
								<div class="col-md-2 tooltips" data-original-title="Monto Proveedor">
									<input id="txtSubTotalOrden" data-inputmask="'alias': 'numeric', 'groupSeparator': ',', 'autoGroup': true, 'digits': 2, 'digitsOptional': false, 'prefix': '$ ','placeholder': '0'" class="form-control" disabled="disabled" placeholder="Monto Proveed."/>
								</div>
								<div class="col-md-2 tooltips" data-original-title="IGV Proveedor">
									<input id="txtIgvOrden" data-inputmask="'alias': 'numeric', 'groupSeparator': ',', 'autoGroup': true, 'digits': 2, 'digitsOptional': false, 'prefix': '$ ','placeholder': '0'" class="form-control" disabled="disabled" placeholder="IGV Proveed."/>
								</div>
								<div class="col-md-2 tooltips" data-original-title="Total Proveedor">
									<input id="txtConIgvOrden" data-inputmask="'alias': 'numeric', 'groupSeparator': ',', 'autoGroup': true, 'digits': 2, 'digitsOptional': false, 'prefix': '$ ','placeholder': '0'" class="form-control" disabled="disabled" placeholder="Total Proveed."/>
								</div>
								<div class="col-md-2">
									<input id="txtOferta" data-inputmask="'alias': 'numeric', 'groupSeparator': ',', 'autoGroup': true, 'digits': 2, 'digitsOptional': false, 'prefix': '$ ','placeholder': '0'" class="form-control tooltips" data-original-title="Oferta" placeholder="Oferta" name="oferta"/>
								</div>
								<div class="col-md-2 tooltips" data-original-title="IGV Oferta">
									<input id="txtOfertaIgv" data-inputmask="'alias': 'numeric', 'groupSeparator': ',', 'autoGroup': true, 'digits': 2, 'digitsOptional': false, 'prefix': '$ ','placeholder': '0'" class="form-control" disabled="disabled" placeholder="IGV Oferta" name="ofertaIgv"/>
								</div>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-md-2 tooltips" data-original-title="Oferta + IGV">
							<input id="txtOfertaMasIgv" data-inputmask="'alias': 'numeric', 'groupSeparator': ',', 'autoGroup': true, 'digits': 2, 'digitsOptional': false, 'prefix': '$ ','placeholder': '0'" class="form-control" disabled="disabled" placeholder="Oferta+IGV" name="total"/>
						</div>
						<div class="col-md-2 tooltips" data-original-title="Detraccion">
							<input id="txtDetraccionOferta" data-inputmask="'alias': 'numeric', 'groupSeparator': ',', 'autoGroup': true, 'digits': 2, 'digitsOptional': false, 'prefix': '$ ','placeholder': '0'" class="form-control" disabled="disabled" placeholder="Detraccion" name="detraccion"/>
						</div>
						<div class="col-md-2 tooltips" data-original-title="Oferta - Detra.">
							<input id="txtDisponible" data-inputmask="'alias': 'numeric', 'groupSeparator': ',', 'autoGroup': true, 'digits': 2, 'digitsOptional': false, 'prefix': '$ ','placeholder': '0'" class="form-control" disabled="disabled" placeholder="Oferta - Detra."/>
						</div>
						<div class="col-md-2 tooltips" data-original-title="Ganancia Disp.">
							<input id="txtGananciaDisponible" data-inputmask="'alias': 'numeric', 'groupSeparator': ',', 'autoGroup': true, 'prefix': '$ '" class="form-control" disabled="disabled" placeholder="Ganancia Disp." name="gananciaDisponible"/>
						</div>
						<div class="col-md-2 tooltips" data-original-title="Eficiencia">
							<input id="txtEficiencia" class="form-control" style="text-align:right;" disabled="disabled" placeholder="Eficiencia %" name="eficiencia"/>
						</div>
						<div class="col-md-2 tooltips" data-original-title="Utilidad Bruta">
							<input id="txtUtilidadBruta" data-inputmask="'alias': 'numeric', 'groupSeparator': ',', 'autoGroup': true, 'digits': 2, 'digitsOptional': false, 'prefix': '$ '" class="form-control" disabled="disabled" placeholder="Utilidad Bruta" name="utilidadBruta"/>
						</div>
					</div>	 -->
						
					<!-- COBRO CLIENTE -->
					
					<!-- <h4 class="form-section">Cobro Cliente</h4>	
					<div class="row">
						<div class="col-md-12">
							<div class="table-container">
								<div class="table-scrollable">
									<table class="table table-striped table-bordered table-hover dataTable no-footer">
									<thead>
										<tr role="row" class="heading">
											<th width="8%">Porcentaje</th>
											<th width="15%">Monto</th>
											<th width="15%">Tipo de Pago</th>
											<th width="20%">Estado Obra</th>
											<th width="7%">%</th>
											<th width="20%">Fecha Vencimiento</th>
											<th width="10%">Acciones</th>
										</tr>
										<tr role="row" class="filter" id="fila_cobro_0_0">
											<td>
												<input onkeyup="calcularMontoParcialxPorcentaje_Pago(0,0,'cobro');" id="txtPorcentaje_cobro_0_0" type="text" class="form-control form-filter input-sm cobro_porcentaje_0" name="cobro_porcentaje" placeholder="%" value="30">
											</td>
											<td>
												<input id="txtCobroParcial_cobro_0_0" type="text" class="form-control form-filter input-sm" name="cobro_montoParcial" placeholder="USD $/.">
											</td>
											<td>
												<select id="sltTipoCobro_cobro_0_0" class="form-control" name="cobro_tipoPago">
													<option value="Efectivo">Efectivo</option>
													<option value="Deposito">Deposito</option>
													<option value="Cheque">Cheque</option>
													<option value="Transferencia">Transferencia</option>
												</select>
											</td>
											<td>
												<select id="sltEstadoCobro_cobro_0_0" class="form-control" name="cobro_estadoCobro">
													<option value="Sin inicio">Sin inicio</option>
													<option value="Por iniciar">Por iniciar</option>
													<option value="Proceso">Proceso</option>
													<option value="Terminado">Terminado</option>
													<option value="Aceptado">Aceptado</option>
												</select>
											</td>
											<td>
												<input id="txtPorcentajeAvance_cobro_0_0" type="text" class="form-control form-filter input-sm" name="cobro_porcentajeAvance" placeholder="%">
											</td>
											<td>
												<div class="input-group date date-picker margin-bottom-5" data-date-format="dd/mm/yyyy">
													<input id="txtFechaVencimientoProv_cobro_0_0" type="text" class="form-control form-filter input-sm" name="cobro_fechaVencimiento" placeholder="Vencimiento">
													<span class="input-group-btn">
													<button class="btn btn-sm default" type="button"><i class="fa fa-calendar"></i></button>
													</span>
												</div>
												<input style="display:none" id="txtEstado_cobro_0_0" class="form-control cobro_estado_0" placeholder="Estado" name="cobro_estado" value="enabled"/>
											</td>
											<td>
												<div class="margin-bottom-5">
													<span onclick="agregarNuevaFilaPagos_Prov(0, 'cobro');" class="btn btn-sm green filter-submit margin-bottom"><i class="fa fa-plus"></i></span>
												</div>
											</td>
										</tr>
									</thead>						
									
									<tbody id="vistaTablaCobros_Filas_0"></tbody>
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
									
									<!-- Este DIV se va a borrar pero no olvidar que el total lo jalan en Calculos financieros -->
									<tbody style="display: none;">
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
												<th width="8%">Porcentaje</th>
												<th width="15%">Monto</th>
												<th width="15%">Tipo de Pago</th>
												<th width="20%">Estado Obra</th>
												<th width="7%">%</th>
												<th width="20%">Fecha Vencimiento</th>
												<th width="10%">Acciones</th>
											</tr>
										</thead>
										<tbody>
											<tr role="row" class="filter" id="fila_pago_0_0">
												<td>
													<input style="display:none" id="txtIdProveedor_pago_0_0" type="text" class="form-control form-filter input-sm" name="pago_filaProveedor" placeholder="idProveedor" value="0">
													<input onkeyup="calcularMontoParcialxPorcentaje_Pago(0,0,'pago');" id="txtPorcentaje_pago_0_0" type="text" class="form-control form-filter input-sm pago_porcentaje_0" name="pago_porcentaje" placeholder="%" value="40">
												</td>
												<td>
													<input id="txtPagoParcial_pago_0_0" type="text" class="form-control form-filter input-sm" name="pago_montoParcial" placeholder="USD $/.">
												</td>
												<td>
													<select id="sltTipoPago_pago_0_0" class="form-control" name="pago_tipoPago">
														<option value="Efectivo">Efectivo</option>
														<option value="Deposito">Deposito</option>
														<option value="Cheque">Cheque</option>
														<option value="Transferencia">Transferencia</option>
													</select>
												</td>
												<td>
													<select id="sltEstadoCobro_pago_0_0" class="form-control" name="pago_estadoCobro">
														<option value="Sin inicio">Sin inicio</option>
														<option value="Por iniciar">Por iniciar</option>
														<option value="Proceso">Proceso</option>
														<option value="Terminado">Terminado</option>
														<option value="Aceptado">Aceptado</option>
													</select>
												</td>
												<td>
													<input id="txtPorcentajeAvance_pago_0_0" type="text" class="form-control form-filter input-sm" name="pago_porcentajeAvance" placeholder="%">
													<input style="display:none" id="txtEstado_pago_0_0" class="form-control pago_estado_0" placeholder="Estado" name="pago_estado" value="enabled"/>
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
													<div class="margin-bottom-5">
														<span onclick="agregarNuevaFilaPagos_Prov(0, 'pago');" class="btn btn-sm green filter-submit margin-bottom"><i class="fa fa-plus"></i></span>
														<!-- <span class="btn btn-sm red filter-cancel"><i class="fa fa-times"></i></span> -->
													</div>
												</td>
											</tr>
										</tbody>
										
										<tbody id="vistaTablaPagos_Filas_0"></tbody>
									
									</table>
									
									<div id="vistaTablaPagos">
									</div>
									
									
								</div>
							</div>
						</div>
					</div>
					
					<a id="btnGrabar" class="btn green btn-sm eventBtn" onclick="grabarProyecto();"><i class="fa fa-check"></i> Grabar</a>
					
					</div>
					
					<input id="hdnCobrosCliente" type="hidden" name="cobroscliente" value=""/>
					<input id="hdnSubcontratos" type="hidden" name="subcontratos" value=""/>
					<input id="hdnPagoProveedores" type="hidden" name="pagoproveedores" value=""/>
				
			</div>
				
		</div>
	</div>
</div>
</form:form>

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
<script src="assets/global/plugins/amcharts/amcharts/amcharts.js" type="text/javascript"></script>
<script src="assets/global/plugins/amcharts/amcharts/serial.js" type="text/javascript"></script>
<!-- END PAGE LEVEL PLUGINS -->
<!-- BEGIN PAGE LEVEL STYLES -->
<script src="assets/global/scripts/metronic.js" type="text/javascript"></script>
<script src="assets/admin/layout4/scripts/layout.js" type="text/javascript"></script>
<script src="assets/admin/layout4/scripts/demo.js" type="text/javascript"></script>
<script src="assets/admin/pages/scripts/form-validation.js"></script>
<!-- <script src="assets/global/scripts/castor/crearOrden.js"></script> -->
<!-- END PAGE LEVEL STYLES -->
<script>
var tipo = '<%=session.getAttribute("tipo").toString()%>';
var codigo = '<%=session.getAttribute("codigo").toString()%>';

jQuery(document).ready(function(){   
	Metronic.init(); // init metronic core components
	Layout.init(); // init current layout
	Demo.init(); // init demo features
   	//FormValidation.init();

	datePickerInit();
	
	//Cargo Selector de Cliente
	listarSelectorClientes('sltCliente');
	listarSelectorProveedores('sltProveedor_0');
	listarSelectorProveedores('sltProveedorSC_0');
	
	listarSelectorSupervisores('sltSupervisor');
	
	$("#txtMontoSC_0").inputmask("decimal",{
		radixPoint: ".", 
        groupSeparator: ",", 
        digits: 2,
        autoGroup: true,
    });
    
	 $(":input").inputmask();
    
	 
    /*POR DEFECTO 3 filas COBRO/PAGO**********************************************/
    agregarNuevaFilaPagos_Prov(0, 'cobro');
    $("#txtPorcentaje_cobro_0_1").val(30);
    agregarNuevaFilaPagos_Prov(0, 'cobro');
    
    $("#sltEstadoCobro_cobro_0_0").val("Por iniciar");
    $("#sltEstadoCobro_cobro_0_1").val("Terminado");
    $("#sltEstadoCobro_cobro_0_2").val("Aceptado");
    
    agregarNuevaFilaPagos_Prov(0, 'pago');
    $("#txtPorcentaje_pago_0_1").val(40);
    agregarNuevaFilaPagos_Prov(0, 'pago');
    
    $("#sltEstadoCobro_pago_0_0").val("Por iniciar");
    $("#sltEstadoCobro_pago_0_1").val("Terminado");
    $("#sltEstadoCobro_pago_0_2").val("Aceptado");
    
    
    $('#txtFechaInicio').on('change', function(){
   		$('#txtFechaVencimientoProv_cobro_0_0').val(this.value);
   		
   		var aFI = this.value.split("/");
  		var date = new Date(aFI[1] + "/" + aFI[0] + "/" + aFI[2]);
  	  	date.setDate(date.getDate() + 7);
  	  	
  	  $('#txtFechaVencimientoProv_pago_0_0').val(("0" + date.getDate()).slice(-2) + "/" + ("0" + (date.getMonth() + 1)).slice(-2) + "/" + date.getFullYear());
    });
    
    $('#txtFechaEntrega').on('change', function(){
		$('#txtFechaVencimientoProv_cobro_0_1').val(this.value);
  		$('#txtTerminoObraSC_0').val(this.value);
  		
  		var aFF = this.value.split("/");
  		var date = new Date(aFF[1] + "/" + aFF[0] + "/" + aFF[2]);
  	  	date.setDate(date.getDate() + 7);
  	  	
  	  	$('#txtFechaVencimientoProv_cobro_0_2').val(("0" + date.getDate()).slice(-2) + "/" + ("0" + (date.getMonth() + 1)).slice(-2) + "/" + date.getFullYear());
  	  	$('#txtFechaVencimientoProv_pago_0_1').val(("0" + date.getDate()).slice(-2) + "/" + ("0" + (date.getMonth() + 1)).slice(-2) + "/" + date.getFullYear());
  	  	
  	  	date.setDate(date.getDate() + 7);
  		$('#txtFechaVencimientoProv_pago_0_2').val(("0" + date.getDate()).slice(-2) + "/" + ("0" + (date.getMonth() + 1)).slice(-2) + "/" + date.getFullYear());
  	  
    });
    formatoMoneda("#txtCobroParcial_cobro_0_0");
    formatoMoneda("#txtCobroParcial_cobro_0_1");
    formatoMoneda("#txtCobroParcial_cobro_0_2");
    
    
    /**********************************************************************************/
    
    
    $("#frmCrearOrden").validate({
		rules: {
			nombre: {required: true},   
			idCliente: {required: true},   
			tipoOrden: {required: true},   
			tipoTrabajo: {required: true},   
			departamento: {required: true},
			fechaEntrega: {required: true}
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
			if($('#txtLat').val()==''){$('#txtLat').val(0.0);}
			if($('#txtLon').val()==''){$('#txtLon').val(0.0);}
			//Los disabled no mandan data al controller
			$('#txtDetraccionOferta').prop('disabled', false);
			$('#txtGananciaDisponible').prop('disabled', false);
			$('#txtUtilidadBruta').prop('disabled', false);
			$('#txtOfertaIgv').prop('disabled', false);
			$('#txtOfertaMasIgv').prop('disabled', false);
			
			//var arrEfi = $('#txtEficiencia').val().split("%");
			//$('#txtEficiencia').val(Number(arrEfi[0]));
			$('#txtEficiencia').prop('disabled', false);
			
			form.submit();
		}
	});
    
    calculosFinancieros();
    
    function formatoMoneda(obj){
    	$(obj).inputmask("decimal",{
    		alias: 'numeric',
    		groupSeparator: ',',
    		autoGroup: true,
    		digits: 2,
    		digitsOptional: false,
    		prefix: '$ ',
    		placeholder: '0'
    	});
    }
});
</script>
<script>
function calculosFinancieros(){
	$('#txtOferta').keyup(function(){
		var tipoTrabajo = $('#sltTipoTrabajo option:selected').text();
		var oferta = formatoMoneda('#txtOferta');
		var ofertaIgv = oferta * 0.18;
		var ofertaMasIgv = oferta + ofertaIgv;
		
		$('#txtOfertaIgv').val(ofertaIgv);
		$('#txtOfertaMasIgv').val(ofertaMasIgv);
		
		if(tipoTrabajo == "Estudio"){
			$('#txtDetraccionOferta').val(ofertaMasIgv * 0.1);
		}else{
			$('#txtDetraccionOferta').val(ofertaMasIgv * 0.04);
		}
		var disponible = ofertaMasIgv - formatoMoneda('#txtDetraccionOferta');
		var totalProveedores = formatoMoneda('#txtConIgvOrden');
		var eficiencia = totalProveedores / ofertaMasIgv;
		var utilBruta = oferta - formatoMoneda('#txtSubTotalOrden');
		
		$('#txtDisponible').val(disponible);
		$('#txtGananciaDisponible').val((disponible - formatoMoneda('#txtConIgvOrden')).toFixed(2));
		$('#txtUtilidadBruta').val(utilBruta.toFixed(2));
		$('#txtEficiencia').val((eficiencia * 100).toFixed(1) + "%");
		
		//Calculo para las 3 filas defecto
		var p00 = $('#txtPorcentaje_cobro_0_0').val();
		var p01 = $('#txtPorcentaje_cobro_0_1').val();
		var p02 = $('#txtPorcentaje_cobro_0_2').val();
		
		$('#txtCobroParcial_cobro_0_0').val(oferta * p00 * 0.01);
		$('#txtCobroParcial_cobro_0_1').val(oferta * p01 * 0.01);
		$('#txtCobroParcial_cobro_0_2').val(oferta * p02 * 0.01);
	});
}
function formatoMoneda(objeto){
	if($(objeto).val() != null){
		return Number($(objeto).val().replace(/[^0-9\.]+/g,""));
	}
}
</script>

<script>
/*GRABAR ORDEN DE TRABAJO*/
function grabarProyecto(){
	if($('#txtEficiencia').val() == ""){
		$('#txtEficiencia').val(0);
	}
	
	//COBROS
	/*var cobros = [];
	
	arreglo_MontoParcialC = document.getElementsByName('cobro_montoParcial');
	arreglo_TipoPagoC = document.getElementsByName('cobro_tipoPago');
	arreglo_FechaVenC = document.getElementsByName('cobro_fechaVencimiento');
	arreglo_PorcentajeAvanceC = document.getElementsByName('cobro_porcentajeAvance');
	arreglo_EstadoCobroC = document.getElementsByName('cobro_estadoCobro');
	arreglo_EstadoC = document.getElementsByName('cobro_estado');
	
	for(var x = 0; x <= idFila_Cobros; x++){
		var montoParcial_TempC = Number(arreglo_MontoParcialC[x].value.replace(/[^0-9\.]+/g,""));
		
		cobros.push(montoParcial_TempC);
		cobros.push(arreglo_TipoPagoC[x].value);
		cobros.push(arreglo_EstadoCobroC[x].value);
		if(arreglo_PorcentajeAvanceC[x].value != ''){
			cobros.push(arreglo_PorcentajeAvanceC[x].value);
		}else{
			cobros.push(0);
		}
		cobros.push(arreglo_FechaVenC[x].value);
  	}*/
	
	
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
	arreglo_CondicionPago = document.getElementsByName('pago_estadoCobro');
	arreglo_PorcentajeAvancePago = document.getElementsByName('pago_porcentajeAvance');
	
	arreglo_FechaVen = document.getElementsByName('pago_fechaVencimiento');
	//arreglo_FechaProg = document.getElementsByName('pago_fechaProgramada');
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
			pagoProveedores.push(arreglo_CondicionPago[x].value);
			if(arreglo_PorcentajeAvancePago[x].value != ''){
				pagoProveedores.push(arreglo_PorcentajeAvancePago[x].value);
			}else{
				pagoProveedores.push(0);
			}
			pagoProveedores.push(arreglo_FechaVen[x].value);
			//pagoProveedores.push(arreglo_FechaProg[x].value);
		}		
  	}
	
	//$('#hdnCobrosCliente').val(cobros);
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

function listarSelectorSupervisores(nombreSelector){
	var html = '';
    $.ajax({
 		url: 'ajaxListarSupervisor',
 		type: 'post',
 		dataType: 'json',
 		success: function(supervisores){
 			html = '<option value="0">Escoger Supervisor</option>';
 			
 			$.each(supervisores, function(i, supervisor){
	 			var source = $("#templateSelectorSupervisores").html();
	 			var template = Handlebars.compile(source);
	 			html += template(supervisor);
	 			
 			});		
 			$("#" + nombreSelector).html(html);	        
 		}
 	});
}
function listarSelectorClientes(nombreSelector){
	var html = '';
    $.ajax({
 		url: 'ajaxListarClientes',
 		type: 'post',
 		dataType: 'json',
 		data: '',
 		success: function(clientes){
 			if(tipo == "cliente" && codigo == "CT"){
 				html = '<option value="">Escoger Operador</option>';
 			}else{
 				html = '<option value="">Escoger Cliente</option>';
 			}
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

/*ALGORITMO PARA AGREGAR FILAS DE COBROS Y PAGOS, puede mejorarse a uno solo*/
var idFila_Pagos = 0;
var idFila_Cobros = 0;

function agregarNuevaFilaPagos_Prov(idFilaProv, tipo){
	//alert(idFila_Cobros);
	//alert('tipo: ' + tipo);
	
	if(tipo == "pago"){
		var totalPorcentajeTemp = sumarPorcentajesTablaPagos_Prov(idFilaProv, tipo);
		
		if(totalPorcentajeTemp < 100){
			idFila_Pagos++;
			var entidadFila2 = new Object();
			entidadFila2.idFilaPago = idFila_Pagos;
			entidadFila2.idFilaProv = idFilaProv;
			var html = '';
			var source = $("#templateProveedoresPago_fila").html();
			var template = Handlebars.compile(source);
			html += template(entidadFila2);
			$("#vistaTablaPagos_Filas_" + idFilaProv).append(html);
			//listarSelectorProveedores('sltProveedor_'+idFila_Pagos);
			
			datePickerInit();
			
			//Calculamos el nuevo porcentaje
			$('#txtPorcentaje_pago_'+idFilaProv+'_'+idFila_Pagos).val(100-totalPorcentajeTemp);
			calcularMontoParcialxPorcentaje_Pago(idFilaProv, idFila_Pagos, tipo);
		}
		else if(totalPorcentajeTemp > 100){
			alert("Esta sobrepasando el 100% en los Pagos");
		}
	}else if(tipo == "cobro"){
		var totalPorcentajeCobroTemp = sumarPorcentajesTablaPagos_Prov(idFilaProv, tipo);
		//alert('totalPorcentajeCobroTemp: ' + totalPorcentajeCobroTemp);
		if(totalPorcentajeCobroTemp < 100){
			idFila_Cobros++;
			var entidadFila2 = new Object();
			entidadFila2.idFilaCobro = idFila_Cobros;
			entidadFila2.idFilaProv = idFilaProv;
			var html = '';
			var source = $("#templateProveedoresCobro_fila").html();
			var template = Handlebars.compile(source);
			html += template(entidadFila2);
			$("#vistaTablaCobros_Filas_" + idFilaProv).append(html);
			
			datePickerInit();
			
			$('#txtPorcentaje_cobro_'+ idFilaProv + '_' + idFila_Cobros).val(100 - totalPorcentajeCobroTemp);
			calcularMontoParcialxPorcentaje_Pago(idFilaProv, idFila_Cobros, tipo);
		}else if(totalPorcentajeCobroTemp > 100){
			alert("Esta sobrepasando el 100% en los Cobros");
		}
	}
} 

function sumarPorcentajesTablaPagos_Prov(idFilaProv, tipo){
	if(tipo == 'pago'){
		//Buscamos cuanto es el resto del porcentaje que nos falta
		var totalPorcentaje = 0; 
		var array_porcentaje_temp = new Array();
		var array_estado_temp = new Array();
		$(".pago_porcentaje_" + idFilaProv).each(
			function(){
				array_porcentaje_temp.push($(this).val());
			}
		)
		$(".pago_estado_" + idFilaProv).each(
			function(){
				array_estado_temp.push($(this).val());
			}
		)
		
		for(var i = 0; i < array_porcentaje_temp.length; i++){
			if(array_estado_temp[i]=='enabled'){
				totalPorcentaje = totalPorcentaje + parseInt(array_porcentaje_temp[i]);	
			}    	
		} 
		//alert(totalPorcentaje);
		return totalPorcentaje;
	}else{
		var totalPorcentajePago = 0; 
		var array_porcentaje_temp = new Array();
		var array_estado_temp = new Array();
		
		$(".cobro_porcentaje_" + idFilaProv).each(
			function(){array_porcentaje_temp.push($(this).val());}
		)
		$(".cobro_estado_" + idFilaProv).each(
			function(){array_estado_temp.push($(this).val());}
		)
		
		for(var i = 0; i < array_porcentaje_temp.length; i++){
			if(array_estado_temp[i]=='enabled'){
				totalPorcentajePago = totalPorcentajePago + parseInt(array_porcentaje_temp[i]);	
			}    	
		}
		return totalPorcentajePago;
	}
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
	
	
	//********************CALCULO TOTAL PROVEEDOR y SUS IGVS, MONTOS****************
	//var subTotalOrden = formatoMoneda('#txtSubTotalOrden');
	//var montoIgvSubTotal = (subTotalOrden * igv).toFixed(2);
	//var subTotalConIgv = parseFloat(subTotalOrden) + parseFloat(montoIgvSubTotal);
	
	var igvProveedor = (subtotal * 0.18).toFixed(2);
	var totalProveedor = parseFloat(subtotal) + parseFloat(igvProveedor);
	
	$('#txtIgvOrden').val(igvProveedor);
	$('#txtSubTotalOrden').val(subtotal);
	$('#txtConIgvOrden').val(totalProveedor);
	//*******************************************************************************
	
	
	/* var eficiencia = 0;
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
	} */
}

function cambiarSelectorProveedorPago(idTempFila){
	//$('#sltProveedor_'+idTempFila).val($('#sltProveedorSC_'+idTempFila).val());
	$('#spnProveedor_'+idTempFila).text($('#sltProveedorSC_'+idTempFila+' option:selected').text());
}

/**********AQUI SE CALCULA LOS MONTOS DE PAGOS*************************************************************************************************************/
function cambiarPagoProveedor(idTempFila){
	//$('#montoTotal_'+idTempFila).val($('#txtMontoSC_'+idTempFila).val());
	//$('#montoTotal_'+idTempFila).val(Number($('#txtMontoSC_'+idTempFila).val().replace(/[^0-9\.]+/g,"")));
	$('#spnMontoTotal_'+idTempFila).text($('#txtMontoSC_'+idTempFila).val());
	calcularMontoParcialxPorcentaje_Pago(idTempFila, 0, 'pago');
	if(idTempFila == 0){
		//$('#txtPorcentaje_pago_0_0').val('100');
		calcularMontoParcialxPorcentaje_Pago(0,0, 'pago');
		calcularMontoParcialxPorcentaje_Pago(0,1, 'pago');
		calcularMontoParcialxPorcentaje_Pago(0,2, 'pago');
	}
}

//Metodo para calcular el Monto a partir del porcentaje
function calcularMontoParcialxPorcentaje_Pago(filaProv, filaPago, tipo){
	//var monto = $('#montoTotal_'+idTempFila).val();
	if(tipo == 'pago'){
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
	
	
		var totalPorcentajeTemp = sumarPorcentajesTablaPagos_Prov(filaProv);
		
		if(totalPorcentajeTemp > 100){
			alert("Esta sobreparando el 100% en los Pagos");
			$('#btnGrabar').attr('disabled', 'true');		
		}else{
			$('#btnGrabar').removeAttr("disabled");
		}
	}else{
		//var oferta = Number($('#txtOferta').val().replace(/[^0-9\.]+/g,""));
		var oferta = 0;
		var porcentaje = $('#txtPorcentaje_cobro_' + filaProv + '_' + filaPago).val();
		var montoParcial = (oferta * (porcentaje / 100));
		
		//alert('oferta: ' + oferta + ', montoParcial: ' + montoParcial);
		
		$('#txtCobroParcial_cobro_' + filaProv + '_' + filaPago).inputmask("decimal",{
			alias: 'numeric',
			groupSeparator: ',',
			autoGroup: true,
			digits: 2,
			digitsOptional: false,
			prefix: '$ ',
			placeholder: '0'
		});
		$('#txtCobroParcial_cobro_' + filaProv + '_' + filaPago).val(montoParcial.toFixed(2));
		
		var totalPorcentajeCobroTemp = sumarPorcentajesTablaPagos_Prov(filaProv);
		
		if(totalPorcentajeCobroTemp > 100){
			alert("Esta sobrepasando el 100%");
			$('#btnGrabar').attr('disabled', 'true');		
		}else{
			$('#btnGrabar').removeAttr("disabled");
		}
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
<!-- Quizas para estos Selects es mas facil poner append arriba y borrarlos aqui -->
<script id="templateSelectorSupervisores" type="text/x-handlebars-template">
	<option value="{{idUsuario}}">{{primerNombre}} {{apellidoPaterno}}</option>
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
<script id="templateProveedoresCobro_fila" type="text/x-handlebars-template">
<tr role="row" class="filter" id="fila_pago_{{idFilaCobro}}">
	<td>
		<input id="txtPorcentaje_cobro_0_{{idFilaCobro}}" onkeyup="calcularMontoParcialxPorcentaje_Pago(0,{{idFilaCobro}},'cobro');" type="text" class="form-control form-filter input-sm cobro_porcentaje_0" name="cobro_porcentaje" placeholder="%">
	</td>
	<td>
		<input id="txtCobroParcial_cobro_0_{{idFilaCobro}}" type="text" class="form-control form-filter input-sm" name="cobro_montoParcial" placeholder="USD $/.">
	</td>
	<td>
		<select id="sltTipoCobro_cobro_0_{{idFilaCobro}}" class="form-control" name="cobro_tipoPago">
			<option value="Efectivo">Efectivo</option>
			<option value="Deposito">Deposito</option>
			<option value="Cheque">Cheque</option>
			<option value="Transferencia">Transferencia</option>
		</select>
	</td>
	<td>
		<select id="sltEstadoCobro_cobro_0_{{idFilaCobro}}" class="form-control" name="cobro_estadoCobro">
			<option value="Sin inicio">Sin inicio</option>
			<option value="Por iniciar">Por iniciar</option>
			<option value="Proceso">Proceso</option>
			<option value="Terminado">Terminado</option>
			<option value="Aceptado">Aceptado</option>
		</select>
	</td>
	<td>
		<input id="txtPorcentajeAvance_cobro_0_{{idFilaCobro}}" type="text" class="form-control form-filter input-sm" name="cobro_porcentajeAvance" placeholder="%">
	</td>
	<td>
		<div class="input-group date date-picker margin-bottom-5" data-date-format="dd/mm/yyyy">
			<input id="txtFechaVencimientoProv_cobro_0_{{idFilaCobro}}" type="text" class="form-control form-filter input-sm" name="cobro_fechaVencimiento" placeholder="Vencimiento">
			<span class="input-group-btn">
				<button class="btn btn-sm default" type="button"><i class="fa fa-calendar"></i></button>
			</span>
		</div>
		<input style="display:none" id="txtEstado_cobro_0_{{idFilaCobro}}" class="form-control cobro_estado_0" placeholder="Estado" name="cobro_estado" value="enabled"/>
	</td>
	<td>
		<div class="margin-bottom-5">
			<span onclick="removerFilaPagos_Prov({{idFilaProv}},{{idFilaCobro}});" class="btn btn-sm red filter-cancel"><i class="fa fa-times"></i></span>
		</div>
	</td>
</tr>
</script>
<script id="templateProveedoresPago_fila" type="text/x-handlebars-template">
<tr role="row" class="filter" id="fila_pago_{{idFilaProv}}_{{idFilaPago}}">
 <td>
	 <input style="display:none" id="txtIdProveedor_pago_{{idFilaProv}}_{{idFilaPago}}" type="text" class="form-control form-filter input-sm" name="pago_filaProveedor" placeholder="idProveedor" value="{{idFilaProv}}">
	 <input onkeyup="calcularMontoParcialxPorcentaje_Pago({{idFilaProv}},{{idFilaPago}},'pago')" id="txtPorcentaje_pago_{{idFilaProv}}_{{idFilaPago}}" type="text" class="form-control form-filter input-sm pago_porcentaje_{{idFilaProv}}" name="pago_porcentaje" placeholder="%">
 </td>
 <td>
	 <input id="txtPagoParcial_pago_{{idFilaProv}}_{{idFilaPago}}" type="text" class="form-control form-filter input-sm" name="pago_montoParcial" placeholder="USD $/.">
 </td>
<td>
	<select id="sltTipoPago_pago_{{idFilaProv}}_{{idFilaPago}}" class="form-control" name="pago_tipoPago">
		<option value="Efectivo">Efectivo</option>
		<option value="Deposito">Deposito</option>
		<option value="Cheque">Cheque</option>
		<option value="Transferencia">Transferencia</option>
	</select>
</td>
<td>
	<select id="sltEstadoCobro_pago_{{idFilaProv}}_{{idFilaPago}}" class="form-control" name="pago_estadoCobro">
		<option value="Sin inicio">Sin inicio</option>
		<option value="Por iniciar">Por iniciar</option>
		<option value="Proceso">Proceso</option>
		<option value="Terminado">Terminado</option>
		<option value="Aceptado">Aceptado</option>
	</select>
</td>
<td>
	<input id="txtPorcentajeAvance_pago_{{idFilaProv}}_{{idFilaPago}}" type="text" class="form-control form-filter input-sm" name="pago_porcentajeAvance" placeholder="%">
	<input style="display:none" id="txtEstado_pago_{{idFilaProv}}_{{idFilaPago}}" class="form-control pago_estado_{{idFilaProv}}" placeholder="Estado" name="pago_estado" value="enabled"/>
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
	<th width="8%">Porcentaje</th>
	<th width="15%">Monto</th>
	<th width="15%">Tipo de Pago</th>
	<th width="20%">Estado Obra</th>
	<th width="7%">%</th>
	<th width="20%">Fecha Vencimiento</th>
	<th width="10%">Acciones</th>
</tr>
</thead>
<tbody>
	<tr role="row" class="filter" id="fila_pago_{{idFilaProv}}_0">
		<td>
			<input style="display:none" id="txtIdProveedor_pago_{{idFilaProv}}_0" type="text" class="form-control form-filter input-sm" name="pago_filaProveedor" placeholder="idProveedor" value="{{idFilaProv}}"> 
			<input onkeyup="calcularMontoParcialxPorcentaje_Pago({{idFilaProv}},0, 'pago');" id="txtPorcentaje_pago_{{idFilaProv}}_0" type="text" class="form-control form-filter input-sm pago_porcentaje_{{idFilaProv}}" name="pago_porcentaje" placeholder="%">
		</td>
		<td>
			<input id="txtPagoParcial_pago_{{idFilaProv}}_0" type="text" class="form-control form-filter input-sm" name="pago_montoParcial" placeholder="USD $/.">
		</td>
		<td>
			<select id="sltTipoPago_pago_{{idFilaProv}}_0" class="form-control" name="pago_tipoPago">
				<option value="Efectivo">Efectivo</option>
				<option value="Deposito">Deposito</option>
				<option value="Cheque">Cheque</option>
				<option value="Transferencia">Transferencia</option>
			</select>
		</td>
		<td>
			<select id="sltEstadoCobro_pago_{{idFilaProv}}_0" class="form-control" name="pago_estadoCobro">
				<option value="Sin inicio">Sin inicio</option>
				<option value="Por iniciar">Por iniciar</option>
				<option value="Proceso">Proceso</option>
				<option value="Terminado">Terminado</option>
				<option value="Aceptado">Aceptado</option>
			</select>
		</td>
		<td>
			<input id="txtPorcentajeAvance_pago_{{idFilaProv}}_0" type="text" class="form-control form-filter input-sm" name="pago_porcentajeAvance" placeholder="%">
			<input style="display:none" id="txtEstado_pago_{{idFilaProv}}_0" class="form-control pago_estado_{{idFilaProv}}" placeholder="Estado" name="pago_estado" value="enabled"/>
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
			<div class="margin-bottom-5">
				<span onclick="agregarNuevaFilaPagos_Prov({{idFilaProv}}, 'pago');" class="btn btn-sm green filter-submit margin-bottom"><i class="fa fa-plus"></i></span>
				<!-- <span class="btn btn-sm red filter-cancel"><i class="fa fa-times"></i></span> -->
			</div>
		</td>												
	</tr>
	</tbody>
											
	<tbody id="vistaTablaPagos_Filas_{{idFilaProv}}"></tbody>
										
 </table>
</script>

</body>
</html>