<!DOCTYPE html>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Castor | Orden</title>
<jsp:include page="../comps/headMandatory.jsp"/>
<!-- BEGIN PAGE LEVEL STYLES -->
<link href="assets/global/plugins/jquery-file-upload/blueimp-gallery/blueimp-gallery.min.css" rel="stylesheet"/>
<link href="assets/global/plugins/jquery-file-upload/css/jquery.fileupload.css" rel="stylesheet"/>
<link href="assets/global/plugins/jquery-file-upload/css/jquery.fileupload-ui.css" rel="stylesheet"/>
<link href="assets/global/plugins/fancybox/source/jquery.fancybox.css" rel="stylesheet" type="text/css"/>
<!-- END PAGE LEVEL STYLES -->
</head>

<body class="page-header-fixed page-sidebar-closed-hide-logo page-sidebar-closed-hide-logo">
<jsp:include page="../comps/cabecera.jsp"/>
<div class="clearfix"></div>

<!-- BEGIN CONTAINER -->
<div class="page-container">
<jsp:include page="../comps/menuCostado.jsp"/>
	
<!-- BEGIN CONTENT -->
<div class="page-content-wrapper">
<div class="page-content">
	<div class="row">
		<div class="col-md-12">
		<div class="portlet box blue-hoki">
			<div class="portlet-title">
				<div class="caption"><span id="spnCodigo"></span></div>
				<div id="dynamicActions" class="actions">
					
					<label id="lblOrdenEstado" style="font-size: 16px;"></label>						
					<input id="txtIdOrden" value="<c:out value="${idOrden}"/>"  type="hidden" class="form-control"/>
				</div>
			</div>
			
			<div class="portlet-body" style="min-height: 400px;">
				<div class="tabbable tabs-left">
					<ul class="nav nav-tabs">
						<li class="active">
							<a aria-expanded="true" href="#tab_1_1_1" data-toggle="tab">
							<span class="caption-subject font-blue-madison bold uppercase">General</span></a>
						</li>
						<% if(session.getAttribute("tipo").equals("cliente")){ %>
						    <!-- <li class="">
								<a aria-expanded="false" href="#tab_1_1_2" data-toggle="tab">
								<span class="caption-subject font-blue-madison bold uppercase">Cobros</span></a>
							</li> -->
							<li class="">
								<a aria-expanded="false" href="#tab_1_1_3" data-toggle="tab">
								<span class="caption-subject font-blue-madison bold uppercase">Pagos</span></a>
							</li>
						<%}else{%>
						    <li class="">
								<a aria-expanded="false" href="#tab_1_1_3" data-toggle="tab">
								<span class="caption-subject font-blue-madison bold uppercase">Cobros</span></a>
							</li>
						<% } %>
						
						<li class="">
							<a aria-expanded="false" href="#tab_1_1_4" data-toggle="tab">
							<span class="caption-subject font-blue-madison bold uppercase">Archivos</span></a>
						</li>
					</ul>
				</div>
				
				<!-- BEGIN TABS -->
				<div class="tab-content">
					<div class="tab-pane active" id="tab_1_1_1">
						<jsp:include page="orden/tabGeneral.jsp"/>
					</div>
					<div class="tab-pane" id="tab_1_1_2">
						<jsp:include page="orden/tabCobros.jsp"/>
					</div>
					<div class="tab-pane" id="tab_1_1_3">
						<jsp:include page="orden/tabPagos.jsp"/>
					</div>
					<div class="tab-pane" id="tab_1_1_4">
						<jsp:include page="orden/tabArchivos.jsp"/>
					</div>
				</div>
				<!-- END TABS -->
				
			</div>
		</div>
	</div>
	</div>
</div>
</div>
<!-- END CONTENT -->
</div>
<!-- END CONTAINER -->

<jsp:include page="../comps/footer.jsp"/>
<jsp:include page="../comps/corePlugins.jsp"/>
<!-- BEGIN PAGE LEVEL PLUGINS -->
<script src="assets/global/scripts/metronic.js" type="text/javascript"></script>
<script src="assets/admin/layout4/scripts/layout.js" type="text/javascript"></script>
<script src="assets/admin/layout4/scripts/demo.js" type="text/javascript"></script>
<script src="assets/admin/pages/scripts/form-fileupload.js" type="text/javascript"></script>

