<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<script type="text/javascript">
function extraerInformacionEmpresa(){
	$.ajax({
 		url: 'ajaxExtraerInformacionEmpresa',
 		type: 'post',
 		dataType: 'json',
 		data: '',
 		success: function(empresa){
 			if(empresa.nombre!=null){
 				$('#spnNombreEmpr').text(empresa.nombre);	
 			}
 			if(empresa.ruc!=null){
 				$('#spnRucEmpr').text(empresa.ruc);
 			}
 			if(empresa.website!=null){
 				$('#spnWebEmpr').text(empresa.website);
 			}
 			if(empresa.facebook!=null){
 				$('#spnFacebookEmpr').text(empresa.facebook);
 			}
 					
 			//
 			$('#txtNombreEmpr').val(empresa.nombre);
 			$('#txtRucEmpr').val(empresa.ruc);
 			$('#txtWebEmpr').val(empresa.website);
 			$('#txtFacebookEmpr').val(empresa.facebook);
 		}
 	});	
}


function modificarEmpresa(){
	$.ajax({
 		url: 'ajaxModificarEmpresa',
 		type: 'post',
 		dataType: 'json',
 		data: $('#frmModificarEmpresa').serialize(),
 		success: function(resultado){
 			$('#informacionEdit').hide();
			$('#informacionInit').show();
 			extraerInformacionEmpresa(); 			
 		}
 	});	
}

</script>
<div id="informacionInit" class="portlet box blue-hoki">
	<div class="portlet-title">
		<div class="caption">Informacion</div>
		<div id="dynamicActions" class="actions">
			<a id="btnEditarInfo" class="btn btn-default btn-sm eventBtn"><i class="fa fa-pencil"></i> Editar </a>
			<a class="btn btn-icon-only btn-default btn-sm fullscreen" href="#" data-original-title="" title=""></a>
		</div>
	</div>
	
	<div class="portlet-body">
	
		<table class="table table-scrollable table-bordered">
			<tr>
				<td><span class="font-blue-hoki">Nombre Empresa</span></td>
				<td id="spnNombreEmpr"></td>
			</tr>
			<tr>
				<td><span class="font-blue-hoki">RUC</span></td>
				<td id="spnRucEmpr"></td>
			</tr>
			<!-- <tr>
				<td><span class="font-blue-hoki">Rubro</span></td>
				<td>Servicios Graficos</td>
			</tr> -->
			<tr>
				<td><span class="font-blue-hoki">Web</span></td>
				<td id="spnWebEmpr"></td>
			</tr>
			<tr>
				<td><span class="font-blue-hoki">Facebook</span></td>
				<td id="spnFacebookEmpr"></td>
			</tr>
		</table>

	</div>
</div>	


<div id="informacionEdit" class="portlet box blue-hoki" style="display: none;">
	<div class="portlet-title">
		<div class="caption">Informacion</div>
		<div id="dynamicActions" class="actions">
			<a id="btnGrabarInfo" class="btn green-meadow btn-sm eventBtn"><i class="fa fa-check"></i> Grabar </a>
			<a id="btnCancelarInfo" class="btn red-sunglo btn-sm eventBtn"><i class="fa fa-close"></i> Cancelar </a>
			<a class="btn btn-icon-only btn-default btn-sm fullscreen" href="#" data-original-title="" title=""></a>
		</div>
	</div>
	<div class="portlet-body">
		<div class="form-horizontal">
			<div class="form-body">
			<form:form id="frmModificarEmpresa" commandName="empresa">
				<div class="form-group">
					<label class="control-label col-md-2">Nombre Empresa:</label>
					<div class="col-md-8"><input id="txtNombreEmpr" class="form-control" type="text" name="nombre"></div>
				</div>
				<div class="form-group">
					<label class="control-label col-md-2">RUC:</label>
					<div class="col-md-8"><input id="txtRucEmpr" class="form-control" type="text" name="ruc"></div>
				</div>
				<!-- <div class="form-group">
					<label class="control-label col-md-2">Rubro:</label>
					<div class="col-md-8" style="padding-left: 32px;">
						<div class="skin skin-flat">	
							<div class="form-group">
								<div class="input-group">
									<div class="icheck-list">
										<label><input type="checkbox" class="icheck" data-checkbox="icheckbox_flat-grey"> Servicios Graficos </label>
										<label><input type="checkbox" class="icheck" data-checkbox="icheckbox_flat-grey"> Metal Mecanica </label>
										<label><input type="checkbox" class="icheck" data-checkbox="icheckbox_flat-grey"> Calzado </label>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div> -->
				<div class="form-group">
					<label class="control-label col-md-2">Website:</label>
					<div class="col-md-8"><input id="txtWebsiteEmpr" class="form-control" type="text" name="website"></div>
				</div>
				<div class="form-group">
					<label class="control-label col-md-2">Facebook:</label>
					<div class="col-md-8"><input id="txtFacebookEmpr" class="form-control" type="text" name="facebook"></div>
				</div>
				</form:form>
			</div>
		</div>
	</div>
</div>		
		
		
<!-- <div class="portlet light bordered form-fit">
	<div class="portlet-body form">
		BEGIN FORM
		<div class="form-horizontal ">
			<div class="form-body">
				<div class="form-group">
					<label class="control-label col-md-2">Nombre Empresa:</label>
					<div class="col-md-8">
						<input class="form-control" type="text">
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-md-2">Rubro:</label>
					<div class="col-md-8" style="padding-left: 32px;">
						<div class="skin skin-flat">	
							<div class="form-group">
								<div class="input-group">
									<div class="icheck-list">
										<label><input type="checkbox" class="icheck" data-checkbox="icheckbox_flat-grey"> Servicios Graficos </label>
										<label><input type="checkbox" class="icheck" data-checkbox="icheckbox_flat-grey"> Metal Mecanica </label>
										<label><input type="checkbox" class="icheck" data-checkbox="icheckbox_flat-grey"> Calzado </label>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-md-2">Website:</label>
					<div class="col-md-8">
						<input class="form-control" type="text">
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-md-2">Facebook:</label>
					<div class="col-md-8">
						<input class="form-control" type="text">
					</div>
				</div>
			</div>
			<div class="portlet light">
			<div class="portlet-body">
				<div id="map-container" class="gmaps"></div>
			</div>
		</div>
			<div class="form-actions right" style="padding-right: 20px;">
				<button type="submit" class="btn blue"><i class="fa fa-check"></i> Grabar</button>
				<button type="button" class="btn red"><i class="fa fa-times"></i> Cancelar</button>
			</div>
		</div>
		END FORM
	</div>
</div> -->