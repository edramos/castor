<!DOCTYPE html>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Castor | Caja Banco</title>
<jsp:include page="../comps/headMandatory.jsp"/>
<!-- BEGIN PAGE LEVEL STYLES -->
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
				<div class="caption"><i class="icon-share"></i>Crear Caja Banco</div>
				<div class="actions">
					<a id="btnCrearEmpleado" class="btn green-meadow btn-sm eventBtn"><i class="fa fa-check"></i> Grabar </a>
					<a id="btnCancelarEmpleado" class="btn red-sunglo btn-sm eventBtn"><i class="fa fa-close"></i> Cancelar </a>							
					<a class="btn btn-icon-only btn-default btn-sm fullscreen" href="#" data-original-title="" title=""></a>
				</div>
			</div>
			
			<div class="portlet-body form">
			<form:form id="frmCrearCajaBanco" class="form-horizontal" action="crearOrden" method="post" commandName="ordenBean">
				
				<div class="form-body">
					
					<div class="row">
						<div class="col-md-3">
							<div id="txtFechaOperacion" class="input-group date date-picker" data-date-format="dd/mm/yyyy">
								<input type="text" class="form-control form-filter valid" placeholder="Fecha Operacion" name="fechaEntrega" aria-required="true" aria-invalid="false">											
								<span class="input-group-btn"><button class="btn default" type="button"><i class="fa fa-calendar"></i></button></span>
							</div>
						</div>
						<div class="col-md-3">
							<div class="form-group">
								<div class="col-md-12">
									<input id="txtNombre" class="form-control" placeholder="Monto $/." name="nombre"/>
								</div>
							</div>
						</div>
						<div class="col-md-3">
							<div class="form-group">
								<div class="col-md-12">
									<select id="sltTipoTransaccion" class="form-control" name="tipoTrabajo">
										<option value="Ingreso">Ingreso</option>
										<option value="Egreso">Egreso</option>
									</select>
								</div>
							</div>
						</div>
						<div class="col-md-3">
							<div class="form-group">
								<div class="col-md-12">
									<select id="sltTransaccion" class="form-control" name="tipoTrabajo">
										<option value="Cobranza Venta/Servicio">Cobranza Venta/Servicio</option>
										<option value="Otra cobranza">Otra cobranza</option>
										<option value="Transferencia cuenta">Transferencia cuenta</option>
										<option value="Interese ganado">Interes ganado</option>
									</select>
								</div>
							</div>
						</div>
					</div>
						
					<div id="divSecondRow" class="row">
						<div class="col-md-3 dynamic">
							<div class="form-group">
								<div class="col-md-12">
									<input id="txtNombreCliente" class="form-control" placeholder="Cliente" name="nombre"/>
								</div>
							</div>
						</div>
						<div class="col-md-3 dynamic">
							<div class="form-group">
								<div class="col-md-12">
									<input id="txtFactura" class="form-control" placeholder="Factura" name="nombre"/>
								</div>
							</div>
						</div>
						<div class="col-md-3 dynamic">
							<div class="form-group">
								<div class="col-md-12">
									<input id="txtOrdenTrabajo" class="form-control" placeholder="Orden Trabajo" name="nombre"/>
								</div>
							</div>
						</div>
					</div>
						
					<div class="row">
						<div class="col-md-12">
							<div class="form-group">
								<div class="col-md-12">
									<input id="txtOrdenTrabajo" class="form-control" placeholder="Comentario..." name="nombre"/>
								</div>
							</div>
						</div>
					</div>	
						
					<div class="row">
							<div class="col-md-3">
							<a id="btnGrabar" class="btn btn-default btn-sm eventBtn" ><i class="fa fa-plus"></i> Grabar</a>
							
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
<script type="text/javascript" src="assets/global/plugins/bootstrap-datepicker/js/bootstrap-datepicker.js"></script>
<!-- END PAGE LEVEL PLUGINS -->