<script src="assets/admin/pages/scripts/form-fileupload.js"></script>
<script src="assets/global/plugins/malsup/jquery.form.js" type="text/javascript"></script>
<script src="assets/global/plugins/amcharts/amcharts/amcharts.js" type="text/javascript"></script>
<script src="assets/global/plugins/amcharts/amcharts/serial.js" type="text/javascript"></script>

<!-- BEGIN:File Upload Plugin JS files-->
<!-- The jQuery UI widget factory, can be omitted if jQuery UI is already included -->
<script src="assets/global/plugins/jquery-file-upload/js/vendor/jquery.ui.widget.js"></script>
<!-- The Templates plugin is included to render the upload/download listings -->
<script src="assets/global/plugins/jquery-file-upload/js/vendor/tmpl.min.js"></script>
<!-- The Load Image plugin is included for the preview images and image resizing functionality -->
<script src="assets/global/plugins/jquery-file-upload/js/vendor/load-image.min.js"></script>
<!-- The Canvas to Blob plugin is included for image resizing functionality -->
<script src="assets/global/plugins/jquery-file-upload/js/vendor/canvas-to-blob.min.js"></script>
<!-- blueimp Gallery script -->
<script src="assets/global/plugins/jquery-file-upload/blueimp-gallery/jquery.blueimp-gallery.min.js"></script>
<!-- The Iframe Transport is required for browsers without support for XHR file uploads -->
<script src="assets/global/plugins/jquery-file-upload/js/jquery.iframe-transport.js"></script>
<!-- The basic File Upload plugin -->
<script src="assets/global/plugins/jquery-file-upload/js/jquery.fileupload.js"></script>
<!-- The File Upload processing plugin -->
<script src="assets/global/plugins/jquery-file-upload/js/jquery.fileupload-process.js"></script>
<!-- The File Upload image preview & resize plugin -->
<script src="assets/global/plugins/jquery-file-upload/js/jquery.fileupload-image.js"></script>
<!-- The File Upload audio preview plugin -->
<script src="assets/global/plugins/jquery-file-upload/js/jquery.fileupload-audio.js"></script>
<!-- The File Upload video preview plugin -->
<script src="assets/global/plugins/jquery-file-upload/js/jquery.fileupload-video.js"></script>
<!-- The File Upload validation plugin -->
<script src="assets/global/plugins/jquery-file-upload/js/jquery.fileupload-validate.js"></script>
<!-- The File Upload user interface plugin -->
<script src="assets/global/plugins/jquery-file-upload/js/jquery.fileupload-ui.js"></script>
<!-- The main application script -->
<!-- The XDomainRequest Transport is included for cross-domain file deletion for IE 8 and IE 9 -->
<!--[if (gte IE 8)&(lt IE 10)]>
    <script src="../../assets/global/plugins/jquery-file-upload/js/cors/jquery.xdr-transport.js"></script>
    <![endif]-->
<!-- END:File Upload Plugin JS files-->

<!-- END PAGE LEVEL PLUGINS -->

<!-- BEGIN PAGE LEVEL SCRIPTS -->
<script src="assets/global/plugins/jquery-formatcurrency-master/jquery.formatCurrency.js" type="text/javascript"></script>
<script src="assets/global/plugins/bootstrap-touchspin/bootstrap.touchspin.js" type="text/javascript"></script>
<script src="assets/global/plugins/fancybox/source/jquery.fancybox.pack.js"></script>
<script src="assets/global/plugins/plupload/js/plupload.full.min.js" type="text/javascript"></script>
<!-- END PAGE LEVEL SCRIPTS -->
<script>
var tipo = '<%= session.getAttribute("tipo") %>';
var rol = '<%= session.getAttribute("rol") %>';

