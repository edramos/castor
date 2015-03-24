<div id="viewSubcontratosHandlerbars" class="portlet-body">
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

	$('#viewPagosHandleBars_2').html(html);	
}
</script>

<script id="templateSubcontratos" type="text/x-handlebars-template">
<div class="detailPane results">
	<div class="detailHeader"><div class="detailHeaderLeft"><span class="h2v1">{{nombreProveedor}}</span></div></div>
	<div class="summaryBody sectionBody">
	
		<div class="summaryBodyLeft" style="width: 24%">
			<div class="summaryBodyItem">
				<span class="spanLabel">Tipo Trabajo</span><span class="value">{{tipoTrabajo}}</span>
			</div>
		</div>
		<div class="summaryBodyMiddle" style="width: 24%">
			<div class="summaryBodyItem">
				<span class="spanLabel">Monto</span><span class="value">$ {{monto}}</span>
			</div>
		</div>
			
		<div class="summaryBodyMiddle" style="width: 24%">
			<div class="summaryBodyItem">
				<span class="spanLabel">Estado</span><span class="value">{{estado}}</span>
			</div>
		</div>
		
		<div class="summaryBodyRight" style="width: 24%">
			<div class="summaryBodyItem">
				<span class="spanLabel">Supervisor</span><span class="value">Eduardo Ramos</span>
			</div>
		</div>
		

		<table class="detailGridPane">
		<thead>
		<tr style="border-bottom: 1px solid #D3D8DE;">
			<th>N°</th><th>Monto</th><th>Tipo Pago</th><th>Vencimiento</th><th>Pago Programado</th><th>Pago Real</th><th>Pagador</th><th>Estado</th>
		</tr>
		</thead>

		<tbody id="viewPagosHandleBars_{{idProveedor}}">
		</tbody>
		</table>

	</div>
</div>
</script>

<script id="templatePagos" type="text/x-handlebars-template">
<tr style="border-bottom: 1px solid #D3D8DE;">
	<td>1</td>
	<td>{{monto}}</td>
	<td>{{tipo}}</td>
	<td>{{fechaVencimiento}}</td><td>{{fechaPagoProgramada}}</td><td>{{FechaPagoReal}}</td><td>{{Pagador}}</td>
	<td><span class="label label-warning">{{estado}}</span></td>
</tr>
</script>