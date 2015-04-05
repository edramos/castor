<div id="divCobrosCliente" class="portlet-body">
	<table class="detailGridPane">
	<thead>
	<tr style="border-bottom: 1px solid #D3D8DE;">
		<th>Fecha Vencimiento</th><th>Monto</th><th>Tipo Pago</th><th>Condicion</th><th>Estado</th><th>Supervisor</th>
	</tr>
	</thead>

	<tbody id="viewCobrosClienteHandlerbars">
	</tbody>
	</table>
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
	<td>Eduardo Ramos</td>
</tr>
</script>