jQuery(document).ready(function(){ 
	Metronic.init(); // init metronic core components
	Layout.init(); // init current layout
	Demo.init(); // init demo features
	//FormFileUpload.init();
	
	$(".fancybox-button").fancybox({
		groupAttr: 'data-rel',
        prevEffect: 'none',
        nextEffect: 'none',
        closeBtn: true,
        helpers: {
            title: {
                type: 'inside'
            }
        }
	});
	
	$(document).on('click','.eventBtn', function(e){
		var ajaxUrl = "";
		var idOrden = $('#txtIdOrden').val();
		
		if(this.id == "btnAceptar"){
			ajaxUrl = "aceptar";
		}else{
			ajaxUrl = "rechazar";
		}
		
		$.ajax({
			url: 'ajaxEditarEstadoOrden-' + ajaxUrl + '-' + idOrden,
			type: 'post',
	 		success: function(resultado){ 
	 			$('#lblOrdenEstado').text(resultado);
	 			$('#dynamicActions .eventBtn').remove();
	 		}
		});
	});
});
</script>
<script>
var oferta = 0;
var gastosGen = 0;
var utilBruta = 0;
var utilNeta = 0;

$(document).ready(function(){
	var idOrden = $('#txtIdOrden').val();
	
	extraerInformacionOrden(idOrden); 
	
	listarCuentasCobrar(idOrden);
	listarFacturas("Emitida", idOrden);
	
	listarSubcontratos(idOrden);	
	listarCuentasPagar(idOrden);
	listarFacturas("Recibida", idOrden);
	
	cargarArchivos(idOrden);
	
	$("input#inpFiles").change(function(e){
    	var files = e.target.files;
    	
    	$.each(files, function(i, file){
			var reader = new FileReader();
	
			// Closure to capture the file information.
	    	reader.onload = (function(theFile){
	    		return function(e){	          
	    	    	$('#bodyPreview').append('<tr><td><img src="'+ e.target.result +'" width="64px" height="64px"/></td><td>'+ file.name +'</td>'+
	    	    		'<td>'+ bytesToSize(file.size) +'</td>'+
	    	    		'<td><select class="form-control" name="tipo"><option value="Foto">Foto</option><option value="Video">Video</option></select></td>'+
	    	    		'<td><textarea class="form-control" name="descripcion"></textarea></td></tr>');
				};
			})(file);
	
	    	// Read in the image file as a data URL.
	    	reader.readAsDataURL(file);
    	});
	});
	
	$('#hdnIdEntidad').val(idOrden);
	$('#hdnTipoEntidad').val('Orden');
	
	var bar = $('.bar');
	var percent = $('.percent');
	var status = $('#status');
	
	$('#frmArchivos').ajaxForm({
		beforeSend: function() {
	        status.empty();
	        var percentVal = '0%';
	        bar.width(percentVal);
	        percent.html(percentVal);
	        $('#divProgress').attr('class', 'progress progress-striped active');
	    },
	    uploadProgress: function(event, position, total, percentComplete) {
	        var percentVal = percentComplete + '%';
	        bar.width(percentVal);
	        percent.html(percentVal);
	    },
	    complete: function(xhr) {
	    	$('#divProgress').attr('class', 'progress progress-striped');
	    	$('#bodyPreview').remove();
	    	$('#tblPreview').append('<tbody id="bodyPreview"></tbody></table>');
	        cargarArchivos(idOrden);
	    }
	});

});
</script>
<script>
function bytesToSize(bytes) {
    var sizes = ['Bytes', 'KB', 'MB', 'GB', 'TB'];
    if (bytes == 0) return 'n/a';
    var i = parseInt(Math.floor(Math.log(bytes) / Math.log(1024)));
    if (i == 0) return bytes + ' ' + sizes[i]; 
    return (bytes / Math.pow(1024, i)).toFixed(1) + ' ' + sizes[i];
};
function listarFacturas(tipo, idOrdenTemp){
	$.ajax({
		url: 'cargarFactura-' + tipo + '-' + idOrdenTemp,
		type: 'post',
 		dataType: 'json',
 		data: '',
 		success: function(facturas){ 
 			if(facturas.length != 0){
 				if(tipo == "Emitida"){
 					initFacturasCobrar(facturas);
 				}else{
 					initFacturasPagar(facturas);
 				}
 			}
 		}
	});
}
function cargarArchivos(idOrdenTemp){
	$.ajax({
		url: 'cargarArchivoAjax-' + idOrdenTemp + '-Orden',
		type: 'post',
 		dataType: 'json',
 		data: '',
 		success: function(archivos){ 			
 			initArchivos(archivos);
 		}
	});
}
function extraerInformacionOrden(idOrdenTemp){
	$.ajax({
 		url: 'ajaxObtenerInformacionOrden-cobrar-' + idOrdenTemp,
 		type: 'post',
 		dataType: 'json',
 		data: '',
 		success: function(orden){
 			$('#spnCodigo').text('ORDEN - ' + orden.nombre);
 			$('#lblOrdenEstado').text(orden.estado);
 			
 			if(orden.estado == "Aceptacion Pendiente" && tipo == "cliente" && rol == "Administrador"){
 				$('#dynamicActions').append('<a id="btnAceptar" class="btn green eventBtn"><i class="fa fa-check"></i> Aceptar</a><a id="btnRechazar" class="btn red eventBtn"><i class="fa fa-times"></i> Rechazar</a>');
 			}
 			initOrdenGeneral(orden);
 		}
 	});	
}
function listarCuentasCobrar(idOrdenTemp){
	$.ajax({
 		url: 'ajaxListarCuentas-cobrar-' + idOrdenTemp,
 		type: 'post',
 		dataType: 'json',
 		data: '',
 		success: function(cuentascobrar){
 			initClienteCuentasCobrar(cuentascobrar);	 	        
 		}
 	});
}
function listarSubcontratos(idOrdenTemp){
    $.ajax({
 		url: 'ajaxListarSubcontratos-' + idOrdenTemp,
 		type: 'post',
 		dataType: 'json',
 		data: '',
 		success: function(subcontratos){
 			initOrdenSubcontratos(subcontratos); 	        
 		}
 	});
}
function listarCuentasPagar(idOrdenTemp){
    $.ajax({
 		url: 'ajaxListarCuentas-pagar-' + idOrdenTemp,
 		type: 'post',
 		dataType: 'json',
 		data: '',
 		success: function(cuentaspago){
 			initSubsCuentasPagar(cuentaspago);	 	        
 		},
 		complete: function() {	 			
 			//removeNulls();
  		}
 	});
}
</script>
<script type="text/javascript">
var idOrden = $('#txtIdOrden').val();

