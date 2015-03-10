<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Castor | Mi Compañia</title>
<jsp:include page="../comps/headMandatory.jsp"/>
<!-- BEGIN PAGE LEVEL STYLES -->
<link href="assets/global/plugins/icheck/skins/all.css" rel="stylesheet"/>
<!-- END PAGE LEVEL STYLES -->
<!-- BEGIN THEME STYLES -->
<!-- DOC: To use 'rounded corners' style just load 'components-rounded.css' stylesheet instead of 'components.css' in the below style tag -->
<link href="assets/global/css/components-rounded.css" id="style_components" rel="stylesheet" type="text/css"/>
<link href="assets/global/css/plugins.css" rel="stylesheet" type="text/css"/>
<link href="assets/admin/layout4/css/layout.css" rel="stylesheet" type="text/css"/>
<link href="assets/admin/layout4/css/themes/light.css" rel="stylesheet" type="text/css" id="style_color"/>
<link href="assets/admin/layout4/css/custom.css" rel="stylesheet" type="text/css"/>
<!-- END THEME STYLES -->
<style>
#map-container img { 
	max-width: none;
}
</style>
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
				<div class="portlet light">
					<div class="portlet body">
						<div class="tabbable tabs-left">
							<ul class="nav nav-tabs">
								<li class="active">
									<a aria-expanded="true" href="#tab_1_1_1" data-toggle="tab">
									<span class="caption-subject font-blue-madison bold uppercase">Informacion</span></a>
								</li>
								<li class="">
									<a aria-expanded="false" href="#tab_1_1_2" data-toggle="tab">
									<span class="caption-subject font-blue-madison bold uppercase">Oficinas</span></a>
								</li>
								<li class="">
									<a aria-expanded="false" href="#tab_1_1_3" data-toggle="tab">
									<span class="caption-subject font-blue-madison bold uppercase">Empleados</span></a>
								</li>
								<li class="">
									<a aria-expanded="false" href="#tab_1_1_4" data-toggle="tab">
									<span class="caption-subject font-blue-madison bold uppercase">Clientes</span></a>
								</li>
								<li class="">
									<a aria-expanded="false" href="#tab_1_1_5" data-toggle="tab">
									<span class="caption-subject font-blue-madison bold uppercase">Proveedores</span></a>
								</li>
							</ul>
						</div>
						
						<!-- BEGIN TABS -->
						<div class="tab-content">
							<div class="tab-pane active" id="tab_1_1_1">
								<jsp:include page="miCompania/tabInformacion.jsp"/>
							</div>
							<div class="tab-pane" id="tab_1_1_2">
								<jsp:include page="miCompania/tabOficinas.jsp"/>
							</div>
							<div class="tab-pane" id="tab_1_1_4">
								<jsp:include page="miCompania/tabClientes.jsp"/>
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
<script src="http://maps.google.com/maps/api/js?sensor=true" type="text/javascript"></script>
<script src="assets/global/plugins/gmaps/gmaps.min.js" type="text/javascript"></script>
<script src="assets/global/plugins/icheck/icheck.min.js"></script>
<!-- END PAGE LEVEL PLUGINS -->
<!-- BEGIN PAGE LEVEL SCRIPTS -->
<script src="assets/admin/pages/scripts/maps-google.js" type="text/javascript"></script>
<script type="text/javascript" src="assets/global/scripts/metronic.js"></script>
<script type="text/javascript" src="assets/admin/layout4/scripts/layout.js"></script>
<script type="text/javascript" src="assets/admin/layout4/scripts/demo.js"></script>
<script src="assets/global/plugins/icheck/icheck.min.js"></script>
<script src="assets/admin/pages/scripts/form-icheck.js"></script>
<!-- END PAGE LEVEL SCRIPTS -->
<script>
jQuery(document).ready(function() {    
    Metronic.init(); // init metronic core components
	Layout.init(); // init current layout
	Demo.init(); // init demo features
	FormiCheck.init(); // init page demo
	
	
	
	$(document).on('click','.eventBtn', function(e){
		switch(this.id){
		//INFORMACION
		case "btnEditarInfo":
			$('#informacionInit').hide();
			$('#informacionEdit').show();
			break;
		case "btnCancelarInfo":
			$('#informacionEdit').hide();
			$('#informacionInit').show();
			break;
		case "btnGrabarInfo":
			break;
		//OFICINA
		case "btnNuevaOfi":
			$('#oficinasInit').hide();
			$('#oficinasNueva').show();
			MapsGoogle.init();
			break;
		case "btnCancelarOfi":
			$('#oficinasNueva').hide();
			$('#oficinasInit').show();
			MapsGoogle.init();
			break;
		//CLIENTE
		case "btnIrCrearCliente":
			$('#clienteInit').hide();
			$('#clienteCrear').show();
			break;
		case "btnCancelarCliente":
			$('#clienteCrear').hide();
			$('#clienteInit').show();
			break;
		case "btnCrearCliente":
			if($('#txtNombre').val() != ''){
				$.ajax({
	    			url: '/ajaxCrearCliente',
					type: 'post',
					dataType: 'json',
					data: $('#frmCrearClienteAjax').serialize(),
					success: function(clients){
						$("#txtName").val("");
						//getInitClients();
						alert('Ok');
					}
	    		
	    		});
			}
			break;
		}
		
	});
	
	var flag = 0;
	$('a[href="#tab_1_1_2"]').on('shown.bs.tab', function(e){
		if(flag == 0){
			flag = -1;
			MapsGoogle.init();
		}
    });
});
</script>
</body>
</html>