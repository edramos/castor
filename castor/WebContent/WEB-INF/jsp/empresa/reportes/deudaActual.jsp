<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Castor | Deuda Actual</title>
<jsp:include page="../../comps/headMandatory.jsp"/>
<!-- BEGIN PAGE LEVEL STYLES -->
<link rel="stylesheet" type="text/css" href="assets/global/plugins/select2/select2.css"/>
<link rel="stylesheet" type="text/css" href="assets/global/plugins/bootstrap-datepicker/css/datepicker.css"/>
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
				<div class="caption">Ordenes de Trabajo</div>
				<div class="actions">							
					<a class="btn btn-icon-only btn-default btn-sm fullscreen" href="#" data-original-title="" title=""></a>
				</div>
			</div>
			<div id="divPortletBody" class="portlet-body">
		
				<table id="sample_3" class="table table-striped table-bordered table-condensed table-hover">
				<thead>
				<tr>
					<th>OT</th><th>Nombre</th><th>Provedor</th><th>Estado</th><th>Pagar</th><th>Pagado</th><th>Deuda</th><th>Pagado %</th>
				</tr>
				</thead>
				
				<tbody id="viewReporteHandlerbars">
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

<jsp:include page="../../comps/footer.jsp"/>
<jsp:include page="../../comps/corePlugins.jsp"/>
<!-- BEGIN PAGE LEVEL PLUGINS -->
<script type="text/javascript" src="assets/global/plugins/select2/select2.min.js"></script>
<script type="text/javascript" src="assets/global/plugins/bootstrap-datepicker/js/bootstrap-datepicker.js"></script>
<script type="text/javascript" src="assets/global/plugins/datatables/media/js/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="assets/global/plugins/datatables/extensions/TableTools/js/dataTables.tableTools.min.js"></script>
<script type="text/javascript" src="assets/global/plugins/datatables/extensions/ColReorder/js/dataTables.colReorder.min.js"></script>
<script type="text/javascript" src="assets/global/plugins/datatables/extensions/Scroller/js/dataTables.scroller.min.js"></script>
<script type="text/javascript" src="assets/global/plugins/datatables/plugins/bootstrap/dataTables.bootstrap.js"></script>
<!-- END PAGE LEVEL PLUGINS -->