<!-- BEGIN PAGE LEVEL SCRIPTS -->
<script src="assets/global/scripts/metronic.js" type="text/javascript"></script>
<script src="assets/admin/layout4/scripts/layout.js" type="text/javascript"></script>
<!-- END PAGE LEVEL SCRIPTS -->
<script>
jQuery(document).ready(function() {   
	Metronic.init(); // init metronic core components
	Layout.init(); // init current layout
	
	$('#txtFechaOperacion').datepicker({
		format: 'dd/mm/yyyy',
		autoclose: true,
		language: "es"
	});
});
</script>
<script>
jQuery(function($) {
	var locations = {
	    'Ingreso': ['Cobranza Venta/Servicio', 'Otra cobranza', 'Transferencia cuenta', 'Interes ganado'],
		'Egreso': ['Pago Proveedor', 'Pago Planilla/Beneficios', 'Compra', 'Tributo', 'Transferencia', 'Reembolso Caja Chica', 'Gasto Financiero'],
	}
	
	$('#sltTipoTransaccion').change(function(){
        var country = $(this).val(), lcns = locations[country] || [];
        var html = $.map(lcns, function(lcn){
            return '<option value="' + lcn + '">' + lcn + '</option>'
        }).join('');
        
        $('#sltTransaccion').html(html);
    });
	
	$('#sltTransaccion').change(function(){
		var value = ($('#sltTransaccion option:selected').text());
		var html = '';
		
		switch(value){
		//INGRESOS
		case 'Cobranza Venta/Servicio':
			formDynamic('#templateCobranzaVentaServicio');
			break;
		case 'Otra cobranza':
			formDynamic('#templateOtraCobranza');
			break;templateTransferenciaCuenta
		case 'Transferencia cuenta':
			formDynamic('#templateTransferenciaCuenta');
			break;
		case 'Interes ganado':
		formDynamic('#templateInteresGanado');
			break;
		//EGRESOS
		}
	});
});

function formDynamic(opcion){
	$('.dynamic').remove();
	
	var source = $(opcion).html();
	var template = Handlebars.compile(source);
	html = template();
	
	$('#divSecondRow').html(html);
}
</script>
<script id="templateCobranzaVentaServicio" type="text/x-handlebars-template">
<div class="col-md-3 dynamic">
	<div class="form-group">
		<div class="col-md-12">
			<input id="txtNombreCliente" class="form-control" placeholder="Cliente" name="nombre"/>
		</div>
	</div>
</div>
<div class="col-md-3 dynamic">
	<div class="form-group">
		<div class="col-md-12">
			<input id="txtFactura" class="form-control" placeholder="Factura" name="nombre"/>
		</div>
	</div>
</div>
<div class="col-md-3 dynamic">
	<div class="form-group">
		<div class="col-md-12">
			<input id="txtOrdenTrabajo" class="form-control" placeholder="Orden Trabajo" name="nombre"/>
		</div>
	</div>
</div>
</script>
<script id="templateOtraCobranza" type="text/x-handlebars-template">
<div class="col-md-3 dynamic">
	<div class="form-group">
		<div class="col-md-12">
			<input id="txtNombreCliente" class="form-control" placeholder="Cliente" name="nombre"/>
		</div>
	</div>
</div>
<div class="col-md-3 dynamic">
	<div class="form-group">
		<div class="col-md-12">
			<input id="txtFactura" class="form-control" placeholder="Factura" name="nombre"/>
		</div>
	</div>
</div>
</script>
<script id="templateTransferenciaCuenta" type="text/x-handlebars-template">
<div class="col-md-3 dynamic">
	<div class="form-group">
		<div class="col-md-12">
			<input id="txtCuentaDestino" class="form-control" placeholder="Cuenta Origen" name="nombre"/>
		</div>
	</div>
</div>
<div class="col-md-3 dynamic">
	<div class="form-group">
		<div class="col-md-12">
			<input id="txtCodigoOperacion" class="form-control" placeholder="Codigo Operacion" name="nombre"/>
		</div>
	</div>
</div>
</script>
<script id="templateInteresGanado" type="text/x-handlebars-template">
<div class="col-md-3 dynamic">
	<div class="form-group">
		<div class="col-md-12">
			<input id="txtCodigoOperacion" class="form-control" placeholder="Codigo Operacion" name="nombre"/>
		</div>
	</div>
</div>
</script>
</body>
</html>