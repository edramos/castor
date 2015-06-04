<!DOCTYPE html>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Castor | Master Deuda</title>
<jsp:include page="../../comps/headMandatory.jsp"/>
<!-- BEGIN PAGE LEVEL STYLES -->
<link rel="stylesheet" type="text/css" href="assets/global/plugins/select2/select2.css"/>
<link rel="stylesheet" type="text/css" href="assets/global/plugins/datatables/extensions/Scroller/css/dataTables.scroller.min.css"/>
<link rel="stylesheet" type="text/css" href="assets/global/plugins/datatables/extensions/ColReorder/css/dataTables.colReorder.min.css"/>
<link rel="stylesheet" type="text/css" href="assets/global/plugins/datatables/plugins/bootstrap/dataTables.bootstrap.css"/>
<!-- END PAGE LEVEL STYLES -->
</head>

<body class="page-header-fixed page-sidebar-closed-hide-logo page-sidebar-closed-hide-logo">
<jsp:include page="../../comps/cabecera.jsp"/>
<div class="clearfix"></div>

<!-- BEGIN CONTAINER -->
<div class="page-container">
<jsp:include page="../../comps/menuCostado.jsp"/>
	
<!-- BEGIN CONTENT -->
<div class="page-content-wrapper">
<div class="page-content">
<div class="row">
	<div class="col-md-12">
		<div class="portlet box blue-hoki">
			<div class="portlet-title">
				<div class="caption">Master Deuda OT</div>
				<div class="actions">							
					<a class="btn btn-icon-only btn-default btn-sm fullscreen" href="#" data-original-title="" title=""></a>
				</div>
			</div>
			<div id="divPortletBody" class="portlet-body">
			
			<form:form id="frmEditarFila" action="ajaxEditarOrden" modelAttribute="ordenBean" method="post">
				
			<table id="tblMasterDeudaOT" class="table table-striped table-bordered table-condensed table-hover">
			<thead>
			<tr>
				<th>idO</th><th>idC</th><th>Nombre</th><th>Cliente</th><th>Estado</th><th>Monto</th><th>Pagado</th>
				<th>Deuda Actual</th><th>Deuda Comprom.</th><th>Deuda Corresp.</th>
			</tr>
			</thead>
			
			<tbody id="viewMasterDeudaProveedorOTHandlerbars">
			</tbody>
			</table>
			
			</form:form>
				
			</div>
		</div>
	</div>
</div>	
</div>
</div>
<!-- END CONTENT -->
</div>
<!-- END CONTAINER -->

<jsp:include page="../../comps/footer.jsp"/>
<jsp:include page="../../comps/corePlugins.jsp"/>
<!-- BEGIN PAGE LEVEL PLUGINS -->
<script type="text/javascript" src="assets/global/plugins/select2/select2.min.js"></script>
<script type="text/javascript" src="assets/global/plugins/datatables/media/js/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="assets/global/plugins/datatables/extensions/TableTools/js/dataTables.tableTools.min.js"></script>
<script type="text/javascript" src="assets/global/plugins/datatables/extensions/ColReorder/js/dataTables.colReorder.min.js"></script>
<script type="text/javascript" src="assets/global/plugins/datatables/extensions/Scroller/js/dataTables.scroller.min.js"></script>
<script type="text/javascript" src="assets/global/plugins/datatables/plugins/bootstrap/dataTables.bootstrap.js"></script>
<script type="text/javascript" src="assets/global/plugins/jquery-inputmask/jquery.inputmask.bundle.js"></script>
<!-- END PAGE LEVEL PLUGINS -->

<!-- BEGIN PAGE LEVEL SCRIPTS -->
<script src="assets/global/scripts/metronic.js" type="text/javascript"></script>
<script src="assets/admin/layout4/scripts/layout.js" type="text/javascript"></script>
<!-- END PAGE LEVEL SCRIPTS -->
<script>
var rol = '<%=session.getAttribute("rol").toString()%>';
var aEstados = ["Sin inicio", "Por iniciar", "Proceso", "Terminado", "Aceptado"];

jQuery(document).ready(function() {   
	Metronic.init(); // init metronic core components
	Layout.init(); // init current layout
	
	buscarOrden("empresa");
});
</script>
<script id="templateMasterDeudaOT" type="text/x-handlebars-template">
<tr>
	<td>{{idOrden}}"></td>
	<td>{{idCuenta}}</td>
	<td><a href="ordenPag-{{idOrden}}" target="_blank">{{nombre}}<a/></td>
	<td>{{nombreCliente}}</td>
	<td>{{estado}}</td>
	<td>{{oferta}}</td>
	<td>{{pagado}}</td>
	<td>{{deudaActual}}</td>
	<td>{{deudaComprometida}}</td>
	<td>{{deudaCorrespondiente}}</td>
</tr>
</script>
<script>
function buscarOrden(tipo){
	var html = '';
	
	$.ajax({
		url: 'reporteMasterDeudaOT-' + tipo,
		type: 'post',
		dataType: 'json',
		data: $('#frmBuscarOrden').serialize(),
		success: function(ordenes){
			$.each(ordenes, function(i, orden){
 				var source = $("#templateMasterDeudaOT").html();
 				var template = Handlebars.compile(source);
 				html += template(orden);
			});
			$("#viewMasterDeudaProveedorOTHandlerbars").html(html);
			initTableMasterDeudaOT();
		}
	});	
}
</script>
<script>
function initTableMasterDeudaOT(){
	var table = $('#tblMasterDeudaOT');
	var oTable = table.dataTable({
        "lengthMenu": [
            [5, 15, 20, -1],
            [5, 15, 20, "All"] // change per page values here
        ],
        "pageLength": 10,

        "language": {
            "lengthMenu": " _MENU_ records"
        },
        "columnDefs": [
        { 
        	"visible": false, "targets": [0,1] 
        },{ 
            'orderable': false,
            'targets': [0]
        }, {
            "searchable": true,
            "targets": [0]
        }],
        "order": [
            [0, "asc"]
        ] // set first column as a default sort by asc
    });
	var tableWrapper = $("#tblMasterDeudaOT_wrapper");
	tableWrapper.find(".dataTables_length select").select2({
        showSearchInput: false //hide search box with special css class
    }); // initialize select2 dropdown
    
}
</script>
</body>
</html>