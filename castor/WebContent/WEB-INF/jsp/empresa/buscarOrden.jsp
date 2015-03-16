<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Castor | Buscar Orden</title>
<jsp:include page="../comps/headMandatory.jsp"/>
<!-- BEGIN PAGE LEVEL STYLES -->
<link rel="stylesheet" type="text/css" href="assets/global/plugins/select2/select2.css"/>
<link rel="stylesheet" type="text/css" href="assets/global/plugins/datatables/extensions/Scroller/css/dataTables.scroller.min.css"/>
<link rel="stylesheet" type="text/css" href="assets/global/plugins/datatables/extensions/ColReorder/css/dataTables.colReorder.min.css"/>
<link rel="stylesheet" type="text/css" href="assets/global/plugins/datatables/plugins/bootstrap/dataTables.bootstrap.css"/>
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
				<div class="caption"><i class="icon-basket"></i>Buscar Orden</div>
				<div class="actions">							
					<a class="btn btn-icon-only btn-default btn-sm fullscreen" href="#" data-original-title="" title=""></a>
				</div>
			</div>
			<div class="portlet-body form">
				<div class="form-body">
					<div class="row">
						<div class="col-md-3">
							<div class="form-group">
								<div class="col-md-12">
									<input id="txtNombre" class="form-control" placeholder="Codigo Orden" name="nombre"/>
								</div>	
							</div>
						</div>
						<div class="col-md-3">
							<div class="form-group">
								<div class="col-md-12">
									<input id="txtNombre" class="form-control" placeholder="Codigo Orden" name="nombre"/>
								</div>	
							</div>
						</div>
						<div class="col-md-3">
							<div class="form-group">
								<div class="col-md-12">
									<input id="txtNombre" class="form-control" placeholder="Codigo Orden" name="nombre"/>
								</div>	
							</div>
						</div>
						<div class="col-md-3">
							<div class="col-md-12">
							<a href="#" class="btn yellow">Buscar <i class="fa fa-search"></i></a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<div class="row">
	<div class="col-md-12">
		<div class="portlet box blue-hoki">
			<div class="portlet-title">
				<div class="caption">Resultados</div>
				<div class="actions">							
					<a class="btn btn-icon-only btn-default btn-sm fullscreen" href="#" data-original-title="" title=""></a>
				</div>
			</div>
			<div class="portlet-body">
				<table class="table table-striped table-hover" id="sample_1">
				<thead>
				<tr>
					<th>Rendering engine</th>
					<th>Browser</th>
					<th>Platform(s)</th>
					<th>Engine version</th>
					<th>CSS grade</th>
				</tr>
				</thead>
				<tbody>
				<tr>
					<td>Trident</td>
					<td>Internet Explorer 4.0</td>
					<td>Win 95+</td>
					<td>4</td>
					<td>X</td>
				</tr>
				<tr>
					<td>
						 Trident
					</td>
					<td>
						 Internet Explorer 5.0
					</td>
					<td>
						 Win 95+
					</td>
					<td>
						 5
					</td>
					<td>
						 C
					</td>
				</tr>
				<tr>
					<td>
						 Trident
					</td>
					<td>
						 Internet Explorer 5.5
					</td>
					<td>
						 Win 95+
					</td>
					<td>
						 5.5
					</td>
					<td>
						 A
					</td>
				</tr>
				<tr>
					<td>
						 Trident
					</td>
					<td>
						 Internet Explorer 6
					</td>
					<td>
						 Win 98+
					</td>
					<td>
						 6
					</td>
					<td>
						 A
					</td>
				</tr>
				<tr>
					<td>
						 Trident
					</td>
					<td>
						 Internet Explorer 7
					</td>
					<td>
						 Win XP SP2+
					</td>
					<td>
						 7
					</td>
					<td>
						 A
					</td>
				</tr>
				<tr>
					<td>
						 Trident
					</td>
					<td>
						 AOL browser (AOL desktop)
					</td>
					<td>
						 Win XP
					</td>
					<td>
						 6
					</td>
					<td>
						 A
					</td>
				</tr>
				<tr>
					<td>
						 Gecko
					</td>
					<td>
						 Firefox 1.0
					</td>
					<td>
						 Win 98+ / OSX.2+
					</td>
					<td>
						 1.7
					</td>
					<td>
						 A
					</td>
				</tr>
				<tr>
					<td>
						 Gecko
					</td>
					<td>
						 Firefox 1.5
					</td>
					<td>
						 Win 98+ / OSX.2+
					</td>
					<td>
						 1.8
					</td>
					<td>
						 A
					</td>
				</tr>
				<tr>
					<td>
						 Gecko
					</td>
					<td>
						 Firefox 2.0
					</td>
					<td>
						 Win 98+ / OSX.2+
					</td>
					<td>
						 1.8
					</td>
					<td>
						 A
					</td>
				</tr>
				<tr>
					<td>
						 Gecko
					</td>
					<td>
						 Firefox 3.0
					</td>
					<td>
						 Win 2k+ / OSX.3+
					</td>
					<td>
						 1.9
					</td>
					<td>
						 A
					</td>
				</tr>
				<tr>
					<td>
						 Gecko
					</td>
					<td>
						 Camino 1.0
					</td>
					<td>
						 OSX.2+
					</td>
					<td>
						 1.8
					</td>
					<td>
						 A
					</td>
				</tr>
				<tr>
					<td>
						 Gecko
					</td>
					<td>
						 Camino 1.5
					</td>
					<td>
						 OSX.3+
					</td>
					<td>
						 1.8
					</td>
					<td>
						 A
					</td>
				</tr>
				<tr>
					<td>
						 Gecko
					</td>
					<td>
						 Netscape 7.2
					</td>
					<td>
						 Win 95+ / Mac OS 8.6-9.2
					</td>
					<td>
						 1.7
					</td>
					<td>
						 A
					</td>
				</tr>
				<tr>
					<td>
						 Gecko
					</td>
					<td>
						 Netscape Browser 8
					</td>
					<td>
						 Win 98SE+
					</td>
					<td>
						 1.7
					</td>
					<td>
						 A
					</td>
				</tr>
				<tr>
					<td>
						 Gecko
					</td>
					<td>
						 Netscape Navigator 9
					</td>
					<td>
						 Win 98+ / OSX.2+
					</td>
					<td>
						 1.8
					</td>
					<td>
						 A
					</td>
				</tr>
				<tr>
					<td>
						 Gecko
					</td>
					<td>
						 Mozilla 1.0
					</td>
					<td>
						 Win 95+ / OSX.1+
					</td>
					<td>
						 1
					</td>
					<td>
						 A
					</td>
				</tr>
				<tr>
					<td>
						 Gecko
					</td>
					<td>
						 Mozilla 1.1
					</td>
					<td>
						 Win 95+ / OSX.1+
					</td>
					<td>
						 1.1
					</td>
					<td>
						 A
					</td>
				</tr>
				<tr>
					<td>
						 Gecko
					</td>
					<td>
						 Mozilla 1.2
					</td>
					<td>
						 Win 95+ / OSX.1+
					</td>
					<td>
						 1.2
					</td>
					<td>
						 A
					</td>
				</tr>
				<tr>
					<td>
						 Gecko
					</td>
					<td>
						 Mozilla 1.3
					</td>
					<td>
						 Win 95+ / OSX.1+
					</td>
					<td>
						 1.3
					</td>
					<td>
						 A
					</td>
				</tr>
				<tr>
					<td>
						 Gecko
					</td>
					<td>
						 Mozilla 1.4
					</td>
					<td>
						 Win 95+ / OSX.1+
					</td>
					<td>
						 1.4
					</td>
					<td>
						 A
					</td>
				</tr>
				<tr>
					<td>
						 Gecko
					</td>
					<td>
						 Mozilla 1.5
					</td>
					<td>
						 Win 95+ / OSX.1+
					</td>
					<td>
						 1.5
					</td>
					<td>
						 A
					</td>
				</tr>
				<tr>
					<td>
						 Gecko
					</td>
					<td>
						 Mozilla 1.6
					</td>
					<td>
						 Win 95+ / OSX.1+
					</td>
					<td>
						 1.6
					</td>
					<td>
						 A
					</td>
				</tr>
				<tr>
					<td>
						 Gecko
					</td>
					<td>
						 Mozilla 1.7
					</td>
					<td>
						 Win 98+ / OSX.1+
					</td>
					<td>
						 1.7
					</td>
					<td>
						 A
					</td>
				</tr>
				<tr>
					<td>
						 Gecko
					</td>
					<td>
						 Mozilla 1.8
					</td>
					<td>
						 Win 98+ / OSX.1+
					</td>
					<td>
						 1.8
					</td>
					<td>
						 A
					</td>
				</tr>
				<tr>
					<td>
						 Gecko
					</td>
					<td>
						 Seamonkey 1.1
					</td>
					<td>
						 Win 98+ / OSX.2+
					</td>
					<td>
						 1.8
					</td>
					<td>
						 A
					</td>
				</tr>
				<tr>
					<td>
						 Gecko
					</td>
					<td>
						 Epiphany 2.20
					</td>
					<td>
						 Gnome
					</td>
					<td>
						 1.8
					</td>
					<td>
						 A
					</td>
				</tr>
				<tr>
					<td>
						 Webkit
					</td>
					<td>
						 Safari 1.2
					</td>
					<td>
						 OSX.3
					</td>
					<td>
						 125.5
					</td>
					<td>
						 A
					</td>
				</tr>
				<tr>
					<td>
						 Webkit
					</td>
					<td>
						 Safari 1.3
					</td>
					<td>
						 OSX.3
					</td>
					<td>
						 312.8
					</td>
					<td>
						 A
					</td>
				</tr>
				<tr>
					<td>
						 Webkit
					</td>
					<td>
						 Safari 2.0
					</td>
					<td>
						 OSX.4+
					</td>
					<td>
						 419.3
					</td>
					<td>
						 A
					</td>
				</tr>
				<tr>
					<td>
						 Webkit
					</td>
					<td>
						 Safari 3.0
					</td>
					<td>
						 OSX.4+
					</td>
					<td>
						 522.1
					</td>
					<td>
						 A
					</td>
				</tr>
				<tr>
					<td>
						 Webkit
					</td>
					<td>
						 OmniWeb 5.5
					</td>
					<td>
						 OSX.4+
					</td>
					<td>
						 420
					</td>
					<td>
						 A
					</td>
				</tr>
				<tr>
					<td>
						 Webkit
					</td>
					<td>
						 iPod Touch / iPhone
					</td>
					<td>
						 iPod
					</td>
					<td>
						 420.1
					</td>
					<td>
						 A
					</td>
				</tr>
				<tr>
					<td>
						 Webkit
					</td>
					<td>
						 S60
					</td>
					<td>
						 S60
					</td>
					<td>
						 413
					</td>
					<td>
						 A
					</td>
				</tr>
				<tr>
					<td>
						 Presto
					</td>
					<td>
						 Opera 7.0
					</td>
					<td>
						 Win 95+ / OSX.1+
					</td>
					<td>
						 -
					</td>
					<td>
						 A
					</td>
				</tr>
				<tr>
					<td>
						 Presto
					</td>
					<td>
						 Opera 7.5
					</td>
					<td>
						 Win 95+ / OSX.2+
					</td>
					<td>
						 -
					</td>
					<td>
						 A
					</td>
				</tr>
				<tr>
					<td>
						 Presto
					</td>
					<td>
						 Opera 8.0
					</td>
					<td>
						 Win 95+ / OSX.2+
					</td>
					<td>
						 -
					</td>
					<td>
						 A
					</td>
				</tr>
				<tr>
					<td>
						 Presto
					</td>
					<td>
						 Opera 8.5
					</td>
					<td>
						 Win 95+ / OSX.2+
					</td>
					<td>
						 -
					</td>
					<td>
						 A
					</td>
				</tr>
				<tr>
					<td>
						 Presto
					</td>
					<td>
						 Opera 9.0
					</td>
					<td>
						 Win 95+ / OSX.3+
					</td>
					<td>
						 -
					</td>
					<td>
						 A
					</td>
				</tr>
				<tr>
					<td>
						 Presto
					</td>
					<td>
						 Opera 9.2
					</td>
					<td>
						 Win 88+ / OSX.3+
					</td>
					<td>
						 -
					</td>
					<td>
						 A
					</td>
				</tr>
				<tr>
					<td>
						 Presto
					</td>
					<td>
						 Opera 9.5
					</td>
					<td>
						 Win 88+ / OSX.3+
					</td>
					<td>
						 -
					</td>
					<td>
						 A
					</td>
				</tr>
				<tr>
					<td>
						 Presto
					</td>
					<td>
						 Opera for Wii
					</td>
					<td>
						 Wii
					</td>
					<td>
						 -
					</td>
					<td>
						 A
					</td>
				</tr>
				<tr>
					<td>
						 Presto
					</td>
					<td>
						 Nokia N800
					</td>
					<td>
						 N800
					</td>
					<td>
						 -
					</td>
					<td>
						 A
					</td>
				</tr>
				<tr>
					<td>
						 Presto
					</td>
					<td>
						 Nintendo DS browser
					</td>
					<td>
						 Nintendo DS
					</td>
					<td>
						 8.5
					</td>
					<td>
						 C/A<sup>1</sup>
					</td>
				</tr>
				</tbody>
				</table>		
					
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
<script type="text/javascript" src="assets/global/plugins/select2/select2.min.js"></script>
<script type="text/javascript" src="assets/global/plugins/datatables/media/js/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="assets/global/plugins/datatables/extensions/TableTools/js/dataTables.tableTools.min.js"></script>
<script type="text/javascript" src="assets/global/plugins/datatables/extensions/ColReorder/js/dataTables.colReorder.min.js"></script>
<script type="text/javascript" src="assets/global/plugins/datatables/extensions/Scroller/js/dataTables.scroller.min.js"></script>
<script type="text/javascript" src="assets/global/plugins/datatables/plugins/bootstrap/dataTables.bootstrap.js"></script>
<!-- END PAGE LEVEL PLUGINS -->

<!-- BEGIN PAGE LEVEL SCRIPTS -->
<script src="assets/global/scripts/metronic.js" type="text/javascript"></script>
<script src="assets/admin/layout4/scripts/layout.js" type="text/javascript"></script>
<script src="assets/admin/layout4/scripts/demo.js" type="text/javascript"></script>
<script src="assets/admin/pages/scripts/table-advanced.js"></script>
<!-- END PAGE LEVEL SCRIPTS -->
<script>
jQuery(document).ready(function() {   
	Metronic.init(); // init metronic core components
	Layout.init(); // init current layout
	Demo.init(); // init demo features
	TableAdvanced.init();
});
</script>
</body>
</html>