/* if(tipo == "empresa"){
AmCharts.loadJSON = function(url){
	if(window.XMLHttpRequest){
		  	// IE7+, Firefox, Chrome, Opera, Safari
			var request = new XMLHttpRequest();
	  }else{
	    	// code for IE6, IE5
	    	var request = new ActiveXObject('Microsoft.XMLHTTP');
	  }
	  request.open('GET', url, false);
	  request.send();

	  // parse adn return the output
	  return eval(request.responseText);
	};
	AmCharts.makeChart("divChartOrden",
		{
			"type": "serial",
			"pathToImages": "http://cdn.amcharts.com/lib/3/images/",
			"categoryField": "fechaOperacion",
			"dataDateFormat": "YYYY-MM-DD",
			"categoryAxis": {
				"parseDates": true
			},
			"chartCursor": {},
			"chartScrollbar": {},
			"trendLines": [],
			"graphs": [
				{
					"bullet": "round",
					"id": "AmGraph-1",
					"title": "Ctas x Cobrar",
					"valueField": "montoCobrar"
				},
				{
					"bullet": "square",
					"id": "AmGraph-2",
					"title": "Ctas x Pagar",
					"valueField": "montoPagar"
				}
			],
			"guides": [],
			"allLabels": [],
			"balloon": {},
			"dataProvider": AmCharts.loadJSON('getChartOrden-' + idOrden)
		}
	);
}else{
	$('#divChartOrden').hide();
} */
</script>
</body>
</html>