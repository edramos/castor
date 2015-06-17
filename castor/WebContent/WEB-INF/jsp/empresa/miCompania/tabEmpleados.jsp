<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<style>
.input-circle-left {border-radius: 4px 0px 0px 4px !important;}
.btn-circle-right {border-radius: 0px 4px 4px 0px !important;}
</style>
<script>
function crearEmpleado(){
	$.ajax({
 		url: 'ajaxCrearEmpleado',
 		type: 'post',
 		dataType: 'json',
 		data: $('#frmCrearEmpleado').serialize(),
 		success: function(resultado){
 			$('#txtPrimerNombreEmp').val('');
 			$('#txtSegundoNombreEmp').val('');
 			$('#txtApellidoPaternoEmp').val('');
 			$('#txtApellidoMaternoEmp').val('');
 			$('#txtEmailEmp').val('');
 			$('#txtCelularPrimarioEmp').val('');
 			$('#txtTelefonoCasaEmp').val('');
 			$('#sltRolEmp').val('');
 			listarEmpleados(); 			
 		}
 	});	
}

//Open View Form Cliente
function editarEmpleado(idPerfil){
	$('#empleadoInit').hide();
	$('#empleadoModificar').show();
	
	$('#txtIdPerfilEmp_Edit').val(idPerfil);	
	
	$('#txtPrimerNombreEmp_Edit').val($('#spnPrimerNombre_'+idPerfil).text());
	$('#txtSegundoNombreEmp_Edit').val($('#spnSegundoNombre_'+idPerfil).text());
	$('#txtApellidoPaternoEmp_Edit').val($('#spnApellidoPaterno_'+idPerfil).text());
	$('#txtApellidoMaternoEmp_Edit').val($('#spnApellidoMaterno_'+idPerfil).text());
	$('#txtEmailEmp_Edit').val($('#spnEmail_'+idPerfil).text());
	$('#txtCelularPrimarioEmp_Edit').val($('#spnCelularPrimario_'+idPerfil).text());
	$('#txtTelefonoCasaEmp_Edit').val($('#spnTelefonoCasa_'+idPerfil).text());
	$('#sltRolEmp_Edit').val($('#spnRol_'+idPerfil).text());
}
function modificarEmpleado(){
	$.ajax({
 		url: 'ajaxModificarEmpleado',
 		type: 'post',
 		dataType: 'json',
 		data: $('#frmModificarEmpleado').serialize(),
 		success: function(resultado){
 			$('#txtPrimerNombreEmp').val('');
 			$('#txtSegundoNombreEmp').val('');
 			$('#txtApellidoPaternoEmp').val('');
 			$('#txtApellidoMaternoEmp').val('');
 			$('#txtEmailEmp').val('');
 			$('#txtCelularPrimarioEmp').val('');
 			$('#txtTelefonoCasaEmp').val('');
 			$('#sltRolEmp').val('');
 			listarEmpleados(); 			
 		}
 	});	
}

function eliminarEmpleado(idPerfil){
	if(confirm("Esta seguro que desea eliminar este empleado?")){
		$.ajax({
	 		url: 'ajaxEliminarEmpleado-'+idPerfil,
	 		type: 'post',
	 		dataType: 'json',
	 		data: '',
	 		success: function(resultado){
	 			listarEmpleados(); 			
	 		}
	 	});
	}		
}

function listarEmpleados(){
	$('#empleadoCrear').hide();
	$('#empleadoModificar').hide();
	$('#empleadoInit').show();
	var html = '';
    $.ajax({
 		url: 'ajaxListarEmpleados',
 		type: 'post',
 		dataType: 'json',
 		data: '',
 		success: function(empleados){
 			$.each(empleados, function(i, empleado){
	 			var source = $("#templateEmpleados").html();
	 			var template = Handlebars.compile(source);
	 			html += template(empleado);
	 			
 			});		
 			$("#viewEmpleadosHandlerbars").html(html);	        
 		},
 		complete: function() {	 			
 			//removeNulls();
  		}
 	});
}
</script>

<div class="row">
<div class="col-md-12">

