<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<div id="divCobrosCliente" class="portlet-body">
	<div class="table-responsive">
		<table class="table table-bordered table-hover">
			<thead>
			<tr class="heading">
				<th>Fecha Vencimiento</th><th>Monto</th><th>Tipo Pago</th><th>Condicion</th><th>Estado</th><th>Acciones</th>
			</tr>
			</thead>
		
			<tbody id="viewCobrosClienteHandlerbars">
			</tbody>
		</table>
	</div>
</div>

<div class="portlet-body">
	<div class="table-responsive">
		<table class="table table-bordered table-hover">
			<thead>
			<tr class="heading"  style="text-align:center;">
				<th>N° Factura</th><th>Monto</th><th> + IGV</th><th width="10%">Detraccion</th><th>%</th><th>Cobrar</th><th>Estado Factura</th><th>EstadoDetraccion</th>
			</tr>
			</thead>
			<tbody id="viewDatosFactura">
			</tbody>
		</table>
	</div>
</div>
<script>

</script>
<script>
function initClienteCuentasCobrar(cuentascobrar){
	var html = '';
		
	$.each(cuentascobrar, function(i, cobro){
		var source = $("#templateCobrosCliente").html();
		var template = Handlebars.compile(source);
		html += template(cobro);
	});

	$('#viewCobrosClienteHandlerbars').html(html);	
}
function initFacturasCobrar(facturasCobrar){
	var html = '';
	
	$.each(facturasCobrar, function(i, factura){
		var source = $("#templateFacturasCobrar").html();
		var template = Handlebars.compile(source);
		html += template(factura);
	});

	$('#viewDatosFactura').html(html);	
}
</script>
<script id="templateFacturasCobrar" type="text/x-handlebars-template">
<tr style="text-align:right;">
	<td style="text-align:center;">{{codigo}}</td>
	<td>{{subTotal}}</td>
	<td>{{conIgv}}</td>
	<td>{{montoDetraccion}}</td>
	<td>{{detraccion}}%</td>
	<td>{{cobrarFactura}}</td>
	<td style="text-align:center;">{{estado}}</td>
	<td style="text-align:center;">{{estadoDetraccion}}</td>
</tr>
</script>
<script id="templateCobrosCliente" type="text/x-handlebars-template">
<tr style="border-bottom: 1px solid #D3D8DE;">
	<td>{{fechaVencimiento}}</td>
	<td id="tdMonto_{{idCuenta}}">$ {{monto}}</td>
	<td>{{tipoPago}}</td>
	<td>{{estadoTrabajo}} {{avance}}</td>
	<td>Pendiente</td>
	<td><button id="btnCrearFactura_{{idCuenta}}" type="button" class="eventBtn btn yellow">Crear Factura</button></td>
</tr>
</script>