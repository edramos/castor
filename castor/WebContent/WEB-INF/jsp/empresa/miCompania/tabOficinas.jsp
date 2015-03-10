<div class="row">
	<div class="col-md-12">
		<!-- BEGIN PORTLET-->
		<div id="oficinasInit" class="portlet box blue-hoki">
			<div class="portlet-title">
				<div class="caption">Oficinas</div>
				<div class="actions">
					<a id="btnNuevaOfi" class="btn btn-default btn-sm eventBtn"><i class="fa fa-plus"></i> Nueva </a>
					<a class="btn btn-icon-only btn-default btn-sm fullscreen" href="#" data-original-title="" title="">
					</a>
				</div>
			</div>
			<div class="portlet-body">
				<div id="map-container" class="gmaps"></div>
			</div>
		</div>
		<!-- END PORTLET-->
		
		
		
		<!-- BEGIN GEOCODING PORTLET-->
		<div id="oficinasNueva" class="portlet box blue-hoki" style="display: none;">
			<div class="portlet-title">
				<div class="caption">Oficinas</div>
				<div class="actions">
					<a id="btnGrabarOfi" class="btn green-meadow btn-sm eventBtn"><i class="fa fa-check"></i> Grabar </a>
					<a id="btnCancelarOfi" class="btn red-sunglo btn-sm eventBtn"><i class="fa fa-close"></i> Cancelar </a>
					<a class="btn btn-icon-only btn-default btn-sm fullscreen" href="#" data-original-title="" title="">
					</a>
				</div>
			</div>
			<div class="portlet-body">
			<div class="row">
				<div class="col-md-12">
				<form class="form-inline margin-bottom-10" action="#">
					<div class="input-group col-md-12">
						<input type="text" class="form-control col-md-12" id="gmap_geocoding_address" placeholder="direccion, distrito, ciudad, pais">
						<span class="input-group-btn"><button class="btn blue" id="gmap_geocoding_btn"><i class="fa fa-search"></i></span>
					</div>
				</form>
				</div>
			</div>
			<div id="gmap_geocoding" class="gmaps"></div>
			
			<div class="form-horizontal margin-top-10">
				<div class="form-body">
					<div class="form-group">
						<label class="control-label col-md-2">Nombre Oficina:</label>
						<div class="col-md-8"><input class="form-control" type="text"></div>
					</div>
					<div class="form-group">
						<label class="control-label col-md-2">Telefono:</label>
						<div class="col-md-8"><input class="form-control" type="text"></div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- END GEOCODING PORTLET-->
		
	</div>
</div>