<div id="empleadoInit" class="portlet box blue-hoki">
	<div class="portlet-title">
		<div class="caption">Empleados <a id="btnIrCrearEmpleado" class="btn btn-default btn-sm eventBtn"><i class="fa fa-plus"></i> Nuevo </a></div>
		<div id="dynamicActions" class="actions">
			
			<div class="inputs">
				<div class="portlet-input input-inline input-medium">
					<div class="input-group">
						<input class="form-control input-circle-left" placeholder="buscar..." type="text">
						<span class="input-group-btn">
						<button class="btn btn-circle-right btn-default" type="submit"><i class="fa fa-search"></i></button>
						</span>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<div class="portlet-body">
		<div class="table-responsive">
			
			<table class="table table-striped table-bordered table-hover">
			<thead>
			<tr class="heading" role="row">
				<th>Nombre</th>
				<th>Email</th>
				<th>Celular</th>
				<th>Telefono</th>
				<th>Rol</th>
				<th>Estado</th>
				<th>Acciones</th>
			</tr>
			</thead>
			<tbody id="viewEmpleadosHandlerbars">
			</tbody>
			</table>
			
		</div>
	</div>
</div>


<div id="empleadoCrear" class="portlet box blue-hoki" style="display: none;">
	<div class="portlet-title">
		<div class="caption">Empleados</div>
		<div id="dynamicActions" class="actions">
			<a id="btnCrearEmpleado" class="btn green-meadow btn-sm eventBtn"><i class="fa fa-check"></i> Grabar </a>
			<a id="btnCancelarEmpleado" class="btn red-sunglo btn-sm eventBtn"><i class="fa fa-close"></i> Cancelar </a>
			<a class="btn btn-icon-only btn-default btn-sm fullscreen" href="#" data-original-title="" title=""></a>
		</div>
	</div>
	
	
	<div class="portlet-body form">
	<form:form id="frmCrearEmpleado" class="form-horizontal" commandName="empleado">
		<div class="form-body">
			
			<div class="row">
			<div class="col-md-12">
				<div class="form-group">
					<div class="col-md-3"><input id="txtPrimerNombreEmp" class="form-control" type="text" name="primerNombre" placeholder="Primer Nombre"></div>
					<div class="col-md-3"><input id="txtSegundoNombreEmp" class="form-control" type="text" name="segundoNombre" placeholder="Segundo Nombre"></div>
					<div class="col-md-3"><input id="txtApellidoPaternoEmp" class="form-control" type="text" name="apellidoPaterno" placeholder="Apellido Paterno"></div>
					<div class="col-md-3"><input id="txtApellidoMaternoEmp" class="form-control" type="text" name="apellidoMaterno" placeholder="Apellido Materno"></div>
				</div>
			</div>
			</div>
			
			<div class="row">
			<div class="col-md-12">	
				<div class="form-group">
					<div class="col-md-3"><input id="txtEmailEmp" class="form-control" type="text" name="email" placeholder="Email"></div>
					<div class="col-md-3"><input id="txtCelularPrimarioEmp" class="form-control" type="text" name="celularPrimario" placeholder="Celular"></div>
					<div class="col-md-3"><input id="txtTelefonoCasaEmp" class="form-control" type="text" name="telefonoCasa" placeholder="Telefono"></div>
					<div class="col-md-3">
						<select id="sltRolEmp" class="form-control" name="rol">
							<option value="Administrador">Administrador</option>
							<option value="Coordinador">Coordinador</option>
							<option value="Supervisor">Supervisor</option>
							<option value="Contable">Contable</option>
						</select>
					</div>
				</div>	
				</div>
			</div>
			
			
			
		</div>
	</form:form>
	</div>
	
</div>


