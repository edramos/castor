<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<div id="divCobrosCliente" class="portlet-body">
	<div class="table-responsive">
		<table class="table table-bordered table-hover">
			<thead>
			<tr class="heading">
				<th>N° F.</th><th>Fecha Vencimiento</th><th>Monto + IGV</th><th>Tipo Pago</th><th>Condicion</th><th>Estado</th><th>Acciones</th>
			</tr>
			</thead>
		
			<tbody id="viewCobrosClienteHandlerbars">
			</tbody>
		</table>
	</div>
</div>

<div class="portlet-body">
	<div class="table-scrollable">
		<table class="table table-bordered table-hover">
			<thead>
			<tr class="heading">
				<th>N° F.</th><th>Monto</th><th>IGV</th><th>Mon + IGV</th><th>Detraccion</th><th>Cobrar</th><th>Estado D.</th>
				<th>Estado F.</th><th>Emitido</th><th>Pago D.</th><th>Pago F.</th>
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
	Handlebars.registerHelper('ifCuentaCobrar', function(estado, v2, options){
		  if(estado === 'Cancelado'){return options.fn(this);}return options.inverse(this);
	});
		
	$.each(cuentascobrar, function(i, cobro){
		var source = $("#templateCobrosCliente").html();
		var template = Handlebars.compile(source);
		html += template(cobro);
	});

	$('#viewCobrosClienteHandlerbars').html(html);	
}
function initFacturasCobrar(facturasCobrar){
	var html = '';
	Handlebars.registerHelper('ifFactura', function(estado, v2, options){
		  if(estado === 'Cancelado'){return options.fn(this);}return options.inverse(this);
	});
	Handlebars.registerHelper('ifDet', function(estadoDetraccion, v2, options){
		  if(estadoDetraccion === 'Cancelado'){return options.fn(this);}return options.inverse(this);
	});
	
	$.each(facturasCobrar, function(i, factura){
		var source = $("#templateFacturasCobrar").html();
		var template = Handlebars.compile(source);
		html += template(factura);
	});

	$('#viewDatosFactura').html(html);
	$('#viewDatosFactura').append('<tr style="text-align:right;font-weight: bold;">'+
			'<td style="text-align:left;font-weight:bold;">TOTAL</td>'+
			'<td>'+ facturasCobrar[facturasCobrar.length - 1].totalMonto +'</td><td>'+ facturasCobrar[facturasCobrar.length - 1].totalIgv +'</td><td>'+ facturasCobrar[facturasCobrar.length - 1].totalConIgv +'</td>'+
			'<td>'+ facturasCobrar[facturasCobrar.length - 1].totalDetraccion +'</td><td>'+ facturasCobrar[facturasCobrar.length - 1].totalCobrar +'</td><td></td><td></td><td></td><td></td><td></td>'+
			'</tr>');
}
</script>
<script id="templateFacturasCobrar" type="text/x-handlebars-template">
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
<script id="templateCobrosCliente" type="text/x-handlebars-template">
<tr>
	<td>{{codigo}}</td>
	<td>{{fechaVencimiento}}</td>
	<td id="tdMonto_{{idCuenta}}" style="text-align:right;">{{conIgv}}</td>
	<td>{{tipoPago}}</td>
	<td>{{estadoTrabajo}} {{avance}}</td>
	<td style="text-align:center;">{{#ifCuentaCobrar estado Cancelado}}<span class="label label-success">{{estado}}</span>{{else}}{{estado}}{{/ifCuentaCobrar}}</td>
	<td></td>
</tr>
</script>