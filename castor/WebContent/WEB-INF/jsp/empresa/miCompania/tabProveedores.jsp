<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<script>
function crearProveedor(){
	$.ajax({
 		url: 'ajaxCrearProveedor',
 		type: 'post',
 		dataType: 'json',
 		data: $('#frmCrearProveedor').serialize(),
 		success: function(resultado){
 			//$('#txtNombreProv').val('');
 			borrarDatos();
 			listarProveedores(); 			
 		}
 	});	
}
function editarProveedor(idProveedor){
	$('#proveedorInit').hide();
	$('#proveedorModificar').show();
	$('#txtIdProveedorE').val(idProveedor);
	$('#txtRucProvE').val($('#tdRucProv_'+idProveedor).text());
	$('#txtNombreProvE').val($('#tdNombreProv_'+idProveedor).text());
	$('#txtDireccionProvE').val($('#tdDireccionProv_'+idProveedor).text());
}
function modificarProveedor(){
	$.ajax({
 		url: 'ajaxModificarProveedor',
 		type: 'post',
 		dataType: 'json',
 		data: $('#frmModificarProveedor').serialize(),
 		beforeSend: function(){
 			var formy = $('#frmModificarProveedor').serialize();
 			//alert(formy);
 		},
 		success: function(resultado){
 			$('#txtNombreProvE').val('');
 			listarProveedores(); 			
 		}
 	});	
}
function eliminarProveedor(idProveedor){
	if(confirm("Esta seguro que desea eliminar este proveedor?")){
		$.ajax({
	 		url: 'ajaxEliminarProveedor-'+idProveedor,
	 		type: 'post',
	 		dataType: 'json',
	 		data: '',
	 		success: function(resultado){
	 			$('#txtNombreProvE').val('');
	 			listarProveedores(); 			
	 		}
	 	});
	}		
}
function listarProveedores(){
	$('#proveedorCrear').hide();
	$('#proveedorModificar').hide();
	$('#proveedorInit').show();
	var html = '';
    $.ajax({
 		url: 'ajaxListarProveedores',
 		type: 'post',
 		dataType: 'json',
 		data: '',
 		success: function(proveedores){
 			$.each(proveedores, function(i, proveedor){
	 			var source = $("#templateProveedores").html();
	 			var template = Handlebars.compile(source);
	 			html += template(proveedor);	 			
 			});
 			
 			$("#viewProveedoresHandlerbars").html(html);	        
 		},
 		complete: function() {	 			
 			//removeNulls();
  		}
 	});
}

</script>


<div id="proveedorInit" class="portlet box blue-hoki">
	<div class="portlet-title">
		<div class="caption">Proveedores</div>
		<div id="dynamicActions" class="actions">
			<a id="btnIrCrearProveedor" class="btn btn-default btn-sm eventBtn"><i class="fa fa-plus"></i> Crear </a>
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
			<tbody id="viewProveedoresHandlerbars">
			</tbody>
			</table>
		</div>
	</div>
</div>


<div id="proveedorCrear" class="portlet box blue-hoki" style="display: none;">
	<div class="portlet-title">
		<div class="caption">Proveedores</div>
		<div id="dynamicActions" class="actions">
			<a id="btnCrearProveedor" class="btn green-meadow btn-sm eventBtn"><i class="fa fa-check"></i> Grabar </a>
			<a id="btnCancelarProveedor" class="btn red-sunglo btn-sm eventBtn"><i class="fa fa-close"></i> Cancelar </a>
			<a class="btn btn-icon-only btn-default btn-sm fullscreen" href="#" data-original-title="" title=""></a>
		</div>
	</div>
	<div class="portlet-body">
		<div class="form-body">
			<form:form id="frmCrearProveedor" commandName="proveedor">
			<div class="row">
				<div class="col-md-2">
					<input type="text" class="form-control" id="txtRucProv" name="ruc" placeholder="RUC">
				</div>
				<div class="col-md-4">
					<input type="text" class="form-control" id="txtNombreProv" name="nombre" placeholder="Nombre Proveedor">
				</div>
				<div class="col-md-6">
					<input type="text" class="form-control" id="txtDireccionProv" name="direccion" placeholder="Direccion Provedor">
				</div>
			</div>
			</form:form>
		</div>
	</div>
</div>

<div id="proveedorModificar" class="portlet box blue-hoki" style="display: none;">
	<div class="portlet-title">
		<div class="caption">Proveedores</div>
		<div id="dynamicActions" class="actions">
			<a id="btnModificarProveedor" class="btn green-meadow btn-sm eventBtn"><i class="fa fa-check"></i> Grabar </a>
			<a id="btnCancelarProveedor" class="btn red-sunglo btn-sm eventBtn"><i class="fa fa-close"></i> Cancelar </a>
			<a class="btn btn-icon-only btn-default btn-sm fullscreen" href="#" data-original-title="" title=""></a>
		</div>
	</div>
	<div class="portlet-body">
		<div class="form-body">
			<form:form id="frmModificarProveedor" commandName="proveedor">
			<div class="row">
				<div class="col-md-2">
					<input type="text" class="form-control" id="txtRucProvE" name="ruc" placeholder="RUC">
				</div>
				<div class="col-md-4">
					<input type="hidden" class="form-control" id="txtIdProveedorE" name="idProveedor">
					<input type="text" class="form-control" id="txtNombreProvE" name="nombre" placeholder="Nombre Proveedor">
				</div>
				<div class="col-md-6">
					<input type="text" class="form-control" id="txtDireccionProvE" name="direccion" placeholder="Direccion Provedor">
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
<script id="templateProveedores" type="text/x-handlebars-template">
<tr>
	<td id="tdRucProv_{{idProveedor}}">{{ruc}}</td>	
	<td id="tdNombreProv_{{idProveedor}}">{{nombre}}</td>
	<td id="tdDireccionProv_{{idProveedor}}">{{direccion}}</td>
	<td>
		<a id="btnEditarCliente_{{idProveedor}}" class="btn btn-default btn-sm eventBtn" onclick="editarProveedor({{idProveedor}});" ><i class="fa fa-pencil"></i> Editar </a>
		<a id="btnBorrarCliente_{{idProveedor}}" class="btn btn-default btn-sm eventBtn" onclick="eliminarProveedor({{idProveedor}});" ><i class="fa fa-trash"></i> Borrar </a>
	</td>
</tr>
</script>