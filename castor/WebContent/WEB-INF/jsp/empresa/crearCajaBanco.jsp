<!DOCTYPE html>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Castor | Caja Banco</title>
<jsp:include page="../comps/headMandatory.jsp"/>
<!-- BEGIN PAGE LEVEL STYLES -->
<link rel="stylesheet" type="text/css" href="assets/global/plugins/select2/select2.css"/>
<link rel="stylesheet" type="text/css" href="assets/global/plugins/bootstrap-datepicker/css/datepicker.css"/>
<link rel="stylesheet" type="text/css" href="assets/global/plugins/datatables/extensions/Scroller/css/dataTables.scroller.min.css"/>
<link rel="stylesheet" type="text/css" href="assets/global/plugins/datatables/extensions/ColReorder/css/dataTables.colReorder.min.css"/>
<link rel="stylesheet" type="text/css" href="assets/global/plugins/datatables/plugins/bootstrap/dataTables.bootstrap.css"/>
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
					<a id="btnCrearCajaBanco" class="btn green-meadow btn-sm eventBtn"><i class="fa fa-check"></i> Grabar </a>
					<a id="btnCancelarCajaBanco" class="btn red-sunglo btn-sm eventBtn"><i class="fa fa-close"></i> Cancelar </a>							
					<a class="btn btn-icon-only btn-default btn-sm fullscreen" href="#" data-original-title="" title=""></a>
				</div>
			</div>
			
			<div class="portlet-body form">
			<form:form id="frmCrearCajaBanco" class="form-horizontal" action="ajaxCrearCajaBanco" method="post" commandName="cajaBean">
				
				<div class="form-body">
					
					<div class="row">
						<div class="col-md-3">
							<div id="txtFechaOperacion" class="input-group date date-picker" data-date-format="dd/mm/yyyy">
								<input type="text" class="form-control form-filter valid" placeholder="Fecha Operacion" name="fechaOperacion" aria-required="true" aria-invalid="false">											
								<span class="input-group-btn"><button class="btn default" type="button"><i class="fa fa-calendar"></i></button></span>
							</div>
						</div>
						<div class="col-md-3">
							<div class="form-group">
								<div class="col-md-12">
									<input id="txtNombre" class="form-control" placeholder="Monto $/." name="monto"/>
								</div>
							</div>
						</div>
						<div class="col-md-3">
							<div class="form-group">
								<div class="col-md-12">
									<select id="sltTipoTransaccion" class="form-control" name="operacion">
										<option value="Ingreso">Ingreso</option>
										<option value="Egreso">Egreso</option>
									</select>
								</div>
							</div>
						</div>
						<div class="col-md-3">
							<div class="form-group">
								<div class="col-md-12">
									<select id="sltTransaccion" class="form-control" name="tipoOperacion">
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
									<input id="txtNombreCliente" class="form-control" placeholder="Cliente" name="idCliente"/>
								</div>
							</div>
						</div>
						<div class="col-md-3 dynamic">
							<div class="form-group">
								<div class="col-md-12">
									<input id="txtFactura" class="form-control" placeholder="Factura" name="factura"/>
								</div>
							</div>
						</div>
						<div class="col-md-3 dynamic">
							<div class="form-group">
								<div class="col-md-12">
									<input id="txtOrdenTrabajo" class="form-control" placeholder="Orden Trabajo" name="idOrden"/>
								</div>
							</div>
						</div>
					</div>
						
					<div class="row">
						<div class="col-md-12">
							<div class="form-group">
								<div class="col-md-12">
									<input id="txtOrdenTrabajo" class="form-control" placeholder="Descripcion..." name="descripcion"/>
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
				<div class="caption">Caja Banco</div>
				<div class="actions">							
					<a class="btn btn-icon-only btn-default btn-sm fullscreen" href="#" data-original-title="" title=""></a>
				</div>
			</div>
			<div id="divPortletBody" class="portlet-body">
				<table id="sample_1" class="table table-striped table-hover">
				<thead>
				<tr>
					<th>Tipo Operacion</th>
					<th>Fecha</th>
					<th>Ingreso</th>
					<th>Egreso</th>
					<th>Saldo</th>
				</tr>
				</thead>
				
				<tbody id="viewResultadosHandlerbars">
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
<script src="assets/admin/pages/scripts/table-advanced.js"></script>
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
	
	listarCaja();
});
</script>
<script>
jQuery(function($){
	var locations = {
	    'Ingreso': ['Cobranza Venta/Servicio', 'Otra cobranza', 'Transferencia cuenta', 'Interes ganado'],
		'Egreso': ['Pago Proveedor', 'Pago Planilla/Beneficios', 'Compra', 'Tributo', 'Transferencia cta.', 'Reembolso Caja Chica', 'Gasto Financiero'],
	}
	
	$('#sltTipoTransaccion').change(function(){
        var country = $(this).val(), lcns = locations[country] || [];
        var html = $.map(lcns, function(lcn){
            return '<option value="' + lcn + '">' + lcn + '</option>'
        }).join('');
        
        $('#sltTransaccion').html(html);
        var value = $('#sltTipoTransaccion option:selected').text();
        var html = '';
        
        if(value == 'Ingreso'){
        	formDynamic('#templateCobranzaVentaServicio');
        }else{
        	formDynamic('#templatePagoProveedor');
        }
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
			formDynamic('#templateTransferenciaCuentaIngreso');
			break;
		case 'Interes ganado':
		formDynamic('#templateCodigoOperacion');
			break;
		//EGRESOS
		case 'Pago Proveedor':
			formDynamic('#templatePagoProveedor');
			break;
		case 'Pago Planilla/Beneficios':
			formDynamic('#templatePagoPlanillaBeneficios');
			break;
		case 'Compra':
			formDynamic('#templateCompra');
			break;
		case 'Tributo':
			formDynamic('#templateCodigoOperacion');
			break;
		case 'Transferencia cta.':
			formDynamic('#templateTransferenciaCuentaEgreso');
			break;
		case 'Reembolso Caja Chica':
			formDynamic('#templateCodigoOperacion');
			break;
		case 'Gasto Financiero':
			formDynamic('#templateCodigoOperacion');
			break;
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

function crearCajaBanco(){
	var html = '';
	$.ajax({
 		url: 'ajaxCrearCajaBanco',
 		type: 'post',
 		dataType: 'json',
 		data: $('#frmCrearCajaBanco').serialize(),
 		success: function(registros){
 			$.each(registros, function(i, cliente){
	 			var source = $("#templateClientes").html();
	 			var template = Handlebars.compile(source);
	 			html += template(registro);
 			});	
 			
 			$("#viewResultadosHandlerbars").html(html);
 			
 			$('#sample_1').dataTable({
 			    "bSort": false
 			  }); 			
 		}
 	});	
}
$(document).on('click','.eventBtn', function(e){
	switch(this.id){
	case "btnCrearCajaBanco":
		alert('voy a grabar');
		$('#frmCrearCajaBanco').submit();
		break;
	}
});

function listarCaja(){
	var html = '';
	$.ajax({
 		url: 'listarCajaBanco',
 		type: 'post',
 		dataType: 'json',
 		success: function(registros){
 			removeTable();
 			createTable();
 			$.each(registros, function(i, registro){
	 			var source = $("#templateCajaBanco").html();
	 			var template = Handlebars.compile(source);
	 			html += template(registro);
 			});
 			
 			$("#viewResultadosHandlerbars").html(html);
 			
 			$('#sample_1').dataTable({
 			    "bSort": false
 			  });
 		}
 	});	
}
function removeTable(){
	$('#sample_1').remove();
	$('#sample_1_wrapper').remove();
}
function createTable(){
	$('#divPortletBody').append(
			"<table class='table table-striped table-hover' id='sample_1'><thead><tr><th>Tipo Operacion</th><th>Fecha</th><th>Ingreso</th><th>Egreso</th><th>Saldo</th>"+
			"</tr></thead><tbody id='viewResultadosHandlerbars'></tbody></table>"	
	);
}
</script>
<script id="templateCajaBanco" type="text/x-handlebars-template">
<tr>
	<td>{{tipoOperacion}}</td>
	<td>{{fechaOperacion}}</td>
	<td>{{ingreso}}</td>
	<td>{{egreso}}</td>
	<td>{{saldo}}</td>
</tr>
</script>
<!-- EGRESOS -->
<script id="templateCodigoOperacion" type="text/x-handlebars-template">
<div class="col-md-3 dynamic">
	<div class="form-group">
		<div class="col-md-12">
			<input id="txtCodigoOperacion" class="form-control" placeholder="Codigo Operacion" name="codigoOperacion"/>
		</div>
	</div>
</div>
</script>
<script id="templateTransferenciaCuentaEgreso" type="text/x-handlebars-template">
<div class="col-md-3 dynamic">
	<div class="form-group">
		<div class="col-md-12">
			<input id="txtCuentaDestino" class="form-control" placeholder="Cuenta Destino" name="cuentaBancoDestino"/>
		</div>
	</div>
</div>
<div class="col-md-3 dynamic">
	<div class="form-group">
		<div class="col-md-12">
			<input id="txtCodigoOperacion" class="form-control" placeholder="Codigo Operacion" name="codigoOperacion"/>
		</div>
	</div>
</div>
</script>
<script id="templateCompra" type="text/x-handlebars-template">
<div class="col-md-3 dynamic">
	<div class="form-group">
		<div class="col-md-12">
			<input id="txtProveedor" class="form-control" placeholder="Factura" name="factura"/>
		</div>
	</div>
</div>
</script>
<script id="templatePagoPlanillaBeneficios" type="text/x-handlebars-template">
<div class="col-md-3 dynamic">
	<div class="form-group">
		<div class="col-md-12">
			<input id="txtProveedor" class="form-control" placeholder="Empleado" name="idEmpleado"/>
		</div>
	</div>
</div>
<div class="col-md-3 dynamic">
	<div class="form-group">
		<div class="col-md-12">
			<input id="txtFactura" class="form-control" placeholder="Codigo Operacion" name="codigoOperacion"/>
		</div>
	</div>
</div>
</script>
<script id="templatePagoProveedor" type="text/x-handlebars-template">
<div class="col-md-3 dynamic">
	<div class="form-group">
		<div class="col-md-12">
			<input id="txtProveedor" class="form-control" placeholder="Proveedor" name="idProveedor"/>
		</div>
	</div>
</div>
<div class="col-md-3 dynamic">
	<div class="form-group">
		<div class="col-md-12">
			<input id="txtFactura" class="form-control" placeholder="Factura" name="factura"/>
		</div>
	</div>
</div>
<div class="col-md-3 dynamic">
	<div class="form-group">
		<div class="col-md-12">
			<input id="txtOrdenTrabajo" class="form-control" placeholder="Orden Trabajo" name="idOrden"/>
		</div>
	</div>
</div>
</script>
<!-- INGRESOS -->
<script id="templateCobranzaVentaServicio" type="text/x-handlebars-template">
<div class="col-md-3 dynamic">
	<div class="form-group">
		<div class="col-md-12">
			<input id="txtNombreCliente" class="form-control" placeholder="Cliente" name="idCliente"/>
		</div>
	</div>
</div>
<div class="col-md-3 dynamic">
	<div class="form-group">
		<div class="col-md-12">
			<input id="txtFactura" class="form-control" placeholder="Factura" name="factura"/>
		</div>
	</div>
</div>
<div class="col-md-3 dynamic">
	<div class="form-group">
		<div class="col-md-12">
			<input id="txtOrdenTrabajo" class="form-control" placeholder="Orden Trabajo" name="idOrden"/>
		</div>
	</div>
</div>
</script>
<script id="templateOtraCobranza" type="text/x-handlebars-template">
<div class="col-md-3 dynamic">
	<div class="form-group">
		<div class="col-md-12">
			<input id="txtNombreCliente" class="form-control" placeholder="Cliente" name="idCliente"/>
		</div>
	</div>
</div>
<div class="col-md-3 dynamic">
	<div class="form-group">
		<div class="col-md-12">
			<input id="txtFactura" class="form-control" placeholder="Factura" name="factura"/>
		</div>
	</div>
</div>
</script>
<script id="templateTransferenciaCuentaIngreso" type="text/x-handlebars-template">
<div class="col-md-3 dynamic">
	<div class="form-group">
		<div class="col-md-12">
			<input id="txtCuentaDestino" class="form-control" placeholder="Cuenta Origen" name="cuentaBancoOrigen"/>
		</div>
	</div>
</div>
<div class="col-md-3 dynamic">
	<div class="form-group">
		<div class="col-md-12">
			<input id="txtCodigoOperacion" class="form-control" placeholder="Codigo Operacion" name="codigoOperacion"/>
		</div>
	</div>
</div>
</script>
</body>
</html>