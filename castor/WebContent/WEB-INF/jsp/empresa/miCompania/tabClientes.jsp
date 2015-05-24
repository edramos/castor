<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<script>
/* function crearCliente(){
	$.ajax({
 		url: 'ajaxCrearCliente',
 		type: 'post',
 		dataType: 'json',
 		data: $('#frmCrearCliente').serialize(),
 		success: function(resultado){
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
} */
</script>
<script>
function listarClientes(){
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
 			TableEditable.init();
 		},
 	});
}
</script>



<div class="row">
	<div class="col-md-12">
		<!-- BEGIN EXAMPLE TABLE PORTLET-->
		<div class="portlet box blue-hoki">
			<div class="portlet-title">
				<div class="caption"><i class="fa fa-edit"></i>Clientes</div>
				<div class="tools">
					<a href="javascript:;" class="collapse"></a>
					<a href="#portlet-config" data-toggle="modal" class="config"></a>
					<a href="javascript:;" class="reload"></a>
				</div>
			</div>
			<div id="divPortletBody" class="portlet-body">
				<div class="table-toolbar">
					<div class="row">
						<div class="col-md-6">
							<div class="btn-group">
								<button id="sample_editable_1_new" class="btn green-meadow">Nuevo <i class="fa fa-plus"></i></button>
							</div>
						</div>
						<div class="col-md-6">
							<div class="btn-group pull-right">
								<button class="btn dropdown-toggle" data-toggle="dropdown">Tools <i class="fa fa-angle-down"></i></button>
								<ul class="dropdown-menu pull-right">
									<li><a href="#">Print </a></li>
									<li><a href="#">Save as PDF </a></li>
									<li><a href="#">Export to Excel </a></li>
								</ul>
							</div>
						</div>
					</div>
				</div>
				
				
				<table class="table table-striped table-hover table-bordered" id="sample_editable_1">
				<thead>
				<tr>
					<th></th><th width="10%">RUC</th><th>Nombre</th><th width="30%">Direccion</th><th></th><th></th>
				</tr>
				</thead>
				<tbody id="viewClientesHandlerbars">
				</tbody>
				</table>
				
				
				<div id="divFormEditarCliente"></div>
				
			</div>
		</div>
		<!-- END EXAMPLE TABLE PORTLET-->
	</div>
</div>

<script id="templateClientes" type="text/x-handlebars-template">
<tr>
	<td>{{idCliente}}</td>
	<td id="tdRucCliente_{{idCliente}}">{{ruc}}</td>	
	<td id="tdNombreCliente_{{idCliente}}">{{nombre}}</td>
	<td id="tdDireccionCliente_{{idCliente}}">{{direccion}}</td>
	<td><a class="edit" href="javascript:;">Editar </a></td>
	<td><a class="delete" href="javascript:;">Borrar </a></td>
</tr>
</script>