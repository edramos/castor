<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<div class="portlet-body">
<div class="row">
	<div class="col-md-12">

	<form:form id="frmArchivos" action="subirArchivoAjax" method="post" commandName="arregloArchivos" enctype="multipart/form-data">
		<span class="btn green fileinput-button"><i class="fa fa-plus"></i><span> Agregar Archivos... </span><input type="file" name="files" multiple/></span>
		<button type="submit" class="btn blue start"><i class="fa fa-upload"></i><span> Subir</span></button>
		<input id="hdnIdEntidad" type="hidden" name="idEntidad"/><input id="hdnTipoEntidad" type="hidden" name="tipoEntidad"/>
	</form:form>
	<br/>
	<div id="divProgress" class="progress progress-striped active">
		<div class="bar progress-bar progress-bar-success" role="progressbar" aria-valuenow="40" aria-valuemin="0" aria-valuemax="100" style="width: 0%">
			<span class="percent">0%</span>
		</div>
	</div>
	
	
	<div class="table-responsive">
		<table class="table table-bordered table-hover">
			<thead>
				<tr class="heading">
					<th width="10%">Archivo</th><th width="10%">Nombre</th><th width="10%">Tama&ntilde;o</th><th>Descripcion</th>
				</tr>
			</thead>
			<tbody id="viewArchivos"></tbody>
		</table>
	</div>
	
	</div>
</div>
</div>
<script>
function initArchivos(archivos){
	var html = '';
		
	$.each(archivos, function(i, archivo){
		var source = $("#templateArchivos").html();
		var template = Handlebars.compile(source);
		html += template(archivo);
	});

	$('#viewArchivos').html(html);	
}
</script>
<script id="templateArchivos" type="text/x-handlebars-template">
<tr>
	<td><a href="{{url}}" class="fancybox-button" data-rel="fancybox-button" rel='gallery'><img class="img-responsive" src="{{url}}" alt=""></a></td>
	<td>{{nombre}}</td>
	<td>{{tamanio}}</td>
	<td>{{descripcion}}</td>
</tr>
</script>