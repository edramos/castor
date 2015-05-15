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
			<th>N� F.</th><th>Proveedor</th><th>Vencimiento</th><th>Monto</th><th>Tipo Pago</th><th>Condicion</th>
			<th>Estado</th>
		</tr>
		</thead>
	
		<tbody id="viewPagosHandleBars">
		</tbody>
		</table>
	</div>
</div>

<div class="portlet-body">
	<div class="table-scrollable">
		<table class="table table-bordered table-hover">
			<thead>
			<tr class="heading">
				<th>N� F.</th><th>Monto</th><th>IGV</th><th>Mon + IGV</th><th>Detraccion</th><th>Pagar</th><th>Estado D.</th>
				<th>Estado F.</th><th>Emitido</th><th>Pago D.</th><th>Pago F.</th>
			</tr>
			</thead>
			<tbody id="viewDatosFacturaPagar">
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
		sumMontoSubcontratos = subcontrato.totalMonto;
		
		var source = $("#templateSubcontratos").html();
		var template = Handlebars.compile(source);
		html += template(subcontrato);
	});	
	//Si se refresca muy rapido puede fallar la resta y pone el valor de (subcontratos)
	utilBruta = oferta - sumMontoSubcontratos; 
	utilNeta =  utilBruta - gastosGen;
	eficiencia = (sumMontoSubcontratos/oferta) * 100;
	
	//$('#spnSumMontoSubs').text($.getFormattedCurrency(sumMontoSubcontratos));
	$('#spnSumMontoSubs').text(sumMontoSubcontratos);
	//$('#spnUtilBruta').text($.getFormattedCurrency(utilBruta));
	$('#spnUtilNeta').text($.getFormattedCurrency(utilNeta));
	//$('#spnEficiencia').text(eficiencia.toFixed(2) + '%');
	
	$('#viewSubcontratosHandlerbars').html(html);
}

/****CUENTAS PAGAR****/
function initSubsCuentasPagar(cuentaspago){
	var html = '';
	Handlebars.registerHelper('ifEst', function (estado, v2, options){
		if(estado === v2){
			return options.fn(this);
		}
		
		return options.inverse(this);
	});
	
	$.each(cuentaspago, function(i, pago){
		var source = $("#templatePagos").html();
		var template = Handlebars.compile(source);
		html += template(pago);
			
	});
	$('#viewPagosHandleBars').html(html);
}
</script>
<script>
function initFacturasPagar(facturasPagar){
	var html = '';
	Handlebars.registerHelper('ifFactura', function(estado, v2, options){
		  if(estado === 'Cancelado'){return options.fn(this);}return options.inverse(this);
	});
	Handlebars.registerHelper('ifDet', function(estadoDetraccion, v2, options){
		  if(estadoDetraccion === 'Cancelado'){return options.fn(this);}return options.inverse(this);
	});
	
	$.each(facturasPagar, function(i, factura){
		var source = $("#templateFacturasPagar").html();
		var template = Handlebars.compile(source);
		html += template(factura);
	});

	$('#viewDatosFacturaPagar').html(html);
	$('#viewDatosFacturaPagar').append('<tr style="text-align:right;font-weight: bold;">'+
			'<td style="text-align:left;font-weight:bold;">TOTAL</td>'+
			'<td>'+ facturasPagar[facturasPagar.length - 1].totalMonto +'</td><td>'+ facturasPagar[facturasPagar.length - 1].totalIgv +'</td><td>'+ facturasPagar[facturasPagar.length - 1].totalConIgv +'</td>'+
			'<td>'+ facturasPagar[facturasPagar.length - 1].totalDetraccion +'</td><td>'+ facturasPagar[facturasPagar.length - 1].totalCobrar +'</td><td></td><td></td><td></td><td></td><td></td>'+
			'</tr>');
}
</script>
<script id="templateFacturasPagar" type="text/x-handlebars-template">
<tr style="text-align:right;">
	<td style="text-align:center;">{{codigo}}</td>
	<td>{{subTotal}}</td>
	<td>{{igv}}</td>
	<td>{{conIgv}}</td>
	<td>{{montoDetraccion}} ({{detraccion}}%)</td>
	<td>{{cobrarFactura}}</td>
	<td style="text-align:center;">{{#ifDet estadoDetraccion Cancelado}}<span class="label label-success">{{estadoDetraccion}}</span>{{else}}{{estadoDetraccion}}{{/ifDet}}</td>
	<td style="text-align:center;">{{#ifFactura estado Cancelado}}<span class="label label-success">{{estado}}</span>{{else}}{{estado}}{{/ifFactura}}</td>
	<td style="text-align:center;">{{fechaEmision}}</td>
	<td style="text-align:center;">{{fechaCancelacionDetraccion}}</td>
	<td style="text-align:center;">{{fechaCancelacion}}</td>
</tr>
</script>
<script id="templatePagos" type="text/x-handlebars-template">
<tr>
	<td>{{codigo}}</td>
	<td style="text-align:left;">{{nombreProveedor}}</td>
	<td>{{fechaVencimiento}}</td>
	<td style="text-align:right;">{{conIgv}}</td>
	<td>{{tipoPago}}</td>
	<td>{{estadoTrabajo}} {{avance}}</td>
	<td>{{#ifEst estado 'Cancelado'}}<span class="label label-success">{{estado}}</span>{{/ifEst}}
	{{#ifEst estado 'Pendiente'}}<span class="label label-warning">{{estado}}</span>{{/ifEst}}
	{{#ifEst estado 'Facturado'}}<span class="label label-primary">{{estado}}</span>{{/ifEst}}</td>
</tr>
</script>
<script id="templateSubcontratos" type="text/x-handlebars-template">
<tr>
	<td>{{nombreProveedor}}</td>
	<td>{{tipoTrabajo}}</td>
	<td>{{monto}}</td>
	<td>{{fechaTerminoObra}}</td>
	<td>{{estado}}</td><td>Eduardo Ramos</td>
</tr>
</script>