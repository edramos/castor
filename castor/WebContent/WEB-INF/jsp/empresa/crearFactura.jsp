<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Castor | Crear Factura</title>
<jsp:include page="../comps/headMandatory.jsp"/>
<!-- BEGIN PAGE LEVEL STYLES -->
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
				<div class="caption"><i class="icon-share"></i>Crear Factura</div>
				<div class="actions">							
					<a class="btn btn-icon-only btn-default btn-sm fullscreen" href="#" data-original-title="" title=""></a>
				</div>
			</div>
			<div class="portlet-body form">
				<div class="form-body">
				
					<div class="row">
						
						<div class="col-md-3">
							<div class="form-group">
								<div class="col-md-12">
									<select id="sltTipoIngreso" class="form-control" name="operacion">
										<option value="OT">Orden de Trabajo</option>
										<option value="Otros">Otros</option>
									</select>
								</div>
							</div>
						</div>
						<div class="col-md-3">
							<div class="form-group">
								<div id="divSltOT" class="col-md-12">
									<select id="sltOT" class="form-control" name="operacion">
									</select>
								</div>
							</div>
						</div>
						<div class="col-md-3">
							<div class="form-group">
								<div id="divSltCPC" class="col-md-12">
									<select id="sltCuentaPorCobrar" class="form-control" name="operacion">
									</select>
								</div>
							</div>
						</div>
						
					</div>
					
				</div>
			</div>
		</div>
	</div>
</div>

<div class="row">
	<div class="col-md-12">
		<div class="portlet box blue-hoki">
			<div class="portlet-title">
				<div class="caption"><i class="icon-share"></i>Factura</div>
				<div class="actions">							
					<a class="btn btn-icon-only btn-default btn-sm fullscreen" href="#" data-original-title="" title=""></a>
				</div>
			</div>
			<div class="portlet-body">
				<div class="detailPane">
					<div class="summaryBody sectionBody">
						<div class="summaryBodyLeft">
							<div class="summaryBodyItem">
								<span class="spanLabel">Cliente</span><span id="spnNombreCliente" class="value"></span>
							</div>
							<div class="summaryBodyItem">
								<span class="spanLabel">Nombre</span><span id="spnNombre" class="value"></span>
							</div>
							<div class="summaryBodyItem">
								<span class="spanLabel">Tipo</span><span id="spnTipo" class="value"></span>
							</div>
							<div class="summaryBodyItem">
								<span class="spanLabel">Trabajo</span><span id="spnTrabajo" class="value"></span>
							</div>
						</div>
						<div class="summaryBodyMiddle">
							<div class="summaryBodyItem">
								<span class="spanLabel">Monto</span><span id="spnMonto" class="value"></span>
							</div>
							<div class="summaryBodyItem">
								<span class="spanLabel">IGV</span><span id="spnIgv" class="value"></span>
							</div>
							<div class="summaryBodyItem">
								<span class="spanLabel">Monto + IGV</span><span id="spnConIgv" class="value"></span>
							</div>
							<div class="summaryBodyItem">
								<span class="spanLabel">Detraccion</span><span id="spnDetraccion" class="value"></span>
							</div>
						</div>
						<div class="summaryBodyRight">
							<div class="summaryBodyItem">
								<span class="spanLabel">Cobrar</span><span id="spnCobrar" class="value"></span>
							</div>
							<div class="summaryBodyItem">
								<span class="spanLabel">Vence</span><span id="spnVence" class="value"></span>
							</div>
							<div class="summaryBodyItem">
								<span class="spanLabel">Creador</span><span id="spnCreador" class="value"></span>
							</div>
							<div class="summaryBodyItem">
								<span class="spanLabel"></span><span id="#" class="value"></span>
							</div>
						</div>
					
					</div>
				</div>
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
<!-- END PAGE LEVEL PLUGINS -->

<!-- BEGIN PAGE LEVEL SCRIPTS -->
<script src="assets/global/scripts/metronic.js" type="text/javascript"></script>
<script src="assets/admin/layout4/scripts/layout.js" type="text/javascript"></script>
<!-- END PAGE LEVEL SCRIPTS -->
<script>
jQuery(document).ready(function() {   
	Metronic.init(); // init metronic core components
	Layout.init(); // init current layout
});
</script>
<script>
$('#sltTipoIngreso').change(function(){
	var value = $('#sltTipoIngreso option:selected').val();
	if(value == "OT"){
		$('#sltOT').remove();
		$('#divSltOT').append('<select id="sltOT" class="form-control" name="operacion"></select>');
		listarOT();
		$('#sltOT').on('change', function(){
			$('#sltCuentaPorCobrar').remove();
			$('#divSltCPC').append('<select id="sltCuentaPorCobrar" class="form-control" name="operacion"></select>');
			var idOrden = $('#sltOT option:selected').val();
			
			listarDetalleFactura(idOrden);
			listarCuentasPorCobrar(idOrden);
		});
		$('#divSltCPC').on('change', function(){
			var idCuenta = $('#divSltCPC option:selected').val();
			listarDetalleCuenta(idCuenta);
		});
	}
});
function listarDetalleCuenta(idCuenta){
	$.ajax({
 		url: 'ajaxDetalleCuenta-' + idCuenta,
 		type: 'post',
 		dataType: 'json',
 		data: '',
 		success: function(cuenta){
 			$('#spnMonto').text(cuenta.monto);
 			$('#spnIgv').text(cuenta.igv);
 			$('#spnConIgv').text(cuenta.conIgv);
 			$('#spnDetraccion').text(cuenta.montoDetraccion);
 			$('#spnCobrar').text(cuenta.cobrar);
 			$('#spnVence').text(cuenta.fechaVencimiento);
 		}
 	});
}
function listarDetalleFactura(idOrden){
	$.ajax({
 		url: 'ajaxObtenerInformacionOrden-' + idOrden,
 		type: 'post',
 		dataType: 'json',
 		data: '',
 		success: function(orden){
 			$('#spnNombreCliente').text(orden.nombreCliente);
 			$('#spnNombre').text(orden.nombre);
 			if(orden.tipoOrden == 'OC'){
 				$('#spnTipo').text('Obra Civil');	
 			}else{
 				$('#spnTipo').text('Trabajos Varios');	
 			}
 			$('#spnTrabajo').text(orden.tipoTrabajo);
 		}
 	});
}
function listarOT(){
	$.ajax({
 		url: 'ajaxBuscarOrdenFactura',
 		type: 'post',
 		dataType: 'json',
 		data: '',
 		success: function(ordenes){
 			$.each(ordenes, function(i, orden){
 				$('#sltOT').append('<option value="' + orden.idOrden + '">' + orden.codigo + '</option>');
 			});
 		}
 	});
}
function listarCuentasPorCobrar(idOrden){
	$.ajax({
 		url: 'ajaxListarCuentas-cobro-' + idOrden,
 		type: 'post',
 		dataType: 'json',
 		data: '',
 		success: function(cuentascobrar){
 			$.each(cuentascobrar, function(i, cuenta){
 				$('#sltCuentaPorCobrar').append('<option value="' + cuenta.idCuenta + '">' + cuenta.monto + '</option>');
 			});	 	        
 		}
 	});
}
</script>
</body>
</html>