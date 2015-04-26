<!DOCTYPE html>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Castor | Crear Factura</title>
<jsp:include page="../comps/headMandatory.jsp"/>
<!-- BEGIN PAGE LEVEL STYLES -->
<link rel="stylesheet" type="text/css" href="assets/global/plugins/select2/select2.css"/>
<link rel="stylesheet" type="text/css" href="assets/global/plugins/datatables/extensions/Scroller/css/dataTables.scroller.min.css"/>
<link rel="stylesheet" type="text/css" href="assets/global/plugins/datatables/extensions/ColReorder/css/dataTables.colReorder.min.css"/>
<link rel="stylesheet" type="text/css" href="assets/global/plugins/datatables/plugins/bootstrap/dataTables.bootstrap.css"/>
<!-- END PAGE LEVEL STYLES -->
<style>
hr {
	margin: 20px 0px 0px 0px;	
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

<form:form id="frmCrearFactura" class="form-horizontal" commandName="cuentaBean">
<div class="row">
	<div class="col-md-12">
		<div class="portlet box blue-hoki">
			<div class="portlet-title">
				<div class="caption"><i class="icon-share"></i>Crear Factura</div>
				<div class="tools">
					<a title="" data-original-title="" href="javascript:;" class="collapse"></a>
					<a title="" data-original-title="" href="#portlet-config" data-toggle="modal" class="config"></a>
					<a title="" data-original-title="" href="javascript:;" class="fullscreen"></a>
				</div>
			</div>
			<div class="portlet-body form">
				<div class="form-body">
				
					<div class="row">
						
						<div class="col-md-2">
							<select id="sltTipoFactura" class="form-control" name="operacion">
								<option value="Emitir">Emitir</option>
								<option value="Registrar">Registrar</option>
							</select>							
						</div>
						<div id="divSltOT" class="col-md-3">
							<select id="sltOT" class="form-control" name="idOrden">
								<option value="">Seleccione OT</option>
							</select>
						</div>
						<div id="divSltCuentas" class="col-md-3">
							<select id="sltCuentas" class="form-control" name="idCuenta">
								<option value="">Seleccione Cuenta Cobrar</option>
							</select>	
						</div>
						<div  class="col-md-2">
							<input id="txtCodigoFactura" class="form-control" placeholder="Cod. Factura" name="codigo" disabled="disabled"/>
						</div>
						<div class="col-md-2">
							<button id="btnEmitirFactura" type="button" class="eventBtn btn yellow">Crear Factura</button>	
						</div>
						
					</div>
					
					<hr/>
					
					<div class="detailPane">
						<div class="summaryBody sectionBody">
							<div class="summaryBodyLeft">
								<div id="divClienteProveedor" class="summaryBodyItem">
									<span class="spanLabel">Cliente</span><span id="spnNombreCliente" class="value"></span>
								</div>
								<div class="summaryBodyItem">
									<span class="spanLabel">Nombre</span><span id="spnNombre" class="value"></span>
								</div>
								<div class="summaryBodyItem">
									<span class="spanLabel">Tipo OT</span><span id="spnTipo" class="value"></span>
								</div>
								<div id="divTrabajo" class="summaryBodyItem">
									<span class="spanLabel">Trabajo</span><span id="spnTrabajoCliente" class="value"></span>
								</div>
							</div>
							<div class="summaryBodyMiddle">
								<div class="summaryBodyItem">
									<span class="spanLabel">Monto</span><span id="spnMonto" class="value"></span>
								</div>
								<div class="summaryBodyItem">
									<span class="spanLabel">IGV</span><span id="spnIgv" class="value"></span>
								</div>
								<div class="summaryBodyItem">
									<span class="spanLabel">Monto + IGV</span><span id="spnConIgv" class="value"></span>
								</div>
								<div class="summaryBodyItem">
									<span class="spanLabel">Detraccion</span><span id="spnDetraccion" class="value"></span>
								</div>
							</div>
							<div class="summaryBodyRight">
								<div id="divAccionCuenta" class="summaryBodyItem">
									<span class="spanLabel">Cobrar</span><span id="spnCobrar" class="value"></span>
								</div>
								<div class="summaryBodyItem">
									<span class="spanLabel">Vence</span><span id="spnVence" class="value"></span>
								</div>
								<div class="summaryBodyItem">
									<span class="spanLabel">Creador (Cuenta)</span><span id="spnNombreCreadorCuenta" class="value"></span>
								</div>
								<div class="summaryBodyItem">
									<span class="spanLabel">Creacion (Cuenta)</span><span id="spnFechaCrecionCuenta" class="value"></span>
								</div>
							</div>
						
						</div>
					</div>
				
				</div>
			</div>
		</div>
	</div>
</div>
</form:form>

<div class="row">
	<div class="col-md-12">
		<div class="portlet box blue-hoki">
			<div class="portlet-title">
				<div class="caption"><i class="icon-share"></i>Facturas</div>
				<div class="actions">							
					<a class="btn btn-icon-only btn-default btn-sm fullscreen" href="#" data-original-title="" title=""></a>
				</div>
			</div>
			<div id="divPortletBody" class="portlet-body">
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
<!-- END PAGE LEVEL SCRIPTS -->
<script>
jQuery(document).ready(function() {   
	Metronic.init(); // init metronic core components
	Layout.init(); // init current layout
	
	listarFacturas();
	
	 $("#btnEmitirFactura").click(function(){
		 var idCuenta = $('#divSltCuentas option:selected').val();
		 if(idCuenta != ''){
			var detraArr = $('#spnDetraccion').text().split("  ");
			var det = detraArr[1].slice(0,-2);
			var detraccion = det.slice(1);
         	emitirFactura(idCuenta, detraccion);
		 }
    });
});
</script>
<script id="templateResultado" type="text/x-handlebars-template">
<tr>
	<td style="width: 0px;display: none;">{{idFactura}}</td>
	<td>{{codigo}}</td>
	<td>{{subTotal}}</td>
	<td>{{igv}}</td>
	<td>{{conIgv}}</td>
	<td>{{montoDetraccion}} ({{detraccion}}%)</td>
	<td>{{cobrarFactura}}</td>
	<td>{{#ifDet estadoDetraccion Cancelado}}<span class="label label-success">{{estadoDetraccion}}</span>{{else}}{{estadoDetraccion}}{{/ifDet}}</td>
	<td>{{#ifFactura estado Cancelado}}<span class="label label-success">{{estado}}</span>{{else}}{{estado}}{{/ifFactura}}</td>
	<td>{{fechaEmision}}</td>
</tr>
</script>
<script>
function listarFacturas(){
	var html = '';
	Handlebars.registerHelper('ifFactura', function(estado, v2, options){
		  if(estado === 'Cancelado'){return options.fn(this);}return options.inverse(this);
	});
	Handlebars.registerHelper('ifDet', function(estadoDetraccion, v2, options){
		  if(estadoDetraccion === 'Cancelado'){return options.fn(this);}return options.inverse(this);
	});
	
	$.ajax({
 		url: 'cargarFacturasEmpresa',
 		type: 'post',
 		dataType: 'json',
 		success: function(registros){
 			removeTable();
 			createTable();
 			$.each(registros, function(i, registro){
	 			var source = $("#templateResultado").html();
	 			var template = Handlebars.compile(source);
	 			html += template(registro);
 			});
 			
 			$("#viewResultadosHandlerbars").html(html);
 			initTable();
 		}
 	});
}
function removeTable(){
	$('#tblResultados').remove();
	$('#tblResultados_wrapper').remove();
}
function createTable(){
	$('#divPortletBody').append(
		"<table class='table table-striped table-hover' id='tblResultados'>"+
		"<thead><tr><th style='width: 0px;display: none;'></th><th>N°</th><th>Monto</th><th>IGV</th><th>Mon + IGV</th><th>Detraccion</th>"+
		"<th>Cobrar</th><th>Estado Det.</th><th>Estado Fac.</th><th>Emision</th></thead>"+
		"<tbody id='viewResultadosHandlerbars'></tbody></table>"	
	);
}
function borrarDatos(){
	$('.form-control').val('');
	$('#sltTipoFactura').find('option:first').attr('selected', 'selected');
	$('#sltOT').find('option:first').attr('selected', 'selected');
	$('#sltCuentas').find('option:first').attr('selected', 'selected');
}
</script>
<script>
function initTable(){
    var table = $('#tblResultados');

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

        "order": [
            [0, 'asc']
        ],
        
        "lengthMenu": [
            [10, 25, 50, -1],
            [10, 25, 50, "Todos"] // change per page values here
        ],
        // set the initial value
        "pageLength": 10,

        "dom": "<'row' <'col-md-12'T>><'row'<'col-md-6 col-sm-12'l><'col-md-6 col-sm-12'f>r><'table-scrollable't><'row'<'col-md-5 col-sm-12'i><'col-md-7 col-sm-12'p>>", // horizobtal scrollable datatable

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
    	
    	/* if (aData != null){
    		$('#divInitCajaChica').hide();
    		$('#divCrearDetalleLibro').hide();
    		mostrarDetalle(aData[0]);
    		$('#divRegistroDetalle').show();
    	} */
    });
}
</script>
<script>
function emitirFactura(idCuenta, detraccion){
	$.ajax({
 		url: 'crearFacturaAjax-' + idCuenta + '-cobro-' + detraccion,
 		type: 'post',
 		dataType: 'json',
 		data: $('#frmCrearFactura').serialize(),
 		success: function(facturas){
 			borrarDatos();
 			listarFacturas();
 		}
 	});
}
</script>
<script>
$('#sltTipoFactura').change(function(){
	var value = $('#sltTipoFactura option:selected').val();
	
	if(value == "Emitir"){
		$('#txtCodigoFactura').prop('disabled', true);
		
		$('#sltOT').remove();
		$('#divSltOT').append('<select id="sltOT" class="form-control" name="operacion"><option value="">Seleccione OT</option></select>');
		$('#sltCuentas').remove();
		$('#divSltCuentas').append('<select id="sltCuentas" class="form-control" name="operacion"><option value="">Seleccione Cuenta Cobrar</option></select>');
		
		$('#divClienteProveedor').empty();
		$('#divClienteProveedor').append('<span class="spanLabel">Cliente</span><span id="spnNombreCliente" class="value"></span>');
		$('#divTrabajo').empty();
		$('#divTrabajo').append('<span class="spanLabel">Trabajo</span><span id="spnTrabajoCliente" class="value"></span>');
		$('#divAccionCuenta').empty();
		$('#divAccionCuenta').append('<span class="spanLabel">Cobrar</span><span id="spnCobrar" class="value"></span>');
		
		listarOT();
		
		$('#sltOT').on('change', function(){
			$('#sltCuentas').remove();
			$('#divSltCuentas').append('<select id="sltCuentas" class="form-control" name="operacion"><option value="">Seleccione Cuenta Cobrar</option></select>');
			var idOrden = $('#sltOT option:selected').val();
			
			listarDetalleFactura(idOrden, "cobrar");
			listarCuentas(idOrden, "cobrar");
			
			$('#sltCuentas').on('change', function(){
				var idCuenta = $('#sltCuentas option:selected').val();
				listarDetalleCuenta(idCuenta, "cobrar");
			});
			
		});
		
	}else{
		$('#txtCodigoFactura').prop('disabled', false);
		
		$('#sltOT').remove();
		$('#divSltOT').append('<select id="sltOT" class="form-control" name="operacion"><option value="">Seleccione OT</option></select>');
		$('#sltCuentas').remove();
		$('#divSltCuentas').append('<select id="sltCuentas" class="form-control" name="operacion"><option value="">Seleccione Cuenta Pagar</option></select>');
		
		$('#divClienteProveedor').empty();
		$('#divClienteProveedor').append('<span class="spanLabel">Proveedor</span><span id="spnNombreProveedor" class="value"></span>');
		$('#divTrabajo').empty();
		$('#divTrabajo').append('<span class="spanLabel">Trabajo</span><span id="spnTrabajoProveedor" class="value"></span>');
		$('#divAccionCuenta').empty();
		$('#divAccionCuenta').append('<span class="spanLabel">Pagar</span><span id="spnPagar" class="value"></span>');
		
		listarOT();
		
		$('#sltOT').on('change', function(){
			$('#sltCuentas').remove();
			$('#divSltCuentas').append('<select id="sltCuentas" class="form-control" name="operacion"><option value="">Seleccione Cuenta Pagar</option></select>');
			var idOrden = $('#sltOT option:selected').val();
			
			listarDetalleFactura(idOrden, "pagar");
			listarCuentas(idOrden, "pagar");
			
			$('#sltCuentas').on('change', function(){
				var idCuenta = $('#sltCuentas option:selected').val();
				listarDetalleCuenta(idCuenta, "pagar");
			});
		});
	}
});

function listarDetalleCuenta(idCuenta, tipo){
	if(idCuenta != ""){
		$.ajax({
	 		url: 'ajaxDetalleCuenta-' + tipo + '-' + idCuenta,
	 		type: 'post',
	 		dataType: 'json',
	 		data: '',
	 		success: function(cuenta){
	 			$('#spnMonto').text(cuenta.monto);
	 			$('#spnIgv').text(cuenta.igv);
	 			$('#spnConIgv').text(cuenta.conIgv);
	 			$('#spnDetraccion').text(cuenta.montoDetraccion);
	 			$('#spnCobrar').text(cuenta.cobrar);
	 			$('#spnVence').text(cuenta.fechaVencimiento);
	 			$('#spnNombreCreadorCuenta').text(cuenta.nombreCreador);
	 			$('#spnFechaCrecionCuenta').text(cuenta.fechaCreacion);
	 			
	 			$('#spnNombreProveedor').text(cuenta.nombreProveedor);
	 			$('#spnTrabajoProveedor').text(cuenta.scTipoTrabajo);
	 			$('#spnPagar').text(cuenta.cobrar);
	 		}
	 	});
	}
}
function listarCuentas(idOrden, tipo){
	if(idOrden != ""){
		$.ajax({
	 		url: 'ajaxListarCuentasFactura-' + tipo + '-' + idOrden,
	 		type: 'post',
	 		dataType: 'json',
	 		data: '',
	 		success: function(cuentascobrar){
	 			$.each(cuentascobrar, function(i, cuenta){
	 				$('#sltCuentas').append('<option value="' + cuenta.idCuenta + '">' + cuenta.monto + '&nbsp;&nbsp(' + cuenta.fechaVencimiento + ')</option>');
	 			});	 	        
	 		},
	 		async: false
	 	});
	}
}
function listarDetalleFactura(idOrden, tipo){
	if(idOrden != ""){
		$.ajax({
	 		url: 'ajaxObtenerInformacionOrden-tipo-' + idOrden,
	 		type: 'post',
	 		dataType: 'json',
	 		data: '',
	 		success: function(orden){
	 			$('#spnNombreCliente').text(orden.nombreCliente);
	 			$('#spnNombre').text(orden.nombre);
	 			if(orden.tipoOrden == 'OC'){
	 				$('#spnTipo').text('Obra Civil');	
	 			}else{
	 				$('#spnTipo').text('Trabajos Varios');	
	 			}
	 			
	 			$('#spnTrabajoCliente').text(orden.tipoTrabajo);
	 		}
	 	});
	}
}
function listarOT(){
	$.ajax({
 		url: 'ajaxBuscarOrdenFactura',
 		type: 'post',
 		dataType: 'json',
 		data: '',
 		success: function(ordenes){
 			$.each(ordenes, function(i, orden){
 				$('#sltOT').append('<option value="' + orden.idOrden + '">' + orden.codigo + '</option>');
 			});
 		}
 	});
}

</script>
</body>
</html>