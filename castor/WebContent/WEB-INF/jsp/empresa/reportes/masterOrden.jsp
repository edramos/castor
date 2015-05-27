<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Castor | Master OT</title>
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
				<div class="caption">Ordenes de Trabajo</div>
				<div class="actions">							
					<a class="btn btn-icon-only btn-default btn-sm fullscreen" href="#" data-original-title="" title=""></a>
				</div>
			</div>
			<div id="divPortletBody" class="portlet-body">	
				
				<table id="tblMasterOT" class="table table-striped table-bordered table-condensed table-hover">
				<thead>
				<tr>
					<th></th><th></th><th>Nombre</th><th>Ciudad</th><th>Cliente</th><th>Tipo</th>
					<th>Inicio</th><th>Fin</th><th>Estado</th><th></th><th></th>
				</tr>
				</thead>
				
				<tbody id="viewMasterOTHandlerbars">
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
<!-- END PAGE LEVEL PLUGINS -->

<!-- BEGIN PAGE LEVEL SCRIPTS -->
<script src="assets/global/scripts/metronic.js" type="text/javascript"></script>
<script src="assets/admin/layout4/scripts/layout.js" type="text/javascript"></script>
<!-- END PAGE LEVEL SCRIPTS -->
<script>
var aClientes = [];
var aEstados = ["Sin Inicio", "Por iniciar", "Proceso", "Terminado", "Aceptado", "Paralizada"];

jQuery(document).ready(function() {   
	Metronic.init(); // init metronic core components
	Layout.init(); // init current layout
	
	listarClientes();
	listarOT();
});
</script>
<script>
function listarClientes(){
	var html = '';
    $.ajax({
 		url: 'ajaxListarClientes',
 		type: 'post',
 		dataType: 'json',
 		data: '',
 		success: function(clientes){
 			$.each(clientes, function(i, cliente){
 				aClientes[i] = cliente;
 			});			
 		}
 	});
}

function listarOT(){
	var html = '';
    $.ajax({
 		url: 'mostrarMasterOT',
 		type: 'post',
 		dataType: 'json',
 		data: '',
 		success: function(ordenes){
 			$.each(ordenes, function(i, orden){
	 			var source = $("#templateOrdenes").html();
	 			var template = Handlebars.compile(source);
	 			html += template(orden);
 			});		
 			$("#viewMasterOTHandlerbars").html(html);
 			initTable();
 		}
 	});
}
</script>
<script id="templateOrdenes" type="text/x-handlebars-template">
<tr>
	<td>{{idOrden}}</td>
	<td>{{idCliente}}</td>
	<td><a href="ordenPag-{{idOrden}}" target="_blank">{{nombre}}</a></td>
	<td>{{ciudad}}</td>
	<td>{{nombreCliente}}</td>
	<td>{{tipoTrabajo}}</td>
	<td>{{fechaInicio}}</td>
	<td>{{fechaEntrega}}</td>
	<td>{{estado}}</td>
	<td><a class="btn default btn-xs edit" href="javascript:;"><i class="fa fa-edit"></i> Editar</a></td>
	<td style="text-align:center;"><a class="btn default btn-xs red delete" href="javascript:;"><i class="fa fa-trash-o"></i></a></td>
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
<script>
function initTable(){
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
        var nombre = aData[3].split(">");
        
        jqTds[1].innerHTML = '<input id="txtNombre" type="text" class="form-control input-sm" name="nombre" value="' + nombre[1].slice(0,-3) + '">';
        jqTds[3].innerHTML = '<select id="sltClientes"></select>';
        jqTds[7].innerHTML = '<select id="sltEstadoObra"></select>';
        jqTds[8].innerHTML = '<a class="btn default btn-xs edit" href=""><i class="fa fa-check"></i> Grabar</a>';
        jqTds[9].innerHTML = '<a class="btn default btn-xs cancel" href=""><i class="fa fa-close"></i> Cancelar</a>';
        
        for(var i = 0; i < aClientes.length; i++){
       		$('<option/>').val(aClientes[i].idCliente).html(aClientes[i].nombre).appendTo('#sltClientes');
        }
        $('#sltClientes').val(aData[2]);
        
        for(var i = 0; i < aEstados.length; i++){
       		$('<option/>').val(aEstados[i]).html(aEstados[i]).appendTo('#sltEstadoObra');
        }
        $('#sltEstadoObra').val(aData[9]);
	}

	function cancelEditRow(oTable, nRow){
        var jqInputs = $('input', nRow);
        
        oTable.fnUpdate(jqInputs[0].value, nRow, 0, false);
        oTable.fnUpdate(jqInputs[1].value, nRow, 1, false);
        
        oTable.fnUpdate('<a class="edit" href="">Editar</a>', nRow, 8, false);
        
        oTable.fnDraw();
	}
	
	var table = $('#tblMasterOT');
	
	function fnFormatDetails(oTable, nTr){
	    var aData = oTable.fnGetData(nTr);
	    var html = '';
	    
	    $.ajax({
	 		url: 'ajaxListarCuentas-pagar-' + aData[1],
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
	
	
    var oTable = table.dataTable({

        // Uncomment below line("dom" parameter) to fix the dropdown overflow issue in the datatable cells. The default datatable layout
        // setup uses scrollable div(table-scrollable) with overflow:auto to enable vertical scroll(see: assets/global/plugins/datatables/plugins/bootstrap/dataTables.bootstrap.js). 
        // So when dropdowns used the scrollable div should be removed. 
        //"dom": "<'row'<'col-md-6 col-sm-12'l><'col-md-6 col-sm-12'f>r>t<'row'<'col-md-5 col-sm-12'i><'col-md-7 col-sm-12'p>>",

        "lengthMenu": [
            [5, 15, 20, -1],
            [5, 15, 20, "All"] // change per page values here
        ],

        // Or you can use remote translation file
        //"language": {
        //   url: '//cdn.datatables.net/plug-ins/3cfcc339e89/i18n/Portuguese.json'
        //},

        // set the initial value
        "pageLength": 10,

        "language": {
            "lengthMenu": " _MENU_ records"
        },
        "columnDefs": [
        { 
        	"visible": false, "targets": [1,2] 
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
    
    var tableWrapper = $("#tblMasterOT_wrapper");

    tableWrapper.find(".dataTables_length select").select2({
        showSearchInput: false //hide search box with special css class
    }); // initialize select2 dropdown
    
    table.on('click', ' tbody td .row-details', function (){
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
            /* Currently editing - but not this row - restore the old before continuing to edit mode */
            restoreRow(oTable, nEditing);
            
            editRow(oTable, nRow);
            nEditing = nRow;
        }else if(nEditing == nRow && this.innerHTML == "Grabar"){
        	;
        }else{
        	/* No se esta editando ninguna fila, empezemos a editar */
            editRow(oTable, nRow);
            nEditing = nRow;
        }

    });
}
</script>
</body>
</html>