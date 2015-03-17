<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Castor | Proyecto</title>
<jsp:include page="../comps/headMandatory.jsp"/>
<!-- BEGIN PAGE LEVEL STYLES -->
<!-- END PAGE LEVEL STYLES -->

<!-- BEGIN THEME STYLES -->
<!-- DOC: To use 'rounded corners' style just load 'components-rounded.css' stylesheet instead of 'components.css' in the below style tag -->
<link href="assets/global/css/components-rounded.css" id="style_components" rel="stylesheet" type="text/css"/>
<link href="assets/global/css/plugins.css" rel="stylesheet" type="text/css"/>
<link href="assets/admin/layout4/css/layout.css" rel="stylesheet" type="text/css"/>
<link href="assets/admin/layout4/css/themes/light.css" rel="stylesheet" type="text/css" id="style_color"/>
<link href="assets/admin/layout4/css/custom.css" rel="stylesheet" type="text/css"/>
<!-- END THEME STYLES -->
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
				<div class="caption">ORDEN OT-TV-00001</div>
				<div id="dynamicActions" class="actions">
					<a id="btnIrCrearCliente" class="label label-info"> Nuevo </a>	
				</div>
			</div>
			
			<div class="portlet-body">
				<div class="tabbable tabs-left">
					<ul class="nav nav-tabs">
						<li class="active">
							<a aria-expanded="true" href="#tab_1_1_1" data-toggle="tab">
							<span class="caption-subject font-blue-madison bold uppercase">General</span></a>
						</li>
						<li class="">
							<a aria-expanded="false" href="#tab_1_1_2" data-toggle="tab">
							<span class="caption-subject font-blue-madison bold uppercase">Financiera</span></a>
						</li>
						<li class="">
							<a aria-expanded="false" href="#tab_1_1_3" data-toggle="tab">
							<span class="caption-subject font-blue-madison bold uppercase">Subcontratos</span></a>
						</li>
						<li class="">
							<a aria-expanded="false" href="#tab_1_1_4" data-toggle="tab">
							<span class="caption-subject font-blue-madison bold uppercase">Cobros</span></a>
						</li>
						<li class="">
							<a aria-expanded="false" href="#tab_1_1_5" data-toggle="tab">
							<span class="caption-subject font-blue-madison bold uppercase">Pagos</span></a>
						</li>
					</ul>
				</div>
				
				<!-- BEGIN TABS -->
				<div class="tab-content">
					<div class="tab-pane active" id="tab_1_1_1">
						<jsp:include page="orden/tabGeneral.jsp"/>
					</div>
					<div class="tab-pane" id="tab_1_1_2">
						<jsp:include page="orden/tabFinanciera.jsp"/>
					</div>
					<div class="tab-pane" id="tab_1_1_3">
						<jsp:include page="orden/tabSubcontratos.jsp"/>
					</div>
					<div class="tab-pane" id="tab_1_1_4">
						<jsp:include page="orden/tabCobros.jsp"/>
					</div>
					<div class="tab-pane" id="tab_1_1_5">
						<jsp:include page="orden/tabPagos.jsp"/>
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
<!-- END PAGE LEVEL PLUGINS -->

<!-- BEGIN PAGE LEVEL SCRIPTS -->
<!-- END PAGE LEVEL SCRIPTS -->
</body>
</html>