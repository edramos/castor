<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<script>
function crearCliente(){
	$.ajax({
 		url: 'ajaxCrearCliente',
 		type: 'post',
 		dataType: 'json',
 		data: $('#frmCrearCliente').serialize(),
 		success: function(resultado){
 			//$('#txtNombre').val('');
 			borrarDatos();
 			listarClientes(); 			
 		}
 	});	
}

//Open View Form Cliente
function editarCliente(idCliente){
	$('#clienteInit').hide();
	$('#clienteModificar').show();
	$('#txtIdClienteE').val(idCliente);
	$('#txtNombreE').val($('#tdNombreCliente_'+idCliente).text());
	$('#txtRucClienteE').val($('#tdRucCliente_'+idCliente).text());
	$('#txtDireccionClienteE').val($('#tdDireccionCliente_'+idCliente).text());
}
function modificarCliente(){
	$.ajax({
 		url: 'ajaxModificarCliente',
 		type: 'post',
 		dataType: 'json',
 		data: $('#frmModificarCliente').serialize(),
 		success: function(resultado){
 			$('#txtNombre').val('');
 			listarClientes(); 			
 		}
 	});	
}

function eliminarCliente(idCliente){
	if(confirm("Esta seguro que desea eliminar este cliente?")){
		$.ajax({
	 		url: 'ajaxEliminarCliente-'+idCliente,
	 		type: 'post',
	 		dataType: 'json',
	 		data: '',
	 		success: function(resultado){
	 			$('#txtNombre').val('');
	 			listarClientes(); 			
	 		}
	 	});
	}		
}

function listarClientes(){
	$('#clienteCrear').hide();
	$('#clienteModificar').hide();
	$('#clienteInit').show();
	var html = '';
    $.ajax({
 		url: 'ajaxListarClientes',
 		type: 'post',
 		dataType: 'json',
 		data: '',
 		success: function(clientes){
 			$.each(clientes, function(i, cliente){
	 			var source = $("#templateClientes").html();
	 			var template = Handlebars.compile(source);
	 			html += template(cliente);
	 			
 			});		
 			$("#viewClientesHandlerbars").html(html);	        
 		},
 		complete: function() {	 			
 			//removeNulls();
  		}
 	});
}
</script>


<div id="clienteInit" class="portlet box blue-hoki">
	<div class="portlet-title">
		<div class="caption">Clientes</div>
		<div id="dynamicActions" class="actions">
			<a id="btnIrCrearCliente" class="btn btn-default btn-sm eventBtn"><i class="fa fa-plus"></i> Crear </a>
			<a class="btn btn-icon-only btn-default btn-sm fullscreen" href="#" data-original-title="" title=""></a>
		</div>
	</div>
	
	<div class="portlet-body">
		<div class="table-responsive">
			<table class="table table-bordered table-hover">
			<thead>
			<tr class="heading">
				<th>RUC</th><th>Nombre</th><th>Direccion</th><th>Acciones</th>
			</tr>
			</thead>
			<tbody id="viewClientesHandlerbars">
			</tbody>
			</table>
		</div>
	</div>
</div>


<div id="clienteCrear" class="portlet box blue-hoki" style="display: none;">
	<div class="portlet-title">
		<div class="caption">Clientes</div>
		<div id="dynamicActions" class="actions">
			<a id="btnCrearCliente" class="btn green-meadow btn-sm eventBtn"><i class="fa fa-check"></i> Grabar </a>
			<a id="btnCancelarCliente" class="btn red-sunglo btn-sm eventBtn"><i class="fa fa-close"></i> Cancelar </a>
			<a class="btn btn-icon-only btn-default btn-sm fullscreen" href="#" data-original-title="" title=""></a>
		</div>
	</div>
	
	<div class="portlet-body">	
		<div class="form-body">
			<form:form id="frmCrearCliente" commandName="cliente">
			<div class="row">
				<div class="col-md-2">
					<input type="text" class="form-control" id="txtRucCliente" name="ruc" placeholder="RUC">
				</div>
				<div class="col-md-4">
					<input type="text" class="form-control" id="txtNombreCliente" name="nombre" placeholder="Nombre">
				</div>
				<div class="col-md-6">
					<input type="text" class="form-control" id="txtDireccionCliente" name="direccion" placeholder="Direccion">
				</div>
			</div>
			</form:form>
		</div>
	</div>
	
	
</div>

<div id="clienteModificar" class="portlet box blue-hoki" style="display: none;">
	<div class="portlet-title">
		<div class="caption">Clientes</div>
		<div id="dynamicActions" class="actions">
			<a id="btnModificarCliente" class="btn green-meadow btn-sm eventBtn"><i class="fa fa-check"></i> Grabar </a>
			<a id="btnCancelarCliente" class="btn red-sunglo btn-sm eventBtn"><i class="fa fa-close"></i> Cancelar </a>
			<a class="btn btn-icon-only btn-default btn-sm fullscreen" href="#" data-original-title="" title=""></a>
		</div>
	</div>
	<div class="portlet-body">
		<div class="form-body">
			<form:form id="frmModificarCliente" commandName="cliente">
			<div class="row">
				<div class="col-md-2">
					<input type="text" class="form-control" id="txtRucClienteE" name="ruc" placeholder="RUC">
				</div>
				<div class="col-md-4">
					<input type="hidden" class="form-control" id="txtIdClienteE" name="idCliente">
					<input type="text" class="form-control" id="txtNombreE" name="nombre" placeholder="Nombre Cliente">
				</div>
				<div class="col-md-6">
					<input type="text" class="form-control" id="txtDireccionClienteE" name="direccion" placeholder="Direccion">
				</div>
			</div>
			</form:form>
		</div>
	</div>
</div>
<script>
function borrarDatos(){
	$('.form-control').val('');
}
</script>
<script id="templateClientes" type="text/x-handlebars-template">
<tr>
	<td id="tdRucCliente_{{idCliente}}">{{ruc}}</td>	
	<td id="tdNombreCliente_{{idCliente}}">{{nombre}}</td>
	<td id="tdDireccionCliente_{{idCliente}}">{{direccion}}</td>
	<td>
		<a id="btnEditarCliente_{{idCliente}}" class="btn btn-default btn-sm eventBtn" onclick="editarCliente({{idCliente}});" ><i class="fa fa-pencil"></i> Editar </a>
		<a id="btnBorrarCliente_{{idCliente}}" class="btn btn-default btn-sm eventBtn" onclick="eliminarCliente({{idCliente}});" ><i class="fa fa-trash"></i> Borrar </a>
	</td>
</tr>
</script>