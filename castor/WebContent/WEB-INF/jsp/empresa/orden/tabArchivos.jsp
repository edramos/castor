<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<div class="portlet-body">
<div class="row">
	<div class="col-md-12">

	<form:form id="frmArchivos" action="subirArchivoAjax" method="post" commandName="arregloArchivos" enctype="multipart/form-data">
		<span class="btn green fileinput-button"><i class="fa fa-plus"></i><span> Agregar Archivos... </span>
		<input id="inpFiles" type="file" name="files" multiple/></span>
		<button type="submit" class="btn blue start"><i class="fa fa-upload"></i><span> Subir</span></button>
		<input id="hdnIdEntidad" type="hidden" name="idEntidad"/><input id="hdnTipoEntidad" type="hidden" name="tipoEntidad"/>
		<p></p>
		
		<table id="tblPreview" class="table table-bordered">
		<tbody id="bodyPreview"></tbody>
		</table>
	</form:form>
	
	<div id="divProgress" class="progress progress-striped active">
		<div class="bar progress-bar progress-bar-success" role="progressbar" aria-valuenow="40" aria-valuemin="0" aria-valuemax="100" style="width: 0%">
			<span class="percent">0%</span>
		</div>
	</div>
	
	
	<div class="table-responsive">
		<table class="table table-bordered table-hover">
			<thead>
				<tr class="heading">
					<th width="10%">Archivo</th><th width="10%">Nombre</th><th width="10%">Tama&ntilde;o</th><th>Tipo</th><th>Descripcion</th>
				</tr>
			</thead>
			<tbody id="viewArchivos"></tbody>
		</table>
	</div>
	
	<%-- <form:form id="fileupload" action="subirArchivoAjax" modelAttribute="arregloArchivos" method="POST" enctype="multipart/form-data">
		<!-- The fileupload-buttonbar contains buttons to add/delete files and start/cancel the upload -->
		<div class="row fileupload-buttonbar">
			<div class="col-lg-7">
				<!-- The fileinput-button span is used to style the file input field as button -->
				<span class="btn green fileinput-button"><i class="fa fa-plus"></i><span>Agregar Archivos... </span><input type="file" name="files" multiple="multiple"></span>
				<button type="submit" class="btn blue start"><i class="fa fa-upload"></i><span>Subir </span></button>
				<button type="reset" class="btn warning cancel"><i class="fa fa-ban-circle"></i><span>Cancelar </span></button>
				<button type="button" class="btn red delete"><i class="fa fa-trash"></i><span>Delete </span></button>
				<input type="checkbox" class="toggle">
				<!-- The global file processing state -->
				<span class="fileupload-process">
				</span>
			</div>
			<!-- The global progress information -->
			<div class="col-lg-5 fileupload-progress fade">
				<!-- The global progress bar -->
				<div class="progress progress-striped active" role="progressbar" aria-valuemin="0" aria-valuemax="100">
					<div class="progress-bar progress-bar-success" style="width:0%;">
					</div>
				</div>
				<!-- The extended global progress information -->
				<div class="progress-extended">
					 &nbsp;
				</div>
			</div>
		</div>
		<!-- The table listing the files available for upload/download -->
		<table role="presentation" class="table table-striped clearfix">
		<tbody class="files">
		</tbody>
		</table>
		<input id="hdnIdEntidad" type="hidden" name="idEntidad"/><input id="hdnTipoEntidad" type="hidden" name="tipoEntidad"/>
	</form:form> --%>
	
	
	</div>
</div>
</div>

<script id="template-upload" type="text/x-tmpl">
{% for (var i=0, file; file=o.files[i]; i++) { %}
    <tr class="template-upload fade">
        <td>
            <span class="preview"></span>
        </td>
		<td>
			<select name="tipo"><option value="Foto">Foto</option><option value="Video">Video</option></select>
		</td>
        <td>
            <p class="name">{%=file.name%}</p>
            <strong class="error text-danger label label-danger"></strong>
        </td>
        <td>
            <p class="size">Processing...</p>
            <div class="progress progress-striped active" role="progressbar" aria-valuemin="0" aria-valuemax="100" aria-valuenow="0">
            <div class="progress-bar progress-bar-success" style="width:0%;"></div>
            </div>
        </td>
        <td>
            {% if (!i && !o.options.autoUpload) { %}
                <button class="btn blue start" disabled>
                    <i class="fa fa-upload"></i>
                    <span>Start</span>
                </button>
            {% } %}
            {% if (!i) { %}
                <button class="btn red cancel">
                    <i class="fa fa-ban"></i>
                    <span>Cancel</span>
                </button>
            {% } %}
        </td>
    </tr>
{% } %}
</script>
<!-- The template to display files available for download -->
<script id="template-download" type="text/x-tmpl">
	{% for (var i=0, file; file=o.files[i]; i++) { %}
            <tr class="template-download fade">
                <td>
                    <span class="preview">
                        {% if (file.thumbnailUrl) { %}
                            <a href="{%=file.url%}" title="{%=file.name%}" download="{%=file.name%}" data-gallery><img src="{%=file.thumbnailUrl%}"></a>
                        {% } %}
                    </span>
                </td>
                <td>
                    <p class="name">
                        {% if (file.url) { %}
                            <a href="{%=file.url%}" title="{%=file.name%}" download="{%=file.name%}" {%=file.thumbnailUrl?'data-gallery':''%}>{%=file.name%}</a>
                        {% } else { %}
                            <span>{%=file.name%}</span>
                        {% } %}
                    </p>
                    {% if (file.error) { %}
                        <div><span class="label label-danger">Error</span> {%=file.error%}</div>
                    {% } %}
                </td>
                <td>
                    <span class="size">{%=o.formatFileSize(file.size)%}</span>
                </td>
                <td>
                    {% if (file.deleteUrl) { %}
                        <button class="btn red delete btn-sm" data-type="{%=file.deleteType%}" data-url="{%=file.deleteUrl%}"{% if (file.deleteWithCredentials) { %} data-xhr-fields='{"withCredentials":true}'{% } %}>
                            <i class="fa fa-trash-o"></i>
                            <span>Delete</span>
                        </button>
                        <input type="checkbox" name="delete" value="1" class="toggle">
                    {% } else { %}
                        <button class="btn yellow cancel btn-sm">
                            <i class="fa fa-ban"></i>
                            <span>Cancel</span>
                        </button>
                    {% } %}
        	</td>
    	</tr>
	{% } %}
</script>


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
	<td><a href="{{url}}" class="fancybox-button" data-rel="fancybox-button" rel='gallery' title="{{sDescripcion}}"><img class="img-responsive" src="{{url}}" alt=""></a></td>
	<td>{{nombre}}</td>
	<td>{{tamanio}}</td>
	<td>{{sTipo}}</td>
	<td>{{sDescripcion}}</td>
</tr>
</script>