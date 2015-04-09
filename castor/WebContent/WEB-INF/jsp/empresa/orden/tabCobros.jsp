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
			<tr class="heading">
				<th>N° Factura</th><th>Monto</th><th> + IGV</th><th>Emision</th><th>Cancelacion</th><th>Cobro Factura</th><th>Estado Factura</th><th>Detraccion</th><th>%</th><th>Estado Detraccion</th>
			</tr>
			</thead>
			<tbody id="viewDatosFactura">
			<tr>
				<td>0000001</td><td>$6,000.00</td><td>$7,080.00</td><td>04/04/2015</td><td>04/04/2015</td><td>$6,372.00</td><td>Cancelado</td><td>$708.00</td><td>10%</td><td>Pendiente</td>
			</tr>
			</tbody>
		</table>
	</div>
</div>
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
</script>
<script id="templateCobrosCliente" type="text/x-handlebars-template">
<tr style="border-bottom: 1px solid #D3D8DE;">
	<td>{{fechaVencimiento}}</td>
	<td>$ {{monto}}</td>
	<td>{{tipoPago}}</td>
	<td>{{estadoTrabajo}} {{avance}}</td>
	<td>Pendiente</td>
	<td><button type="button" class="btn yellow">Crear Factura</button></td>
</tr>
</script>