<div id="empleadoModificar" class="portlet box blue-hoki" style="display: none;">
	<div class="portlet-title">
		<div class="caption">Empleados</div>
		<div id="dynamicActions" class="actions">
			<a id="btnModificarEmpleado" class="btn green-meadow btn-sm eventBtn"><i class="fa fa-check"></i> Grabar </a>
			<a id="btnCancelarEmpleado" class="btn red-sunglo btn-sm eventBtn"><i class="fa fa-close"></i> Cancelar </a>
			<a class="btn btn-icon-only btn-default btn-sm fullscreen" href="#" data-original-title="" title=""></a>
		</div>
	</div>
	<div class="portlet-body">
		<div class="form-horizontal">
			<div class="form-body">
			
			<form:form id="frmModificarEmpleado" commandName="empleado">
				<div class="form-group" style="display:none">
					<label class="control-label col-md-2">Id Perfil:</label>
					<div class="col-md-8"><input id="txtIdPerfilEmp_Edit" class="form-control" type="text" name="idPerfil"></div>
				</div>
				<div class="form-group">
					<label class="control-label col-md-2">Primer Nombre:</label>
					<div class="col-md-8"><input id="txtPrimerNombreEmp_Edit" class="form-control" type="text" name="primerNombre"></div>
				</div>
				<div class="form-group">
					<label class="control-label col-md-2">Segundo Nombre:</label>
					<div class="col-md-8"><input id="txtSegundoNombreEmp_Edit" class="form-control" type="text" name="segundoNombre"></div>
				</div>
				<div class="form-group">
					<label class="control-label col-md-2">Apellido Paterno:</label>
					<div class="col-md-8"><input id="txtApellidoPaternoEmp_Edit" class="form-control" type="text" name="apellidoPaterno"></div>
				</div>
				<div class="form-group">
					<label class="control-label col-md-2">Apellido Materno:</label>
					<div class="col-md-8"><input id="txtApellidoMaternoEmp_Edit" class="form-control" type="text" name="apellidoMaterno"></div>
				</div>
				<div class="form-group">
					<label class="control-label col-md-2">Email:</label>
					<div class="col-md-8"><input id="txtEmailEmp_Edit" class="form-control" type="text" name="email"></div>
				</div>
				<div class="form-group">
					<label class="control-label col-md-2">Celular:</label>
					<div class="col-md-8"><input id="txtCelularPrimarioEmp_Edit" class="form-control" type="text" name="celularPrimario"></div>
				</div>
				<div class="form-group">
					<label class="control-label col-md-2">Telefono:</label>
					<div class="col-md-8"><input id="txtTelefonoCasaEmp_Edit" class="form-control" type="text" name="telefonoCasa"></div>
				</div>
				<div class="form-group">
					<label class="control-label col-md-2">Rol:</label>
					<div class="col-md-8">
						<select id="sltRolEmp_Edit" class="form-control" name="rol">
							<option value="Administrador">Administrador</option>
							<option value="R1">R1</option>
							<option value="R2">R2</option>
							<option value="R3">R3</option>
						</select>
					</div>
				</div>
			</form:form>
			
			</div>
		</div>
	</div>
</div>

</div>
</div>
<script id="templateEmpleados" type="text/x-handlebars-template">
	<tr>
		<td><span id="spnPrimerNombre_{{idPerfil}}">{{primerNombre}}</span> <span id="spnSegundoNombre_{{idPerfil}}">{{segundoNombre}}</span> <span id="spnApellidoPaterno_{{idPerfil}}">{{apellidoPaterno}}</span> <span id="spnApellidoMaterno_{{idPerfil}}">{{apellidoMaterno}}</span></td>
		<td><span id="spnEmail_{{idPerfil}}">{{email}}</span></td>
		<td><span id="spnCelularPrimario_{{idPerfil}}">{{celularPrimario}}</span></td>
		<td><span id="spnTelefonoCasa_{{idPerfil}}">{{telefonoCasa}}</span></td>
		<td><span id="spnRol_{{idPerfil}}">{{rol}}</span></td>
		<td><span class="label label-sm label-success">{{estado}}</span></td>	
		<td>
			<a id="btnEditarEmpleado_{{idPerfil}}" class="btn bg-green-meadow btn-sm" onclick="editarEmpleado({{idPerfil}});" ><i class="fa fa-pencil"></i></a>
			<a id="btnBorrarEmpleado_{{idPerfil}}" class="btn red-sunglo btn-sm" onclick="eliminarEmpleado({{idPerfil}});" ><i class="fa fa-trash"></i></a>
		</td>			
	</tr>
</script>