<!-- BEGIN PAGE LEVEL SCRIPTS -->
<script src="assets/global/scripts/metronic.js" type="text/javascript"></script>
<script src="assets/admin/layout4/scripts/layout.js" type="text/javascript"></script>
<!-- END PAGE LEVEL SCRIPTS -->
<script>
jQuery(document).ready(function() {   
	Metronic.init(); // init metronic core components
	Layout.init(); // init current layout
	mostrarReporte();
});
</script>
<script>
function mostrarReporte(){
	var html = '';
	$.ajax({
 		url: 'mostrarReporteOT',
 		type: 'post',
 		dataType: 'json',
 		success: function(registros){
 			
 			$.each(registros, function(i, registro){
	 			var source = $("#templateReporte").html();
	 			var template = Handlebars.compile(source);
	 			html += template(registro);
 			});
 			
 			$("#viewReporteHandlerbars").html(html);
 			initTable();
			$("#viewReporteHandlerbars").append('<tr style="font-weight: bold;"><td></td><td></td><td></td><td></td><td></td>' + 
 			'<td style="text-align: right;">' + registros[registros.length - 1].totalPagar + '</td><td style="text-align: right;">' + registros[registros.length - 1].totalPagado + '</td><td style="text-align: right;">' + registros[registros.length - 1].totalDeuda + '</td><td>' + registros[registros.length - 1].totalPorcentajePagado + '</td></tr>');	
 		}
 	});	
}
</script>
<script>
function initTable(){
	
	var table = $('#sample_3');
	
	// Formatting function for row details 
	function fnFormatDetails(oTable, nTr){
	    var aData = oTable.fnGetData(nTr);
	    var html = '';
	    var aIdO = aData[1].split("-");		//Por ahora porque el idOrden esta en un <a>
	    var aTemp = aIdO[1].split('\"');
	    
	    alert(aTemp[0]);
	    $.ajax({
	 		url: 'ajaxListarCuentas-pagar-' + aTemp[0],
	 		type: 'post',
	 		dataType: 'json',
	 		data: '',
	 		success: function(cuentaspago){
	 			$.each(cuentaspago, function(i, pago){
	 				var source = $("#templatePagos").html();
	 				var template = Handlebars.compile(source);
	 				html += template(pago);		
	 			});
	 			$('#viewPagosHandleBars').html(html);	 	        
	 		}
	 	});
	    
	    var sOut = '<table class="table table-striped table-bordered table-condensed table-hover" style="margin-bottom:0px;">'+
	    '<thead><tr><th>Proveedor</th><th>Vence</th><th>Monto</th><th>Tipo Pago</th><th>Condicion</th><th>Estado</th></tr></thead>'+
	    '<tbody id="viewPagosHandleBars"></tbody></table>';
	
	    return sOut;
	}
	
	// Insert a 'details' column to the table
	var nCloneTh = document.createElement('th');
	nCloneTh.className = "table-checkbox";
	
	var nCloneTd = document.createElement('td');
	nCloneTd.innerHTML = '<span class="row-details row-details-close"></span>';
	
	table.find('thead tr').each(function () {
	    this.insertBefore(nCloneTh, this.childNodes[0]);
	});
	
	table.find('tbody tr').each(function () {
	    this.insertBefore(nCloneTd.cloneNode(true), this.childNodes[0]);
	});
	
	
	//Initialize DataTables, with no sorting on the 'details' column
	
	var oTable = table.dataTable({
	
	    // Internationalisation. For more info refer to http://datatables.net/manual/i18n
	    "language": {
	        "aria": {
	            "sortAscending": ": activate to sort column ascending",
	            "sortDescending": ": activate to sort column descending"
	        },
	        "emptyTable": "No se encontraron resultados",
	        "info": "Showing _START_ to _END_ of _TOTAL_ entries",
	        "infoEmpty": "No entries found",
	        "infoFiltered": "(filtered1 from _MAX_ total entries)",
	        "lengthMenu": "Show _MENU_ entries",
	        "search": "Search:",
	        "zeroRecords": "No matching records found"
	    },
	
	    "columnDefs": [{
	        "orderable": false,
	        "targets": [0]
	    }],
	    "order": [
	        [1, 'asc']
	    ],
	    "lengthMenu": [
	        [5, 15, 20, -1],
	        [5, 15, 20, "All"] // change per page values here
	    ],
	    // set the initial value
	    "pageLength": 20,
	});
	var tableWrapper = $('#sample_3_wrapper'); // datatable creates the table wrapper by adding with id {your_table_jd}_wrapper
	
	tableWrapper.find('.dataTables_length select').select2(); // initialize select2 dropdown
	
	// Add event listener for opening and closing details
	// Note that the indicator for showing which row is open is not controlled by DataTables,
	// rather it is done here
	//
	table.on('click', ' tbody td .row-details', function () {
	    var nTr = $(this).parents('tr')[0];
	    if (oTable.fnIsOpen(nTr)) {
	        // This row is already open - close it 
	        $(this).addClass("row-details-close").removeClass("row-details-open");
	        oTable.fnClose(nTr);
	    } else {
	        // Open this row 
	        $(this).addClass("row-details-open").removeClass("row-details-close");
	        oTable.fnOpen(nTr, fnFormatDetails(oTable, nTr), 'details');
	    }
	});
    
}
</script>
<script id="templateReporte" type="text/x-handlebars-template">
<tr>
	<td><a href="ordenPag-{{idOrden}}" target="_blank">{{codigo}}</a></td>
	<td>{{nombre}}</td>
	<td>{{nombreProveedor}}</td>
	<td>{{estado}}</td>
	<td style="text-align: right;">{{totalPagarProveedor}}</td>
	<td style="text-align: right;">{{totalPagadoProveedor}}</td>
	<td style="text-align: right;">{{totalDeudaProveedor}}</td>
	<td>{{porcentajePagado}}%</td>
</tr>
</script>
<script id="templatePagos" type="text/x-handlebars-template">
<tr>
	<td>{{nombreProveedor}}</td>
	<td>{{fechaVencimiento}}</td>
	<td>{{conIgv}}</td>
	<td>{{tipoPago}}</td>
	<td>{{estadoTrabajo}} {{avance}}</td>
	<td>{{estado}}</td>
</tr>
</script>
</body>
</html>