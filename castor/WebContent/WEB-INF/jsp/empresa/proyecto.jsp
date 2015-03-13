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
				<div class="caption">Proyecto PRO-001</div>
				<div id="dynamicActions" class="actions">
					<a id="btnIrCrearCliente" class="label label-info"> Nuevo </a>	
				</div>
			</div>
			
			<div class="portlet-body form">
				 <div class="form-horizontal">
					<div class="form-body">
						<h4>General</h4>
						<div class="row">
							<div class="col-md-4">
								<div class="form-group">
									<label class="control-label col-md-3">Nombre:</label>
									<div class="col-md-9">
										<p class="form-control-static">Nombre Proyecto</p>
									</div>
								</div>
							</div>
							<div class="col-md-4">
								<div class="form-group">
									<label class="control-label col-md-3">Tipo:</label>
									<div class="col-md-9">
										<p class="form-control-static">Estructuras Metalicas</p>
									</div>
								</div>
							</div>
							<div class="col-md-4">
								<div class="form-group">
									<label class="control-label col-md-3">Cliente:</label>
									<div class="col-md-9">
										<p class="form-control-static">Desarrollos Terrestres</p>
									</div>
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-md-4">
								<div class="form-group">
									<label class="control-label col-md-3">Direccion:</label>
									<div class="col-md-9">
										<p class="form-control-static">Av. Gregorio Escobedo, Jesus Maria, Lima, Lima.</p>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
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