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
<style type="text/css">
.aligncenter{
	text-align: center;
}
</style>
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
				<div class="tools"></div>
			</div>
			<div id="divPortletBody" class="portlet-body">
			
			<form:form id="frmEditarFila" action="ajaxEditarOrden" modelAttribute="ordenBean" method="post">
				
			<table id="tblMasterDeudaOT" class="table table-striped table-bordered table-hover">
			<thead>
			<tr>
				<th>idO</th><th>idC</th><th>Nombre</th><th>Proveedor</th><th>Estado</th><th>Oferta</th><th>Pagado</th>
				<th>Deuda Actual</th><th>Deuda Comprom.</th><th>Deuda Corresp.</th><th></th><th></th>
			</tr>
			</thead>
			
			<tbody id="viewMasterDeudaOTHandlerbars">
			</tbody>
			</table>
			
			</form:form>
			
				
			</div>
		</div>
</div>
</div>
<div class="row">
<div class="col-md-12">
		<div class="portlet box blue-hoki">
			<div class="portlet-title">
				<div class="caption"><i class="fa fa-table"></i>Resumen por fecha de mes de termino</div>
				<div class="actions"></div>
			</div>
			<div id="divPortletBodyDinamica" class="portlet-body">
				<table id="tblMasterDinamicaOT" class="table table-striped table-bordered table-condensed table-hover">
				<thead>
				<tr>
					<th></th><th>Ene</th><th>Feb</th><th>Mar</th><th>Abr</th><th>Mayo</th><th>Junio</th><th>Julio</th><th>Agosto</th><th>Sep</th><th>Oct</th><th>Nov</th><th>Dic</th>
				</tr>
				</thead>
				
				<tbody id="viewMasterDinamicaOTHandlerbars">
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
	
	buscarOrden("cliente");
	buscarOrdenDinamica();
});
</script>
<script id="templateMasterDeudaOT" type="text/x-handlebars-template">
<tr>
	<td>{{idOrden}}</td>
	<td>{{idCuenta}}</td>
	<td><a href="ordenPag-{{idOrden}}" target="_blank">{{nombre}}<a/></td>
	<td>{{nombreProveedor}}</td>
	<td>{{estado}}</td>
	<td>{{ofertaS}}</td>
	<td>{{igv}}</td>
	<td>{{sTotal}}</td>
	<td>{{pagadoS}}</td>
	<td>{{deudaActualS}}</td>
	<td>{{deudaComprometidaS}}</td>
	<td>{{deudaCorrespondienteS}}</td>
	<td><a class="btn green-meadow btn-xs edit" href="javascript:;"><i class="fa fa-edit"></i> Editar</a></td>
	<td></td>
