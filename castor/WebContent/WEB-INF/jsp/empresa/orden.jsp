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
							<span class="caption-subject font-blue-madison bold uppercase">Cobros</span></a>
						</li>
						<li class="">
							<a aria-expanded="false" href="#tab_1_1_3" data-toggle="tab">
							<span class="caption-subject font-blue-madison bold uppercase">Pagos</span></a>
						</li>
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
						<jsp:include page="orden/tabSubcontratos.jsp"/>
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
<script src="assets/admin/pages/scripts/form-fileupload.js"></script>
<script src="assets/global/plugins/malsup/jquery.form.js" type="text/javascript"></script>
<!-- END PAGE LEVEL PLUGINS -->

<!-- BEGIN PAGE LEVEL SCRIPTS -->
<script src="assets/global/plugins/jquery-formatcurrency-master/jquery.formatCurrency.js" type="text/javascript"></script>
<script src="assets/global/plugins/bootstrap-touchspin/bootstrap.touchspin.js" type="text/javascript"></script>
<script src="assets/global/plugins/fancybox/source/jquery.fancybox.pack.js"></script>
<script src="assets/global/plugins/plupload/js/plupload.full.min.js" type="text/javascript"></script>
<!-- END PAGE LEVEL SCRIPTS -->
<script>
jQuery(document).ready(function() { 
	Metronic.init(); // init metronic core components
	Layout.init(); // init current layout
	Demo.init(); // init demo features
	$(".fancybox-button").fancybox(); 
});
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
	
	listarCuentasCobrar(idOrden);
	listarFacturasCobrar(idOrden);
	
	listarSubcontratos(idOrden);	
	listarCuentasPagoProveedor(idOrden);
	cargarArchivos(idOrden);
	
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
            cargarArchivos(idOrden);
        }
	});
});

function listarFacturasCobrar(idOrdenTemp){
	$.ajax({
		url: 'cargarFactura-' + idOrdenTemp,
		type: 'post',
 		dataType: 'json',
 		data: '',
 		success: function(facturasCobrar){ 			
 			if(facturasCobrar.length != 0){
 				initFacturasCobrar(facturasCobrar);
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
 			$('#spnCodigo').text('ORDEN ' + orden.codigo);
 			//$('#spnFechaHora').text('   ' + orden.fechaCreacion);
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
 		},
 		complete: function() {	 			
 			//removeNulls();
  		}
 	});
}
function listarCuentasPagoProveedor(idOrdenTemp){
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
</body>
</html>