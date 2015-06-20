<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
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
<link rel="stylesheet" type="text/css" href="assets/global/plugins/bootstrap-datepicker/css/datepicker.css"/>
<!-- END PAGE LEVEL STYLES -->
<style type="text/css">
.table td, th{text-align: center;}
.aligncenter{text-align: center;}
.alignright{text-align: right;}
.bigHeader{white-space: normal;font-size: 12px; vertical-align: middle;}
.dataTable .details td, .dataTable .details th {background-color: #ffffff;}
.dataTable .details tr:nth-child(2n+1) td, .dataTable .details tr:nth-child(2n+1) th {
    background-color: #ffffff;
}
ul
{
    list-style-type: none;
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
				<div class="actions">
				
				<form:form id="frmBuscarOrden" modelAttribute="ordenBean" method="post">
				
				    <div class="input-daterange input-group" id="datepicker">
				    	<select id="sltProveedores" class="input-small" style="color:#333;" name="idProveedor"><option value="-1">Todos</option></select>
				        <input id="txtInicio" type="text" class="input-xsmall" style="color:#333;" placeholder="Desde" name="fechaInicio" />
				        <input id="txtFin" type="text" class="input-xsmall" style="color:#333;" placeholder="Hasta" name="fechaEntrega" />
				        <a id="btnBuscar" class="btn blue btn-sm eventBtn"><i class="fa fa-search"></i>&nbsp;&nbsp;</a>
				        <div class="btn-group">
				        	<a class="btn green btn-sm eventBtn" data-toggle="dropdown">Exportar <i class="fa fa-angle-down"></i></a>
				        	<ul class="dropdown-menu pull-right">
								<li><a id="btnExcel" class="eventBtn"  href="javascript:;"><i class="fa fa-pencil"></i> Excel </a></li>
								<li><a href="javascript:;"><i class="fa fa-trash-o"></i> PDF </a></li>
							</ul>
				        </div>
				    	
				    </div>
				  
				</form:form>
				
				</div>
			</div>
			<div id="divPortletBody" class="portlet-body">
			
			<form:form id="frmEditarFila" action="ajaxEditarOrden" modelAttribute="ordenBean" method="post">

			</form:form>
			
				
			</div>
		</div>
</div>
</div>
<%if(session.getAttribute("tipo").equals("cliente")){%>
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
<%}%>
	
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
<script type="text/javascript" src="assets/global/plugins/bootstrap-datepicker/js/bootstrap-datepicker.js"></script>
<!-- END PAGE LEVEL PLUGINS -->

<!-- BEGIN PAGE LEVEL SCRIPTS -->
<script src="assets/global/scripts/metronic.js" type="text/javascript"></script>
<script src="assets/admin/layout4/scripts/layout.js" type="text/javascript"></script>
<!-- END PAGE LEVEL SCRIPTS -->
<script>
var rol = '<%=session.getAttribute("rol").toString()%>';
var tipo = '<%=session.getAttribute("tipo").toString()%>';
var aEstados = ["Sin inicio", "Por iniciar", "Proceso", "Terminado", "Aceptado"];
var aProveedores = [];

jQuery(document).ready(function() {   
	Metronic.init(); // init metronic core components
	Layout.init(); // init current layout
	
	buscarOrden();
	buscarOrdenDinamica();
	
	cargarProveedores();
	
    $('.input-daterange').datepicker({
    	format: "dd/mm/yyyy",
		autoclose: true,
		todayHighlight: true
    });
});
</script>
<script>
$(document).on('click','.eventBtn', function(e){
	switch(this.id){
	case "btnBuscar":
		buscarOrden();
		break;
	case "btnExcel":
		$("#frmBuscarOrden").attr("action", "reporteMasterDeudaOTExcel");
		$("#frmBuscarOrden").submit();
		break;
	}
});
function cargarProveedores(){
	$.ajax({
		url: 'ajaxListarProveedores',
		type: 'post',
		dataType: 'json',
		success: function(proveedores){
			$.each(proveedores, function(i, proveedor){
				aProveedores[i] = proveedor;
 			});
			for(var i = 0; i < aProveedores.length; i++){
				$('<option/>').val(aProveedores[i].idProveedor).html(aProveedores[i].nombre).appendTo('#sltProveedores');
			}
		}
	});	
}
</script>
<script id="templateMasterDeudaOT" type="text/x-handlebars-template">
<tr>
	<td>{{idOrden}}</td>
	<td>{{idCuenta}}</td>
	<td style="text-align:left;" width="16%"><a href="ordenPag-{{idOrden}}" target="_blank">{{nombre}}<a/></td>
	<td width="8%">{{nombreProveedor}}</td>
	<td style="text-align:right;" width="8%">{{ofertaS}}</td>
	<td style="text-align:right;" width="8%">{{igv}}</td>
	<td style="text-align:right;" width="8%">{{sTotal}}</td>
	<td width="8%">{{estado}}</td>
	<td style="text-align:right;" width="8%">{{deudaCorrespondienteS}}</td>
	<td style="text-align:right;" width="8%">{{pagadoS}}</td>
	<td style="text-align:right;" width="8%">{{deudaActualS}}</td>
	<td style="text-align:right;" width="8%">{{deudaComprometidaS}}</td>
	<td width="8%">{{perPagado}}</td>
	<td><a class="btn green-meadow btn-xs edit" href="javascript:;"><i class="fa fa-edit"></i> Editar</a></td>
	<td></td>
</tr>
</script>
<script id="templateMasterDinamicaOT" type="text/x-handlebars-template">
<tr>
	<td style="text-align:left;" width="10%">{{estado}}</td>
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
function buscarOrden(){
	var html = '';
	
	$.ajax({
		url: 'reporteMasterDeudaOT',
		type: 'post',
		dataType: 'json',
		data: $('#frmBuscarOrden').serialize(),
		success: function(ordenes){
			if(ordenes.length > 0){
				$.each(ordenes, function(i, orden){
	 				var source = $("#templateMasterDeudaOT").html();
	 				var template = Handlebars.compile(source);
	 				html += template(orden);
				});
				removeAddTable();
				$("#viewMasterDeudaOTHandlerbars").html(html); 
				$("#viewMasterDeudaOTHandlerbars").append('<tr class="success" style="font-weight:bold;"><td>TOTAL</td><td></td><td style="color:#333;text-align:left;">TOTAL</td>'+
				'<td></td><td></td><td></td><td></td><td></td><td></td><td style="color:#333;text-align:right;">'+ ordenes[ordenes.length - 1].gtPagado +'</td>'+
				'<td style="color:#333;text-align:right;">'+ ordenes[ordenes.length - 1].gtDeudaActual +'</td><td></td><td></td><td></td><td></td>');
				
				initTableMasterDeudaOT();
			}else{
				removeAddTable();
				initTableMasterDeudaOT();
			}
				
		}
	});	
}
</script>
<script>
function initTableMasterDinamicaOT(){
	//Exporta Excel, PDF, candidato a desaparecer
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
	
	var table = $('#tblMasterDinamicaOT');
	
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
	
	var oTable = table.dataTable({
	    "order": [],
	    "paging": false,
	    "bSort" : false,
	    "bFilter" : false,
	    "bInfo": false,
	    "aoColumnDefs": [
        	{ "bVisible": false, "aTargets": [2,3,4,5,9,10,11,12,13] }
        ],
	    "fnCreatedRow": function( nRow, aData, iDataIndex ){
	    	if(aData[1] == "TOTAL"){
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
	
	table.on('click', ' tbody td .row-details', function (){
	    var nTr = $(this).parents('tr')[0];
	    var aData = oTable.fnGetData(nTr);
	    var table = $('#tblMasterDinamicaOT').DataTable();
	    var rowIndex = table.row(nTr).index();
	    
	    if(rowIndex != 5){
		    if(oTable.fnIsOpen(nTr)){
		        // This row is already open - close it 
		        $(this).addClass("row-details-close").removeClass("row-details-open");
		        oTable.fnClose(nTr);
		    }else{
		        // Open this row 
		        $(this).addClass("row-details-open").removeClass("row-details-close");
		        oTable.fnOpen(nTr, fnFormatDetails(oTable, nTr, rowIndex), 'details');
		        
		        $('#tblDetalle_' + rowIndex).DataTable({
		        	"paging": false,
		    	    "bSort" : false,
		    	    "bFilter" : false,
		    	    "bInfo": false,
		        	"aoColumnDefs": [
	  	             	{ "bVisible": false, "aTargets": [2,3,4,5,9,10,11,12,13] }
	  	             ]
		        });
		    }
	    }
	});
	
	function fnFormatDetails(oTable, nTr, idTabla){
		var aData = oTable.fnGetData(nTr);
		
	    $.ajax({
	 		url: 'reporteMasterDinamicaOTOrdenes_fila_' + aData[1],
	 		type: 'post',
	 		dataType: 'json',
	 		success: function(ordenes){
	 			$.each(ordenes, function(i, orden){			
	 				$('#ul' + orden.idMes).append('<li><a href="ordenPag-' + orden.idOrden + '" target="_blank">'+ orden.nombre +'</a></li>');			
	 			});	        
	 		}
	 	});
		
	    var sOut = '<table id="tblDetalle_'+ idTabla +'" class="table table-bordered table-condensed" style="margin-bottom:0px;"><thead></thead><tbody><tr><td></td><td></td>'+
	    '<td><ul id="ul1"></ul></td><td><ul id="ul2"></ul></td>'+
	    '<td><ul id="ul3"></ul></td><td><ul id="ul4"></ul></td><td><ul id="ul5"></ul></td><td><ul id="ul6"></ul></td><td><ul id="ul7"></ul></td>'+
	    '<td><ul id="ul8"></ul></td><td><ul id="ul9"></ul></td><td><ul id="ul10"></ul></td><td><ul id="ul11"></ul></td><td><ul id="ul12"></ul></td></tr></tbody></table>';
	
	    return sOut;
	}
}
</script>
<script id="templateListaOrdenesUno" type="text/x-handlebars-template">
<td>
	<ul id="ulMes_{{idMes}}">
		<li>{{nombre}}</li>
	</ul>
</td>
</script>
<script id="templateListaOrdenesVarios" type="text/x-handlebars-template">
<li>{{nombre}}</li>
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
		
		if(rol == "Administrador" || rol == "Supervisor"){
			jqTds[4].innerHTML = '<select id="sltEstadoObra" name="estado"></select>';
		}
		
		jqTds[10].innerHTML = '<a class="btn green-meadow btn-xs edit" href=""><i class="fa fa-check"></i> Grabar</a>';
        jqTds[11].innerHTML = '<a class="btn red btn-xs cancel" href=""><i class="fa fa-close"></i> Cancelar</a><input type="hidden" name="idOrden" value="'+ aData[0] +'">';
		
		for(var i = 0; i < aEstados.length; i++){
       		$('<option/>').val(aEstados[i]).html(aEstados[i]).appendTo('#sltEstadoObra');
        }
        $('#sltEstadoObra').val(aData[7]);
	}
	function saveRow(oTable, nRow, idOrden){
		var jqInputs = $('input', nRow);
		var jqSelects = $('select', nRow);
		//Aqui la columna se busca de toda la tabla, incluido las columnas hidden
		switch(rol){
		case "Supervisor":
			oTable.fnUpdate(jqSelects[0].value, nRow, 4, false);
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
            [25, 50, 100, -1],[25, 50, 100, "Todo"] // change per page values here
        ],
        "pageLength": 25,
        "language": {
            "lengthMenu": " _MENU_ resultados"
        },
        "bFilter" : false,
        "bSort" : false,
        "aoColumnDefs": [
        	{ "bVisible": false, "aTargets": [0,1,5] }
        ],
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
         			buscarOrden();
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
    
    //Muestra columnas segun rol
    var table = $('#tblMasterDeudaOT').DataTable();
	
	if(rol == "Coordinador" || rol == "Contable" || tipo == "proveedor"){
    	table.column(13).visible( false );
    	table.column(14).visible( false );
    }
}
</script>
<script>
function removeAddTableDinamica(){
	$('#tblMasterDinamicaOT').remove();
	$('#tblMasterDinamicaOT_wrapper').remove();
	
	$('#divPortletBodyDinamica').append('<table id="tblMasterDinamicaOT" class="table table-striped table-bordered table-condensed table-hover">'+
		'<thead><tr><th></th><th>Ene</th><th>Feb</th><th>Mar</th><th>Abr</th><th>Mayo</th><th>Junio</th><th>Julio</th><th>Ago</th><th>Sep</th><th>Oct</th>'+
		'<th>Nov</th><th>Dic</th></tr></thead><tbody id="viewMasterDinamicaOTHandlerbars"></tbody></table>');
}

function removeAddTable(){
	$('#tblMasterDeudaOT').remove();
	$('#tblMasterDeudaOT_wrapper').remove();
	
	if(tipo == "cliente"){
	$('#frmEditarFila').append('<table id="tblMasterDeudaOT" class="table table-striped table-bordered table-condensed table-hover"><thead><tr>'+
		'<th>idO</th><th>idC</th><th>Nombre</th><th>Proveedor</th><th>Oferta</th><th>IGV</th><th>Total</th><th>Estado</th>'+
		'<th>Corresp.</th><th>Pagado</th><th>Actual</th><th>Comprom.</th><th>% Pagado</th><th></th><th></th></tr></thead>'+
		'<tbody id="viewMasterDeudaOTHandlerbars"></tbody></table>');
	}else{
		$('#frmEditarFila').append('<table id="tblMasterDeudaOT" class="table table-striped table-bordered table-condensed table-hover"><thead><tr>'+
			'<th>idO</th><th>idC</th><th>Nombre</th><th>Cliente</th><th>Oferta</th><th>IGV</th><th>Total</th><th>Estado</th>'+
			'<th>Corresp.</th><th>Pagado</th><th>Actual</th><th>Comprom.</th><th>% Pagado</th><th></th><th></th></tr></thead>'+
			'<tbody id="viewMasterDeudaOTHandlerbars"></tbody></table>');	
	}
}
</script>
</body>
</html>