</tr>
</script>
<script id="templateMasterDinamicaOT" type="text/x-handlebars-template">
<tr>
	<td>{{estado}}</td>
{{#each contadorMeses}}
	<td>{{this}}</td>
{{/each}}
</tr>
</script>
<script>
function buscarOrdenDinamica(){
	var html = '';
	
	$.ajax({
		url: 'reporteMasterDinamicaOT',
		type: 'post',
		dataType: 'json',
		data: '',
		success: function(ordenes){
			$.each(ordenes, function(i, orden){
 				var source = $("#templateMasterDinamicaOT").html();
 				var template = Handlebars.compile(source);
 				html += template(orden);
			});
			removeAddTableDinamica();
			$("#viewMasterDinamicaOTHandlerbars").html(html);
			initTableMasterDinamicaOT();
		}
	});	
}
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
			removeAddTable();
			$("#viewMasterDeudaOTHandlerbars").html(html);
			$("#viewMasterDeudaOTHandlerbars").append('<tr class="success"><th>TOTALES</th><th></th><th>TOTAL</th><th></th><th></th><th></th>'+
			'<th></th><th></th><th>'+ ordenes[ordenes.length - 1].gtPagado +'</th><th>'+ ordenes[ordenes.length - 1].gtDeudaActual +'</th><th></th><th></th><th></th><th></th></tr>');
			
			initTableMasterDeudaOT();
		}
	});	
}
</script>
<script>
function initTableMasterDinamicaOT(){
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
	
	$('#tblMasterDinamicaOT').DataTable({
	    "order": [],
	    "paging": false,
	    "bSort" : false,
	    "bFilter" : false,
	    "bInfo": false,
	    "aoColumnDefs": [
        	{ "sClass": "aligncenter", "aTargets": [1,2,3,4,5,6,7,8,9,10,11,12] },
        	{ "bVisible": false, "aTargets": [ 1,2,3,4,8,9,10,11,12 ] }
        ],
	    "fnCreatedRow": function( nRow, aData, iDataIndex ){
	    	if(aData[0] == "TOTAL"){
	    		$('td', nRow).css({"background-color":"#dff0d8", "font-weight": "bold"});
	    	}
		},
		"dom": "<'row' <'col-md-12'T>><'row'<'col-md-6 col-sm-12'l><'col-md-6 col-sm-12'f>r><'table-scrollable't><'row'<'col-md-5 col-sm-12'i><'col-md-7 col-sm-12'p>>",
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
            }]
        }
	});
}
</script>
<script>
function initTableMasterDeudaOT(){
	function restoreRow(oTable, nRow){
		var aData = oTable.fnGetData(nRow);
        var jqTds = $('>td', nRow);

        for(var i = 0, iLen = jqTds.length; i < iLen; i++) {
            oTable.fnUpdate(aData[i], nRow, i, false);
        }
        oTable.fnDraw();
	}
	function editRow(oTable, nRow){
		var aData = oTable.fnGetData(nRow);
		var jqTds = $('>td', nRow);
		
		switch(rol){
		case "Supervisor":
			jqTds[2].innerHTML = '<select id="sltEstadoObra" name="estado"></select>';
			break;
		case "Contable":
			jqTds[4].innerHTML = '<input id="txtPago" type="text" class="form-control input-sm" name="pagado" value="' + aData[6] + '">';
			break;
		}
		
		
		jqTds[8].innerHTML = '<a class="btn green-meadow btn-xs edit" href=""><i class="fa fa-check"></i> Grabar</a>';
        jqTds[9].innerHTML = '<a class="btn red btn-xs cancel" href=""><i class="fa fa-close"></i> Cancelar</a><input type="hidden" name="idOrden" value="'+ aData[0] +'">';
		
		for(var i = 0; i < aEstados.length; i++){
       		$('<option/>').val(aEstados[i]).html(aEstados[i]).appendTo('#sltEstadoObra');
        }
        $('#sltEstadoObra').val(aData[4]);
	}
	function saveRow(oTable, nRow, idOrden){
		var jqInputs = $('input', nRow);
		var jqSelects = $('select', nRow);
		//Aqui la columna se busca de toda la tabla, incluido las columnas hidden
		switch(rol){
		case "Supervisor":
			oTable.fnUpdate(jqSelects[0].value, nRow, 4, false);
			break;
		case "Contable":
			oTable.fnUpdate(jqInputs[0].value, nRow, 6, false);
			break;
		}
		
		oTable.fnDraw();
	}
	function cancelEditRow(oTable, nRow){
		//Parece que esta funcion no se usa
		alert("Simularte");
	}
	
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
	tableWrapper.find(".dataTables_length select").select2({showSearchInput: false}); // initialize select2 dropdown
    
    
	var nEditing = null;
    var nNew = false;
    
    table.on('click', '.cancel', function (e){
    	e.preventDefault();
    	
    	if(nNew){
            oTable.fnDeleteRow(nEditing);
            nEditing = null;
            nNew = false;
        }else{
            restoreRow(oTable, nEditing);
            nEditing = null;
        }
    });
	
    table.on('click', '.edit', function (e){
    	e.preventDefault();
    	var nRow = $(this).parents('tr')[0];
    	
    	if(nEditing !== null && nEditing != nRow){
            /* Estan editando - pero no esta fila - restaura esta fila antes de continuar con la otra */
            restoreRow(oTable, nEditing);
            
            editRow(oTable, nRow);
            nEditing = nRow;
        }else if(nEditing == nRow && this.innerHTML == '<i class="fa fa-check"></i> Grabar'){
        	var aData = oTable.fnGetData(nRow);
        	
        	$.ajax({
         		url: 'ajaxEditarOrden-masDeu',
         		type: 'post',
         		dataType: 'json',
         		data: $('#frmEditarFila').serialize(),
         		success: function(resultado){
         			buscarOrden("cliente");
         			buscarOrdenDinamica();
         		}
         	});
        	var idOrden = aData[1];
        	saveRow(oTable, nEditing, idOrden);
            nEditing = null;
        }else{
        	/* No se esta editando ninguna fila, empezemos a editar */
            //alert("nRow: " + nRow.rowIndex);
        	editRow(oTable, nRow);
            nEditing = nRow;
        }
    });
}
</script>
<script>
function removeAddTableDinamica(){
	$('#tblMasterDinamicaOT').remove();
	$('#tblMasterDinamicaOT_wrapper').remove();
	
	$('#divPortletBodyDinamica').append('<table id="tblMasterDinamicaOT" class="table table-striped table-bordered table-condensed table-hover"><thead><tr><th></th><th>Ene</th><th>Feb</th><th>Mar</th><th>Abr</th><th>Mayo</th><th>Junio</th><th>Julio</th><th>Ago</th><th>Sep</th><th>Oct</th><th>Nov</th><th>Dic</th></tr></thead><tbody id="viewMasterDinamicaOTHandlerbars"></tbody></table>');
}

function removeAddTable(){
	$('#tblMasterDeudaOT').remove();
	$('#tblMasterDeudaOT_wrapper').remove();
	
	$('#frmEditarFila').append('<table id="tblMasterDeudaOT" class="table table-striped table-bordered table-condensed table-hover"><thead><tr style="text-align:center;"><th>idO</th><th>idC</th>'+
		'<th>Nombre</th><th>Proveedor</th><th>Estado</th><th>Oferta</th><th>IGV</th><th>Total</th><th>Pagado</th><th>Deuda Actual</th><th>Deuda Comp.</th><th>Deuda Corr.</th><th></th><th></th></tr></thead><tbody id="viewMasterDeudaOTHandlerbars"></tbody></table>');
}
</script>
</body>
</html>