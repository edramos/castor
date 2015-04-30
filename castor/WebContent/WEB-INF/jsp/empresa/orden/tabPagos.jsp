<div id="viewSubcontratos" class="portlet-body">
	<div class="table-responsive">
		<table class="table table-bordered table-hover">
		<thead>
		<tr class="heading">
			<th>Proveedor</th><th>Tipo Trabajo</th><th>Monto</th><th>Termino Obra</th><th>Estado</th><th>Supervisor</th>
		</tr>
		</thead>
		<tbody id="viewSubcontratosHandlerbars">
		</tbody>
		</table>
	</div>
</div>

<div id="viewPagos" class="portlet-body" style="margin-top: 20px">
	<div class="table-responsive">
		<table class="table table-bordered table-hover">
		<thead>
		<tr class="heading">
			<th>N° F.</th><th>Proveedor</th><th>Vencimiento</th><th>Monto + IGV</th><th>Tipo Pago</th><th>Condicion</th>
			<th>Estado</th><th>Orden de Pago</th><th>Factura</th>
		</tr>
		</thead>
	
		<tbody id="viewPagosHandleBars">
		</tbody>
		</table>
	</div>
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
	$('#viewPagosHandleBars').append('<tr style="text-align:right;">'+
		'<td style="text-align:left;"><b>TOTAL</b></td>'+
		'<td>'+ cuentaspago[cuentaspago.length - 1].totalMonto +'</td><td>'+ cuentaspago[cuentaspago.length - 1].totalIgv +'</td><td>'+ cuentaspago[cuentaspago.length - 1].totalConIgv +'</td>'+
		'<td></td><td></td><td></td><td></td>'+
		'</tr>');
}
</script>

<script id="templateSubcontratos" type="text/x-handlebars-template">
<tr style="border-bottom: 1px solid #D3D8DE;">
	<td>{{nombreProveedor}}</td>
	<td>{{tipoTrabajo}}</td>
	<td>{{monto}}</td>
	<td>{{fechaTerminoObra}}</td>
	<td>{{estado}}</td><td>Eduardo Ramos</td>
</tr>
</script>

<script id="templatePagos" type="text/x-handlebars-template">
<tr style="text-align:right;">
	<td></td>
	<td style="text-align:left;">{{nombreProveedor}}</td>
	<td>{{fechaVencimiento}}</td>
	<td>{{conIgv}}</td>
	<td>{{tipoPago}}</td>
	<td>Falta</td>
	<td><span class="label label-warning">{{estado}}</span></td>
	<td style="text-align:center;">{{fechaPagoProgramada}}</td>
	<td style="text-align:center;">Pendiente</td>
</tr>
</script>