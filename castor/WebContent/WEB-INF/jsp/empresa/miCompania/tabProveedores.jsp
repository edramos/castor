<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<script>
/* $(document).ready(function(){
	$("#frmCrearProveedor").validate({
		rules: {
			nombre: {
				required: true,
			}                                   
		},
		messages: {
			nombre: "*"
		},
		submitHandler: function(form){
			crearProveedor();
		}
	});
	
	$("#frmModificarProveedor").validate({
		rules: {
			nombre: {
				required: true,
			}                                   
		},
		messages: {
			nombre: "*"
		},
		submitHandler: function(form){
			modificarProveedor();
		}
	});
});	 */
/* $(document).ready(function(e) {
	
	$(document).on('click','.eventBtn', function(e){
		switch(this.id){
		//PROVEEDOR
		case "btnIrCrearProveedor":
			$('#proveedorInit').hide();
			$('#proveedorCrear').show();
			break;
		case "btnCancelarProveedor":
			$('#proveedorCrear').hide();
			$('#proveedorModificar').hide();
			$('#proveedorInit').show();
			break;
		case "btnCrearProveedor":
			$('#frmCrearProveedor').submit();
			//if($('#txtNombre').val() != ''){
				//crearProveedor();				
			//}
			break;
		case "btnModificarProveedor":
			$('#frmCrearProveedor').submit();
			//if($('#txtNombreProvE').val() != ''){
				//modificarProveedor();				
			//}
			break;		
		}
		
	});
	
	listarProveedores();
}); */

function crearProveedor(){
	$.ajax({
 		url: 'ajaxCrearProveedor',
 		type: 'post',
 		dataType: 'json',
 		data: $('#frmCrearProveedor').serialize(),
 		success: function(resultado){
 			$('#txtNombreProvE').val('');
 			listarProveedores(); 			
 		}
 	});	
}

//Open View Form Proveedor
function editarProveedor(idProveedor){
	$('#proveedorInit').hide();
	$('#proveedorModificar').show();
	$('#txtIdProveedorE').val(idProveedor);
	$('#txtNombreProvE').val($('#spnNombreProv_'+idProveedor).text());
}
function modificarProveedor(){
	$.ajax({
 		url: 'ajaxModificarProveedor',
 		type: 'post',
 		dataType: 'json',
 		data: $('#frmModificarProveedor').serialize(),
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

<script id="templateProveedores" type="text/x-handlebars-template">
	<tr>
		<td>
			<span id="spnNombreProv_{{idProveedor}}" class="font-blue-hoki">{{nombre}}</span>
		</td>
		<td>
			<a id="btnEditarProveedor_{{idProveedor}}" class="btn btn-default btn-sm eventBtn" onclick="editarProveedor({{idProveedor}});" ><i class="fa fa-pencil"></i> Editar </a>
			<a id="btnBorrarProveedor_{{idProveedor}}" class="btn btn-default btn-sm eventBtn" onclick="eliminarProveedor({{idProveedor}});" ><i class="fa fa-trash"></i> Borrar </a>
		</td>
	</tr>
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
	
		<table class="table table-scrollable table-hover">
			<tbody id="viewProveedoresHandlerbars"></tbody>
		</table>

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
		<div class="form-horizontal">
			<div class="form-body">
			
			<form:form id="frmCrearProveedor" commandName="proveedor">
				<div class="input-group col-md-6">
					<input type="text" class="form-control" id="txtNombre" name="nombre" placeholder="Nombre Proveedor">
				</div>
			</form:form>
			
			</div>
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
		<div class="form-horizontal">
			<div class="form-body">
			
			<form:form id="frmModificarProveedor" commandName="proveedor">
				<div class="input-group col-md-6">
					<input type="hidden" class="form-control" id="txtIdProveedorE" name="idProveedor">
					<input type="text" class="form-control" id="txtNombreProvE" name="nombre" placeholder="Nombre Proveedor">
				</div>
			</form:form>
			
			</div>
		</div>
	</div>
</div>
