<div class="table-scrollable">
	<table class="table table-striped table-hover dataTable no-footer">
	<thead>
	<tr>
		<th>Proveedor</th><th>Tipo</th><th>Moneda</th><th>Monto</th>
	</tr>
	</thead>
	<tbody id="viewSubcontratosHandlerbars">
	</tbody>
	</table>
</div>

<script id="templateSubcontratos" type="text/x-handlebars-template">
<tr>
	<td>{{idProveedor}}</td>
	<td>{{tipoTrabajo}}</td>
	<td>{{moneda}}</td>
	<td>{{monto}}</td>
</tr>
</script>