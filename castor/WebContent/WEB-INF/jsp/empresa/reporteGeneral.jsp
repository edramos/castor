<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Castor | Reporte Deuda Actual</title>
<jsp:include page="../comps/headMandatory.jsp"/>
<!-- BEGIN PAGE LEVEL STYLES -->
<link rel="stylesheet" type="text/css" href="assets/global/plugins/select2/select2.css"/>
<link rel="stylesheet" type="text/css" href="assets/global/plugins/bootstrap-datepicker/css/datepicker.css"/>
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
				<div class="caption">Ordenes de Trabajo</div>
				<div class="actions">							
					<a class="btn btn-icon-only btn-default btn-sm fullscreen" href="#" data-original-title="" title=""></a>
				</div>
			</div>
			<div id="divPortletBody" class="portlet-body">
				<table id="tblResultados" class="table table-striped table-hover">
				<thead>
				<tr>
					<th>OT</th>
					<th width="20%">Nombre</th>
					<th>Provedor</th>
					<th>Estado</th>
					<th width="15%">Pagar</th>
					<th width="15%">Pagado</th>
					<th width="15%">Deuda Actual</th>
					<th width="10%">% Pagado</th>
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

<jsp:include page="../comps/footer.jsp"/>
<jsp:include page="../comps/corePlugins.jsp"/>
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
	initTable();
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
 			//removeTable();
 			//createTable();
 			$.each(registros, function(i, registro){
	 			var source = $("#templateReporte").html();
	 			var template = Handlebars.compile(source);
	 			html += template(registro);
 			});
 			
 			$("#viewReporteHandlerbars").html(html);
 			
 			/* $('#tblReporte').dataTable({
 			    "bSort": false,
 			   	
 			  }); */
 			 $("#viewReporteHandlerbars").append('<tr style="font-weight: bold;"><td></td><td></td><td></td><td></td>' + 
 			 '<td>' + registros[registros.length - 1].totalPagar + '</td><td>' + registros[registros.length - 1].totalPagado + '</td><td>' + registros[registros.length - 1].totalDeuda + '</td><td>' + registros[registros.length - 1].totalPorcentajePagado + '</td></tr>');
 		}
 	});	
}
function removeTable(){
	$('#tblResultados').remove();
	$('#tblResultados_wrapper').remove();
}
function createTable(){
	$('#divPortletBody').append(
			"<table class='table table-striped table-hover' id='tblResultados'><thead><tr><th>OT</th><th>Nombre</th><th>Provedor</th><th>Estado</th><th>% Avance</th><th>% Pagado</th>"+
			"</tr></thead><tbody id='viewResultadosHandlerbars'></tbody></table>"	
	);
}
</script>
<script>
function initTable(){
    var table = $('#tblResultados');

    /* Table tools samples: https://www.datatables.net/release-datatables/extras/TableTools/ */
    /* Set tabletools buttons and button container */
    $.extend(true, $.fn.DataTable.TableTools.classes, {
        "container": "btn-group tabletools-dropdown-on-portlet",
        "buttons": {
            "normal": "btn btn-sm default",
            "disabled": "btn btn-sm default disabled"
        },
        "collection": {
            "container": "DTTT_dropdown dropdown-menu tabletools-dropdown-menu"
        }
    });

    var oTable = table.dataTable({
        // Internationalisation. For more info refer to http://datatables.net/manual/i18n
        "language": {
            "aria": {
                "sortAscending": ": activate to sort column ascending",
                "sortDescending": ": activate to sort column descending"
            },
            "emptyTable": "No se encontradon resultados",
            "info": "_START_ - _END_ de _TOTAL_ resultados",
            "infoEmpty": "No se encontradon resultados",
            "infoFiltered": "(filtered1 from _MAX_ total entries)",
            "lengthMenu": "Ver _MENU_ registros",
            "search": "Buscar:",
            "zeroRecords": "No se encontradon resultados"
        },
        "bSort": false,
        // Or you can use remote translation file
        //"language": {
        //   url: '//cdn.datatables.net/plug-ins/3cfcc339e89/i18n/Portuguese.json'
        //},

        "order": [
            [0, 'asc']
        ],
        
        "lengthMenu": [
            [10, 25, 50, -1],
            [10, 25, 50, "Todos"] // change per page values here
        ],
        // set the initial value
        "pageLength": 25,

        "dom": "<'row' <'col-md-12'T>><'row'<'col-md-6 col-sm-12'l><'col-md-6 col-sm-12'f>r><'table-scrollable't><'row'<'col-md-5 col-sm-12'i><'col-md-7 col-sm-12'p>>", // horizobtal scrollable datatable

        // Uncomment below line("dom" parameter) to fix the dropdown overflow issue in the datatable cells. The default datatable layout
        // setup uses scrollable div(table-scrollable) with overflow:auto to enable vertical scroll(see: assets/global/plugins/datatables/plugins/bootstrap/dataTables.bootstrap.js). 
        // So when dropdowns used the scrollable div should be removed. 
        //"dom": "<'row' <'col-md-12'T>><'row'<'col-md-6 col-sm-12'l><'col-md-6 col-sm-12'f>r>t<'row'<'col-md-5 col-sm-12'i><'col-md-7 col-sm-12'p>>",

        "tableTools": {
            "sSwfPath": "assets/global/plugins/datatables/extensions/TableTools/swf/copy_csv_xls_pdf.swf",
            "aButtons": [{
                "sExtends": "pdf",
                "sButtonText": "PDF"
            }, {
                "sExtends": "csv",
                "sButtonText": "CSV"
            }, {
                "sExtends": "xls",
                "sButtonText": "Excel"
            }, {
                "sExtends": "print",
                "sButtonText": "Print",
                "sInfo": 'Presiona "CTR+P" para Imprimir o "ESC" to regresar',
                "sMessage": "Generated by Simularte"
            }],
            "sRowSelect": "single",
        }
    });
    //El wrapper esta relacionado con datatables.js
    var tableWrapper = $('#tblResultados_wrapper'); // datatable creates the table wrapper by adding with id {your_table_jd}_wrapper
    tableWrapper.find('.dataTables_length select').select2(); // initialize select2 dropdown
    
    $('#tblResultados tbody tr').live('click', function (event){
    	var aData = oTable.fnGetData(this);
    	
    	if (aData != null){
    		$('#divInitCajaBanco').hide();
    		$('#divCrearDetalleLibro').hide();
    		mostrarDetalle(aData[0]);
    		$('#divRegistroDetalle').show();
    	}
    });
}
</script>
<script id="templateReporte" type="text/x-handlebars-template">
<tr>
	<td>{{codigo}}</td>
	<td>{{nombre}}</td>
	<td>{{nombreProveedor}}</td>
	<td>{{estado}}</td>
	<td>{{totalPagarProveedor}}</td>
	<td>{{totalPagadoProveedor}}</td>
	<td>{{totalDeudaProveedor}}</td>
	<td>{{porcentajePagado}}</td>
</tr>
</script>
</body>
</html>