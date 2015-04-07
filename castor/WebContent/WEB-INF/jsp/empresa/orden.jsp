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
				<div class="caption"><span id="spnCodigo"></span><!-- <span id="spnFechaHora" class="caption-helper"></span> --></div>
				<div id="dynamicActions" class="actions">
					<a id="btnIrCrearCliente" class="label label-info"> Nuevo </a>						
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
						<li class="">
							<a aria-expanded="false" href="#tab_1_1_2" data-toggle="tab">
							<span class="caption-subject font-blue-madison bold uppercase">Subcontratos</span></a>
						</li>
						<li class="">
							<a aria-expanded="false" href="#tab_1_1_3" data-toggle="tab">
							<span class="caption-subject font-blue-madison bold uppercase">Cobros</span></a>
						</li>
						<li class="">
							<a aria-expanded="false" href="#tab_1_1_4" data-toggle="tab">
							<span class="caption-subject font-blue-madison bold uppercase">Pagos</span></a>
						</li>
						<li class="">
							<a aria-expanded="false" href="#tab_1_1_5" data-toggle="tab">
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
						<jsp:include page="orden/tabSubcontratos.jsp"/>
					</div>
					<div class="tab-pane" id="tab_1_1_3">
						<jsp:include page="orden/tabCobros.jsp"/>
					</div>
					<div class="tab-pane" id="tab_1_1_4">
						<jsp:include page="orden/tabPagos.jsp"/>
					</div>
					<div class="tab-pane" id="tab_1_1_5">
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
<script src="assets/admin/pages/scripts/form-fileupload.js"></script>
<script src="assets/global/plugins/jquery.form.js" type="text/javascript"></script>
<!-- END PAGE LEVEL PLUGINS -->

<!-- BEGIN PAGE LEVEL SCRIPTS -->
<script src="assets/global/plugins/jquery-formatcurrency-master/jquery.formatCurrency.js" type="text/javascript"></script>
<script src="assets/global/plugins/bootstrap-touchspin/bootstrap.touchspin.js" type="text/javascript"></script>
<script src="assets/global/plugins/fancybox/source/jquery.fancybox.pack.js"></script>
<script src="assets/global/plugins/plupload/js/plupload.full.min.js" type="text/javascript"></script>
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
    <script src="assets/global/plugins/jquery-file-upload/js/cors/jquery.xdr-transport.js"></script>
    <![endif]-->
<!-- END:File Upload Plugin JS files-->
<!-- END PAGE LEVEL SCRIPTS -->
<script>
jQuery(document).ready(function() { 
	Metronic.init(); // init metronic core components
	Layout.init(); // init current layout
	Demo.init(); // init demo features
});
</script>
<script>

</script>
<script>
var oferta = 0;
var gastosGen = 0;
var utilBruta = 0;
var utilNeta = 0;
var eficiencia = 0;

$(document).ready(function(){
	var idOrden = $('#txtIdOrden').val();
	
	extraerInformacionOrden(idOrden); 
	listarSubcontratos(idOrden);	
	listarCuentasPagoProveedor(idOrden);
	listarCuentasCobrar(idOrden);
});

function extraerInformacionOrden(idOrdenTemp){
	$.ajax({
 		url: 'ajaxObtenerInformacionOrden-' + idOrdenTemp,
 		type: 'post',
 		dataType: 'json',
 		data: '',
 		success: function(orden){
 			$('#spnCodigo').text('ORDEN ' + orden.codigo);
 			//$('#spnFechaHora').text('   ' + orden.fechaCreacion);
 			initOrdenGeneral(orden);
 		}
 	});	
}
function listarCuentasCobrar(idOrdenTemp){
	$.ajax({
 		url: 'ajaxListarCuentas-cobro-' + idOrdenTemp,
 		type: 'post',
 		dataType: 'json',
 		data: '',
 		success: function(cuentascobrar){
 			initClienteCuentasCobrar(cuentascobrar);	 	        
 		},
 		complete: function() {	 			
 			//removeNulls();
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
 		},
 		complete: function() {	 			
 			//removeNulls();
  		}
 	});
}
function listarCuentasPagoProveedor(idOrdenTemp){
    $.ajax({
 		url: 'ajaxListarCuentas-pago-' + idOrdenTemp,
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
</body>
</html>