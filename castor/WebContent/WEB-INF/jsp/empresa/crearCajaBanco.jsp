<!DOCTYPE html>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Castor | Caja Banco</title>
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
				<div class="caption"><i class="icon-share"></i>Crear Caja Banco</div>
				<div class="actions">							
					<a class="btn btn-icon-only btn-default btn-sm fullscreen" href="#" data-original-title="" title=""></a>
				</div>
			</div>
			
			<div class="portlet-body form">
			<form:form id="frmCrearCajaBanco" class="form-horizontal" action="crearOrden" method="post" commandName="ordenBean">
				<div class="detailBody ">
					
					<div class="detailItem">
						<span class="labelv1">Monto</span>
						<span class="value"><input type="text" placeholder="Monto $."/></span>
					</div>
					<div class="detailItem">
						<span class="labelv1">Monto</span>
						<span class="value"><input type="text" placeholder="Monto $."/></span>
					</div>
					<div class="detailItem">
						<span class="labelv1">Monto</span>
						<span class="value"><input type="text" placeholder="Monto $."/></span>
					</div>
					
				</div>
			
			
			
			
			
			
			
			
			
			
			
				<!-- <div class="form-body">
					
					<div class="row">
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
										<option value="Prestamo recibido">Prestamo recibido</option>
									</select>
								</div>
							</div>
						</div>
						<div class="col-md-3">
							<div class="form-group">
								<div class="col-md-12">
									<input id="txtNombreCliente" class="form-control" placeholder="Cliente" name="nombre"/>
								</div>
							</div>
						</div>
						</div>
						
						<div class="row">
						<div class="col-md-3">
							<div class="form-group">
								<div class="col-md-12">
									<input id="txtNombre" class="form-control" placeholder="COD Factura" name="nombre"/>
								</div>
							</div>
						</div>
						<div class="col-md-3">
							<div class="form-group">
								<div class="col-md-12">
									<a id="btnGrabar" class="btn btn-default" ><i class="fa fa-plus"></i> Subir Archivo</a>
								</div>
							</div>
						</div>
						<div class="col-md-6">
							<div class="form-group">
								<div class="col-md-12">
									<input id="txtNombre" class="form-control" placeholder="Desripcion...falta fecha" name="nombre"/>
								</div>
							</div>
						</div>
						</div>
						
						<div class="row">
							<div class="col-md-3">
							<a id="btnGrabar" class="btn btn-default btn-sm eventBtn" ><i class="fa fa-plus"></i> Grabar</a>
							
							</div>
						</div>
					
					
				</div> -->
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
jQuery(function($) {
	var locations = {
	    'Ingreso': ['Cobranza Venta/Servicio', 'Otra cobranza', 'Transferencia cuenta', 'Interes ganado', 'Prestamo recibido'],
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
		
		switch(value){
		//INGRESOS
		case 'Cobranza Venta/Servicio':
			$('#txtNombreCliente').show();
			break;
		case 'Otra cobranza':
			$('#txtNombreCliente').show();
			break;
		case 'Transferencia cuenta':
			$('#txtNombreCliente').hide();
			break;
		case 'Interes ganado':
			$('#txtNombreCliente').hide();
			break;
		case 'Prestamo recibido':
			$('#txtNombreCliente').hide();
			break;
		//EGRESOS
		}
	});
});
</script>
</body>
</html>