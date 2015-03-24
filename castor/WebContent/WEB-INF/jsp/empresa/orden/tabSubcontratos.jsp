<div id="viewSubcontratos" class="portlet-body">
	<table class="detailGridPane">
	<thead>
	<tr style="border-bottom: 1px solid #D3D8DE;">
		<th>Proveedor</th><th>Tipo Trabajo</th><th>Monto</th><th>Termino Obra</th><th>Estado</th><th>Supervisor</th>
	</tr>
	</thead>

	<tbody id="viewSubcontratosHandlerbars">
	</tbody>
	</table>
</div>

<div id="viewPagos" class="portlet-body" style="margin-top: 20px">
	<table class="detailGridPane">
	<thead>
	<tr style="border-bottom: 1px solid #D3D8DE;">
		<th>Proveedor</th><th>Monto</th><th>Tipo Pago</th><th>Vencimiento</th><th>Pago Programado</th><th>Pago Real</th><th>Pagador</th><th>Estado</th>
	</tr>
	</thead>

	<tbody id="viewPagosHandleBars">
	</tbody>
	</table>
</div>

<script>
/****SUBCONTRATOS****/
function initOrdenSubcontratos(subcontratos){
	var html = '';
	var sumMontoSubcontratos = 0;
	
	$.each(subcontratos, function(i, subcontrato){
		sumMontoSubcontratos += subcontrato.monto;
		
		var source = $("#templateSubcontratos").html();
		var template = Handlebars.compile(source);
		html += template(subcontrato);
	});	
	//Si se refresca muy rapido puede fallar la resta y pone el valor de (subcontratos)
	utilBruta = oferta - sumMontoSubcontratos; 
	utilNeta =  utilBruta - gastosGen;
	eficiencia = (sumMontoSubcontratos/oferta) * 100;
	
	$('#spnSumMontoSubs').text($.getFormattedCurrency(sumMontoSubcontratos));
	$('#spnUtilBruta').text($.getFormattedCurrency(utilBruta));
	$('#spnUtilNeta').text($.getFormattedCurrency(utilNeta));
	$('#spnEficiencia').text(eficiencia.toFixed(2) + '%');
	
	$('#viewSubcontratosHandlerbars').html(html);
}

/****CUENTAS PAGAR****/
function initSubsCuentasPagar(cuentaspago){
	var html = '';
		
	$.each(cuentaspago, function(i, pago){
		var source = $("#templatePagos").html();
		var template = Handlebars.compile(source);
		html += template(pago);
			
	});

	$('#viewPagosHandleBars').html(html);	
}
</script>

<script id="templateSubcontratos" type="text/x-handlebars-template">
<tr style="border-bottom: 1px solid #D3D8DE;">
	<td>{{nombreProveedor}}</td>
	<td>{{tipoTrabajo}}</td>
	<td>$ {{monto}}</td>
	<td>{{fechaTerminoObra}}</td>
	<td>{{estado}}</td><td>Eduardo Ramos</td>
</tr>
</script>

<script id="templatePagos" type="text/x-handlebars-template">
<tr style="border-bottom: 1px solid #D3D8DE;">
	<td>{{nombreProveedor}}</td>
	<td>$ {{monto}}</td>
	<td>{{tipoPago}}</td>
	<td>{{fechaVencimiento}}</td><td>{{fechaPagoProgramada}}</td><td>{{fechaPagoReal}}</td><td>{{Pagador}}</td>
	<td><span class="label label-warning">{{estado}}</span></td>
</tr>
</script>