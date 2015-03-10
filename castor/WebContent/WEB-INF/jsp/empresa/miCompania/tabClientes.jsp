<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<script>
/* $(document).ready(function(){
	$("#frmCrearCliente").validate({
		rules: {
			nombre: {
				required: true,
			}                                   
		},
		messages: {
			nombre: "*"
		},
		submitHandler: function(form){
			crearCliente();
		}
	});
	
	$("#frmModificarCliente").validate({
		rules: {
			nombre: {
				required: true,
			}                                   
		},
		messages: {
			nombre: "*"
		},
		submitHandler: function(form){
			modificarCliente();
		}
	});
});	 */
/* $(document).ready(function(e) {
	
	$(document).on('click','.eventBtn', function(e){
		switch(this.id){
		//CLIENTE
		case "btnIrCrearCliente":
			$('#clienteInit').hide();
			$('#clienteCrear').show();
			break;
		case "btnCancelarCliente":
			$('#clienteCrear').hide();
			$('#clienteModificar').hide();
			$('#clienteInit').show();
			break;
		case "btnCrearCliente":
			$('#frmCrearCliente').submit();
			//if($('#txtNombre').val() != ''){
				//crearCliente();				
			//}
			break;
		case "btnModificarCliente":
			$('#frmCrearCliente').submit();
			//if($('#txtNombreE').val() != ''){
				//modificarCliente();				
			//}
			break;		
		}
		
	});
	
	listarClientes();
}); */

function crearCliente(){
	$.ajax({
 		url: 'ajaxCrearCliente',
 		type: 'post',
 		dataType: 'json',
 		data: $('#frmCrearCliente').serialize(),
 		success: function(resultado){
 			$('#txtNombre').val('');
 			listarClientes(); 			
 		}
 	});	
}

//Open View Form Cliente
function editarCliente(idCliente){
	$('#clienteInit').hide();
	$('#clienteModificar').show();
	$('#txtIdClienteE').val(idCliente);
	$('#txtNombreE').val($('#spnNombre_'+idCliente).text());
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

<script id="templateClientes" type="text/x-handlebars-template">
	<tr>
		<td>
			<span id="spnNombre_{{idCliente}}" class="font-blue-hoki">{{nombre}}</span>
		</td>
		<td>
			<a id="btnEditarCliente_{{idCliente}}" class="btn btn-default btn-sm eventBtn" onclick="editarCliente({{idCliente}});" ><i class="fa fa-pencil"></i> Editar </a>
			<a id="btnBorrarCliente_{{idCliente}}" class="btn btn-default btn-sm eventBtn" onclick="eliminarCliente({{idCliente}});" ><i class="fa fa-trash"></i> Borrar </a>
		</td>
	</tr>
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
	
		<table class="table table-scrollable table-hover">
			<tbody id="viewClientesHandlerbars"></tbody>
		</table>

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
		<div class="form-horizontal">
			<div class="form-body">
			
			<form:form id="frmCrearCliente" commandName="cliente">
				<div class="input-group col-md-6">
					<input type="text" class="form-control" id="txtNombre" name="nombre" placeholder="Nombre Cliente">
				</div>
			</form:form>
			
			</div>
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
		<div class="form-horizontal">
			<div class="form-body">
			
			<form:form id="frmModificarCliente" commandName="cliente">
				<div class="input-group col-md-6">
					<input type="hidden" class="form-control" id="txtIdClienteE" name="idCliente">
					<input type="text" class="form-control" id="txtNombreE" name="nombre" placeholder="Nombre Cliente">
				</div>
			</form:form>
			
			</div>
		</div>
	</div>
</div>
