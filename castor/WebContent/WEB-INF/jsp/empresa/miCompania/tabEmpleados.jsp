<style>
.input-circle-left {
    border-radius: 4px 0px 0px 4px !important;
}
.btn-circle-right {
    border-radius: 0px 4px 4px 0px !important;
}
</style>
<div id="empleadoInit" class="portlet box blue-hoki">
	<div class="portlet-title">
		<div class="caption">Empleados</div>
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
			<tbody>
			<tr>
				<td>Eduardo H. Ramos Barrientos</td>
				<td>contacto@simularte.com</td>
				<td>949-546-515</td>
				<td>261-1605</td>
				<td>Administrador</td>
				<td><span class="label label-sm label-success">Enabled </span></td>
				<td>
					<a href="#" class="btn bg-green-meadow btn-sm"><i class="fa fa-pencil"></i></a>
					<a href="#" class="btn red-sunglo btn-sm"><i class="fa fa-trash"></i></a>
				</td>				
			</tr>
			<tr>
				<td>Eduardo H. Ramos Barrientos</td>
				<td>contacto@simularte.com</td>
				<td>949-546-515</td>
				<td>261-1605</td>
				<td>Cobranza</td>
				<td><span class="label label-sm label-info">Pendiente </span></td>
				<td>
					<a href="#" class="btn bg-green-meadow btn-sm"><i class="fa fa-pencil"></i></a>
					<a href="#" class="btn red-sunglo btn-sm"><i class="fa fa-trash"></i></a>
				</td>				
			</tr>
			<tr>
				<td>Eduardo H. Ramos Barrientos</td>
				<td>contacto@simularte.com</td>
				<td>949-546-515</td>
				<td>261-1605</td>
				<td>Proyecto</td>
				<td><span class="label label-sm label-warning">Suspendido </span></td>
				<td>
					<a href="#" class="btn bg-green-meadow btn-sm"><i class="fa fa-pencil"></i></a>
					<a href="#" class="btn red-sunglo btn-sm"><i class="fa fa-trash"></i></a>
				</td>				
			</tr>
			<tr>
				<td>Eduardo H. Ramos Barrientos</td>
				<td>contacto@simularte.com</td>
				<td>949-546-515</td>
				<td>261-1605</td>
				<td>Pagos</td>
				<td><span class="label label-sm label-danger">Disabled </span></td>	
				<td>
					<a href="#" class="btn bg-green-meadow btn-sm"><i class="fa fa-pencil"></i></a>
					<a href="#" class="btn red-sunglo btn-sm"><i class="fa fa-trash"></i></a>
				</td>			
			</tr>
			</tbody>
			</table>
		</div>
	</div>
</div>




