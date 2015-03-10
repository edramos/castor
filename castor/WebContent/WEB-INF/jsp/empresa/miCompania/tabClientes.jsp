<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
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
			<tr>
				<td><span class="font-blue-hoki">Mineras Asociadas</span></td>
				<td>
					<a id="btnEditarCliente" class="btn btn-default btn-sm eventBtn"><i class="fa fa-pencil"></i> Editar </a>
					<a id="btnBorrarCliente" class="btn btn-default btn-sm eventBtn"><i class="fa fa-trash"></i> Borrar </a>
				</td>
			</tr>
			<tr>
				<td><span class="font-blue-hoki">Desarrollo Carreteros</span></td>
				<td> 
					<a id="btnEditarCliente" class="btn btn-default btn-sm eventBtn"><i class="fa fa-pencil"></i> Editar </a>
					<a id="btnBorrarCliente" class="btn btn-default btn-sm eventBtn"><i class="fa fa-trash"></i> Borrar </a>
				</td>
			</tr>
			
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
			
			<form:form id="frmCrearClienteAjax" action="ajaxCrearCliente" method="post" commandName="cliente">
				<div class="input-group col-md-6">
					<input type="text" class="form-control" id="txtNombre" name="nombre" placeholder="Nombre Cliente">
				</div>
			</form:form>
			
			</div>
		</div>
	</div>
</div>
