<!DOCTYPE html>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Castor | Caja Banco</title>
<jsp:include page="../comps/headMandatory.jsp"/>
<!-- BEGIN PAGE LEVEL STYLES -->
<link rel="stylesheet" type="text/css" href="assets/global/plugins/select2/select2.css"/>
<link rel="stylesheet" type="text/css" href="assets/global/plugins/datatables/extensions/Scroller/css/dataTables.scroller.min.css"/>
<link rel="stylesheet" type="text/css" href="assets/global/plugins/datatables/extensions/ColReorder/css/dataTables.colReorder.min.css"/>
<link rel="stylesheet" type="text/css" href="assets/global/plugins/datatables/plugins/bootstrap/dataTables.bootstrap.css"/>
<link rel="stylesheet" type="text/css" href="assets/global/plugins/bootstrap-datepicker/css/datepicker.css"/>
<link rel="stylesheet" type="text/css" href="assets/global/plugins/typeahead/typeahead.css">
<!-- END PAGE LEVEL STYLES -->
</head>
<style>
.ui-autocomplete{
	position:absolute;
	top:0;
	left:0;
	cursor:default
}
.tt-hint, .tt-input {
	color: #000000;
}
</style>
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
	
		<div id="divInitCajaBanco" class="portlet box blue-hoki">
			<div class="portlet-title">
				<div class="caption"><i class="icon-share"></i>Caja Banco</div>
				<div class="actions">
					<select id="sltCuentaBanco" class="form-control-head" name="idLibro">
						<option value="1">BCP Dolares</option>
						<option value="2">BCP Soles</option>
						<option value="3">Banco Nacion</option>
					</select>
					<a id="btnToCrearDetalleLibro" class="btn green-meadow btn-sm eventBtn"><i class="fa fa-plus"></i> Nuevo </a>							
					<a class="btn btn-icon-only btn-default btn-sm fullscreen" href="#" data-original-title="" title=""></a>
				</div>
			</div>
			<div class="portlet-body form">
			</div>
		</div>
		
		<div id="divRegistroDetalle" class="portlet box blue-hoki" style="display: none;">
			<div class="portlet-title">
				<div class="caption"><i class="icon-share"></i>Caja Banco - Detalle</div>
				<div class="actions">
					<select id="sltCuentaBanco" class="form-control-head" name="idLibro">
						<option value="1">BCP Dolares</option>
						<option value="2">BCP Soles</option>
						<option value="3">Banco Nacion</option>
					</select>
					<a id="btnEditarDetalleLibro" class="btn green-meadow btn-sm eventBtn"><i class="fa fa-pencil"></i> Editar </a>
					<a id="btnCancelarDetalleLibro" class="btn red-sunglo btn-sm eventBtn"><i class="fa fa-close"></i> Cancelar </a>							
					<a class="btn btn-icon-only btn-default btn-sm fullscreen" href="#" data-original-title="" title=""></a>
				</div>
			</div>
			<div class="portlet-body form">
				<div class="form-body">
					<div id="divMostarRegistroDetalle" class="detailPane">
					</div>
				</div>
			</div>
		</div>

	
		<form:form id="frmCrearDetalleLibro" class="form-horizontal" commandName="libroDetalleBean">
		<div id="divCrearDetalleLibro" class="portlet box blue-hoki" style="display: none;">
			<div class="portlet-title">
				<div class="caption"><i class="icon-share"></i>Caja Banco - Nuevo</div>
				<div class="actions">
					<select id="sltCuentaBanco" class="form-control-head" name="idLibro">
						<option value="1">BCP Dolares</option>
						<option value="2">BCP Soles</option>
						<option value="3">Banco Nacion</option>
					</select>
					<a id="btnCrearDetalleLibro" class="btn green-meadow btn-sm eventBtn"><i class="fa fa-check"></i> Grabar </a>
					<a id="btnCancelarCrearCajaBanco" class="btn red-sunglo btn-sm eventBtn"><i class="fa fa-close"></i> Cancelar </a>							
					<a class="btn btn-icon-only btn-default btn-sm fullscreen" href="#" data-original-title="" title=""></a>
				</div>
			</div>
			<div class="portlet-body form">
				<div class="form-body">

					<div class="row">
						<div class="col-md-12">
							<div id="divFirstRow" class="form-group">
								<div class="col-md-3">
									<div id="txtFechaOperacion" class="input-group date date-picker margin-bottom-5" data-date-format="dd/mm/yyyy">
										<input type="text" class="form-control form-filter valid" placeholder="Fecha Operacion" name="fechaOperacion" aria-required="true" aria-invalid="false">												
										<span class="input-group-btn"><button class="btn default" type="button"><i class="fa fa-calendar"></i></button></span>
									</div>
								</div>
								<div class="col-md-2">
									<select id="sltTipoTransaccion" class="form-control" name="operacion">
										<option value="Ingreso">Ingreso</option>
										<option value="Egreso">Egreso</option>
									</select>
								</div>
								<div class="col-md-3">
									<select id="sltTransaccion" class="form-control" name="tipoOperacion">
										<option value="Cobranza Venta/Servicio">Cobranza Venta/Servicio</option>
										<option value="Detraccion">Detraccion</option>
										<option value="Otra cobranza">Otra cobranza</option>
										<option value="Transferencia cuenta">Transferencia cuenta</option>
										<option value="Interese ganado">Interes ganado</option>
									</select>
								</div>
								<div class="col-md-2 dynamic">
									<input id="txtMonto" class="form-control" placeholder="Monto" name="conIgv"/>
								</div>
								<div class="col-md-2 dynamic">
									<input id="txtCobrarFactura" class="form-control" placeholder="Cobrar" name="monto"/>
								</div>								
							</div>
						</div>
					</div>
					
					
					<div class="row">
						<div class="col-md-12">
							<div id="divSecondRow" class="form-group">
								<div class="col-md-3 dynamic">	
									<select id="sltCliente" class="form-control" name="idCliente"></select>
								</div>
								<div class="col-md-2 dynamic">		
									<input id="txtFactura" type="text" class="form-control" placeholder="Factura" name="factura"/>	
								</div>
								<div class="col-md-3 dynamic">
									<input id="txtOrdenTrabajo" class="form-control" placeholder="Orden Trabajo" name="codigoOrden"/>
									<input id="hdnOrdenTrabajo" type="hidden" name="idOrden"/>	
								</div>
								<div class="col-md-2 dynamic">
									<input id="txtDetraccion" class="form-control" placeholder="Detraccion" name="montoDetraccion"/>	
								</div>
							</div>
						</div>
					</div>	
					
					<div class="row">
						<div class="col-md-12">
							<div class="form-group">
								<div class="col-md-12">
									<input id="txtDescripcion" class="form-control" placeholder="Descripcion..." name="descripcion"/>
								</div>
							</div>
						</div>
					</div>
					
				</div>
			</div>
		
		</div>
		</form:form>
			
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
<script type="text/javascript" src="assets/global/plugins/bootstrap-datepicker/js/bootstrap-datepicker.js"></script>
<script type="text/javascript" src="assets/global/plugins/datatables/media/js/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="assets/global/plugins/datatables/extensions/TableTools/js/dataTables.tableTools.min.js"></script>
<script type="text/javascript" src="assets/global/plugins/datatables/extensions/ColReorder/js/dataTables.colReorder.min.js"></script>
<script type="text/javascript" src="assets/global/plugins/datatables/extensions/Scroller/js/dataTables.scroller.min.js"></script>
<script type="text/javascript" src="assets/global/plugins/datatables/plugins/bootstrap/dataTables.bootstrap.js"></script>
<script src="assets/global/plugins/typeahead/typeahead.bundle.min.js" type="text/javascript"></script>
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
	Demo.init();
	
	$('#txtFechaOperacion').datepicker({
		format: 'dd/mm/yyyy',
		autoclose: true,
		language: "es"
	});
	
	listarSelectorClientes('sltCliente');
	listarCaja();
	suggestFactura("cobrar");
	
	$('#sltCuentaBanco').change(function(){
		listarCaja();
	});
});
</script>
<script>
function suggestFactura(tipo){
	var facturas = new Bloodhound({
		datumTokenizer: function (datum) {return Bloodhound.tokenizers.whitespace(datum.value);},
		queryTokenizer: Bloodhound.tokenizers.whitespace,
		remote: 'ajaxListarFacturaSuggest?q=%QUERY' + '-' + tipo	//Workaround mientras aprendo como enviar mas parametros aparte de la cadena de busqueda
	});
	
	facturas.initialize();
	
	$('#txtFactura').typeahead({minLength: 1,}, {
		displayKey: 'codigo',
		source: facturas.ttAdapter(),
		templates: {
			suggestion: Handlebars.compile([
				'{{codigo}} - {{subTotal}}',
			].join(''))
		}
	});
		
	$('#txtFactura').on('typeahead:selected', function (e, datum) {   
		$('#hdnIdFactura').remove();
		$('#divSecondRow').append("<input id='hdnIdFactura' type='hidden' name='idFactura' value='" + datum['idFactura'] + "'/>");
		$('#txtMonto').val(datum['subTotal']);
		$('#txtCobrarFactura').val(datum['cobrarFactura']);
		$('#txtPagarFactura').val(datum['cobrarFactura']);
		$('#txtDetraccion').val(datum['montoDetraccion']);
		
		mostrarOrden(datum['idFactura']);
	});
}
function suggestFacturaDetraccion(){
	var facturas = new Bloodhound({
		datumTokenizer: function (datum) {return Bloodhound.tokenizers.whitespace(datum.value);},
		queryTokenizer: Bloodhound.tokenizers.whitespace,
		remote: 'ajaxListarFacturaDetraccionSuggest?q=%QUERY'
	});
	facturas.initialize();
	
	$('#txtFactura').typeahead({minLength: 1,}, {
		displayKey: 'codigo',
		source: facturas.ttAdapter(),
		templates: {
			suggestion: Handlebars.compile([
				'{{codigo}} - {{montoDetraccion}}',
			].join(''))
		}
	});
		
	$('#txtFactura').on('typeahead:selected', function (e, datum) {   
		$('#hdnIdFactura').remove();
		$('#divSecondRow').append("<input id='hdnIdFactura' type='hidden' name='idFactura' value='" + datum['idFactura'] + "'/>");
		$('#txtMonto').val(datum['montoDetraccion']);
			
		mostrarOrden(datum['idFactura']);
	});
}
function mostrarOrden(idFactura){
	$.ajax({
 		url: 'ajaxBuscarOrdenCaja-' + idFactura,
 		type: 'post',
 		dataType: 'json',
 		data: '',
 		success: function(ordenes){
 			html = '';
 			$.each(ordenes, function(i, orden){
	 			$('#txtOrdenTrabajo').val(orden.codigo); 
	 			$('#hdnOrdenTrabajo').val(orden.idOrden);
 			});		      
 		}
 	});
}
</script>
<script> 
$(function($){
	var locations = {
	    'Ingreso': ['Cobranza Venta/Servicio', 'Detraccion', 'Otra cobranza', 'Transferencia cuenta', 'Interes ganado'],
		'Egreso': ['Pago Proveedor', 'Detraccion', 'Pago Planilla/Beneficios', 'Compra', 'Tributo', 'Transferencia cta.', 'Reembolso Caja Chica', 'Gasto Financiero'],
	}
	
	$('#sltTipoTransaccion').change(function(){
        var country = $(this).val(), lcns = locations[country] || [];
        var html = $.map(lcns, function(lcn){
            return '<option value="' + lcn + '">' + lcn + '</option>'
        }).join('');
        
        $('#sltTransaccion').html(html);
        var value = $('#sltTipoTransaccion option:selected').text();
        
        if(value == 'Ingreso'){
        	formDynamic('#templateCobranzaVentaServicio');
        	listarSelectorClientes('sltCliente');
        	suggestFactura("cobrar");
        }else{
        	formDynamic('#templatePagoProveedor');
        	listarSelectorProveedores('sltProveedor');
        	suggestFactura("pagar");
        }
    });
	
	$('#sltTransaccion').change(function(){
		var value = ($('#sltTransaccion option:selected').text());
		var html = '';
		
		switch(value){
		//INGRESOS
		case 'Cobranza Venta/Servicio':
			formDynamic('#templateCobranzaVentaServicio');
			listarSelectorClientes('sltCliente');
			suggestFactura("cobrar");
			break;
		case 'Detraccion':
			formDynamic('#templateDetraccion');
			listarSelectorClientes('sltCliente');
			suggestFacturaDetraccion();
			break;
		case 'Otra cobranza':
			formDynamic('#templateOtraCobranza');
			listarSelectorClientes('sltCliente');
			suggestFactura("cobrar");
			break;
		case 'Transferencia cuenta':
			formDynamic('#templateTransferenciaCuentaIngreso');
			break;
		case 'Interes ganado':
		formDynamic('#templateCodigoOperacion');
			break;
		//EGRESOS
		case 'Pago Proveedor':
			formDynamic('#templatePagoProveedor');
			break;
		case 'Pago Planilla/Beneficios':
			formDynamic('#templatePagoPlanillaBeneficios');
			break;
		case 'Compra':
			formDynamic('#templateCompra');
			break;
		case 'Tributo':
			formDynamic('#templateCodigoOperacion');
			break;
		case 'Transferencia cta.':
			formDynamic('#templateTransferenciaCuentaEgreso');
			break;
		case 'Reembolso Caja Chica':
			formDynamic('#templateCodigoOperacion');
			break;
		case 'Gasto Financiero':
			formDynamic('#templateCodigoOperacion');
			break;
		}
	});
});

$(document).on('click','.eventBtn', function(e){
	switch(this.id){
	case "btnToCrearDetalleLibro":
		$('#divInitCajaBanco').hide();
		$('#divCrearDetalleLibro').show();
		break;
	case "btnCrearDetalleLibro":
		crearDetalleLibro();
		break;
	case "btnCancelarCrearCajaBanco":
		$('#divCrearDetalleLibro').hide();
		$('#divInitCajaBanco').show();
		break;
	case "btnCancelarDetalleLibro":
		$('#divRegistroDetalle').hide();
		$('#divCrearDetalleLibro').hide();
		$('#divInitCajaBanco').show();
		break;
	}
});
</script>
<script>
function formDynamic(opcion){
	$('.dynamic').remove();
	
	switch(opcion){
	case "#templateCobranzaVentaServicio":
		$('#divFirstRow').append('<div class="col-md-2 dynamic"><input id="txtMonto" class="form-control" placeholder="Monto" name="conIgv"/></div>'+
		'<div class="col-md-2 dynamic"><input id="txtCobrarFactura" class="form-control" placeholder="Cobrar" name="monto"/></div>');
		break;
	case "#templatePagoProveedor":
		$('#divFirstRow').append('<div class="col-md-2 dynamic"><input id="txtMonto" class="form-control" placeholder="Monto" name="conIgv"/></div>'+
		'<div class="col-md-2 dynamic"><input id="txtPagarFactura" class="form-control" placeholder="Pagar" name="monto"/></div>');
		break;
	default:
		$('#divFirstRow').append('<div class="col-md-2 dynamic"><input id="txtMonto" class="form-control" placeholder="Monto" name="monto"/></div>');
		break;
	}
	
	/* if(opcion == '#templateCobranzaVentaServicio'){
		$('#divFirstRow').append('<div class="col-md-2 dynamic"><input id="txtMonto" class="form-control" placeholder="Monto" name="conIgv"/></div>'+
			'<div class="col-md-2 dynamic"><input id="txtCobrarFactura" class="form-control" placeholder="Cobrar" name="monto"/></div>');
	}else{
		$('#divFirstRow').append('<div class="col-md-2 dynamic"><input id="txtMonto" class="form-control" placeholder="Monto" name="conIgv"/></div>'+
			'<div class="col-md-2 dynamic"><input id="txtPagarFactura" class="form-control" placeholder="Pagar" name="monto"/></div>');
	} */
	
	var source = $(opcion).html();
	var template = Handlebars.compile(source);
	html = template();
	$('#divSecondRow').html(html);
	
	
}
</script>
<script>
function listarSelectorClientes(nombreSelector){
	var html = '';
    $.ajax({
 		url: 'ajaxListarClientes',
 		type: 'post',
 		dataType: 'json',
 		data: '',
 		success: function(clientes){
 			html = '';
 			$.each(clientes, function(i, cliente){
	 			var source = $("#templateSelectorClientes").html();
	 			var template = Handlebars.compile(source);
	 			html += template(cliente);
	 			
 			});		
 			$("#" + nombreSelector).html(html);	        
 		},
 		complete: function() {	 			
 			
  		}
 	});
}
function listarSelectorProveedores(nombreSelector){
	var html = '';
    $.ajax({
 		url: 'ajaxListarProveedores',
 		type: 'post',
 		dataType: 'json',
 		data: '',
 		success: function(proveedores){
 			html = '';
 			$.each(proveedores, function(i, proveedor){
	 			var source = $("#templateSelectorProveedores").html();
	 			var template = Handlebars.compile(source);
	 			html += template(proveedor);	 			
 			});		
 			$("#" + nombreSelector).html(html);	        
 		},
 		complete: function() {	 			
 			
  		}
 	});
}
function listarCaja(){
	var html = '';
	$.ajax({
 		url: 'listarDetalleLibro-' + $('#sltCuentaBanco').val(),
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
function crearDetalleLibro(){
	/* if($('#sltTransaccion').val() == "Cobranza Venta/Servicio"){
		$('#txtCobrarFactura').val(Number($('#txtCobrarFactura').val().replace(/[^0-9\.]+/g,"")));
	}
	if($('#sltTransaccion').val() == "Detraccion"){
		$('#txtMonto').val(Number($('#txtMonto').val().replace(/[^0-9\.]+/g,"")));
	}
	if($('#sltTipoTransaccion option:selected').val() == "Ingreso"){
		
	} */
	if($('#txtCobrarFactura').val() != null){
		$('#txtCobrarFactura').val(Number($('#txtCobrarFactura').val().replace(/[^0-9\.]+/g,"")));
	}
	if($('#txtPagarFactura').val() != null){
		$('#txtPagarFactura').val(Number($('#txtPagarFactura').val().replace(/[^0-9\.]+/g,"")));
	}
	if($('#txtDetraccion').val() != null){
		$('#txtDetraccion').val(Number($('#txtDetraccion').val().replace(/[^0-9\.]+/g,"")));
	}
	$('#txtMonto').val(Number($('#txtMonto').val().replace(/[^0-9\.]+/g,"")));
	
	
	$.ajax({
 		url: 'ajaxCrearRegistroLibro',
 		type: 'post',
 		dataType: 'json',
 		data: $('#frmCrearDetalleLibro').serialize(),
 		success: function(resultado){
 			listarCaja();
 			borrarDatos();
 		}
 	});	
}
function removeTable(){
	$('#tblResultados').remove();
	$('#tblResultados_wrapper').remove();
}
function createTable(){
	$('#divPortletBody').append(
		"<table class='table table-striped table-hover' id='tblResultados'><thead><tr><th style='width: 0px;display: none;'></th><th>Fecha</th><th style='width: 20%;'>Tipo Operacion</th><th>Descripcion</th>"+
		"<th>Ingreso</th><th>Egreso</th><th>Saldo</th></tr></thead><tbody id='viewResultadosHandlerbars'></tbody></table>"	
	);
}
function borrarDatos(){
	$('.form-control').val('');
	$('#sltCuentaBanco').find('option:first').attr('selected', 'selected');
	$('#sltTipoTransaccion').find('option:first').attr('selected', 'selected');
	$('#sltTransaccion').find('option:first').attr('selected', 'selected');
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
        "pageLength": 10,

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

function mostrarDetalle(idRegistro){
	var html = '';
	$.ajax({
 		url: 'mostrarDetalleRegistro-' + idRegistro,
 		type: 'post',
 		dataType: 'json',
 		success: function(registros){
 			//removeTable();
 			//createTable();
 			$.each(registros, function(i, registro){
	 			var source = $("#templateDetalleRegistro").html();
	 			var template = Handlebars.compile(source);
	 			html += template(registro);
 			});
 			
 			$("#divMostarRegistroDetalle").html(html);
 			//initTable();
 		}
 	});	
}
</script>
<script id="templateSelectorClientes" type="text/x-handlebars-template">
	<option value="{{idCliente}}">{{nombre}}</option>
</script>
<script id="templateSelectorProveedores" type="text/x-handlebars-template">
	<option value="{{idProveedor}}">{{nombre}}</option>
</script>
<script id="templateDetalleRegistro" type="text/x-handlebars-template">
<div class="summaryBody sectionBody">
	<div class="summaryBodyLeft">
		<div class="summaryBodyItem">
			<span class="spanLabel">Factura</span><span id="spnNombre" class="value">{{factura}}</span>
		</div>
		<div class="summaryBodyItem">
			<span class="spanLabel">Cod. Operacion</span><span id="spnNombreCliente" class="value">{{codigoOperacion}}</span>
		</div>
		<div class="summaryBodyItem">
			<span class="spanLabel">Cuenta Origen</span><span id="spnCreacion" class="value">{{cuentaBancoOrigen}}</span>
		</div>
	</div>
	<div class="summaryBodyMiddle">
		<div class="summaryBodyItem">
			<span class="spanLabel">Cliente</span><span id="spnLat" class="value">{{nombreCliente}}</span>
		</div>
		<div class="summaryBodyItem">
			<span class="spanLabel">Proveedor</span><span id="spnLon" class="value">{{nombreProveedor}}</span>
		</div>
		<div class="summaryBodyItem">
			<span class="spanLabel">Cuenta Destino</span><span id="spnCreacion" class="value">{{cuentaBancoDestino}}</span>
		</div>
	</div>
	<div class="summaryBodyRight">
		<div class="summaryBodyItem">
			<span class="spanLabel">Orden Trabajo</span><span id="spnEntrega" class="value">{{idOrden}}</span>
		</div>
		<div class="summaryBodyItem">
			<span class="spanLabel">Creado por</span><span id="spnCreacion" class="value">Eduardo Ramos</span>
		</div>
		<div class="summaryBodyItem">
			<span class="spanLabel">Creacion</span><span id="spnCreacion" class="value">{{fechaCreacion}}</span>
		</div>
</div>
</script>
<script id="templateResultado" type="text/x-handlebars-template">
<tr>
	<td style="width: 0px;display: none;">{{idDetalleLibro}}</td>
	<td>{{fechaOperacion}}</td>
	<td>{{tipoOperacion}}</td>
	<td>{{descripcion}}</td>
	<td>{{ingreso}}</td>
	<td>{{egreso}}</td>
	<td>{{saldo}}</td>
</tr>
</script>
<!-- EGRESOS -->
<script id="templateCodigoOperacion" type="text/x-handlebars-template">
<div class="col-md-3 dynamic">
	<input id="txtCodigoOperacion" class="form-control" placeholder="Codigo Operacion" name="codigoOperacion"/>
</div>
</script>
<script id="templateTransferenciaCuentaEgreso" type="text/x-handlebars-template">
<div class="col-md-3 dynamic">
	<div class="form-group">
		<div class="col-md-12">
			<input id="txtCuentaDestino" class="form-control" placeholder="Cuenta Destino" name="cuentaBancoDestino"/>
		</div>
	</div>
</div>
<div class="col-md-3 dynamic">
	<div class="form-group">
		<div class="col-md-12">
			<input id="txtCodigoOperacion" class="form-control" placeholder="Codigo Operacion" name="codigoOperacion"/>
		</div>
	</div>
</div>
</script>
<script id="templateCompra" type="text/x-handlebars-template">
<div class="col-md-3 dynamic">
	<div class="form-group">
		<div class="col-md-12">
			<input id="txtProveedor" class="form-control" placeholder="Factura" name="factura"/>
		</div>
	</div>
</div>
</script>
<script id="templatePagoPlanillaBeneficios" type="text/x-handlebars-template">
<div class="col-md-3 dynamic">
	<div class="form-group">
		<div class="col-md-12">
			<input id="txtEmpleado" class="form-control" placeholder="Empleado" name="idEmpleado"/>
		</div>
	</div>
</div>
<div class="col-md-3 dynamic">
	<div class="form-group">
		<div class="col-md-12">
			<input id="txtFactura" class="form-control" placeholder="Codigo Operacion" name="codigoOperacion"/>
		</div>
	</div>
</div>
</script>
<script id="templatePagoProveedor" type="text/x-handlebars-template">
<div class="col-md-3 dynamic">
	<select id="sltProveedor" class="form-control" name="idProveedor"></select>
</div>
<div class="col-md-2 dynamic">
	<input id="txtFactura" class="form-control" placeholder="Factura" name="factura"/>
</div>
<div class="col-md-3 dynamic">
	<input id="txtOrdenTrabajo" class="form-control" placeholder="Orden Trabajo" name="codigoOrden"/>
	<input id="hdnOrdenTrabajo" type="hidden" name="idOrden"/>
</div>
<div class="col-md-2 dynamic">
	<input id="txtDetraccion" class="form-control" placeholder="Detraccion" name="montoDetraccion"/>	
</div>
</script>
<!-- INGRESOS -->
<script id="templateCobranzaVentaServicio" type="text/x-handlebars-template">
<div class="col-md-3 dynamic">	
	<select id="sltCliente" class="form-control" name="idCliente"></select>
</div>
<div class="col-md-2 dynamic">		
	<input id="txtFactura" type="text" class="form-control" placeholder="Factura" name="factura"/>	
</div>
<div class="col-md-3 dynamic">
	<input id="txtOrdenTrabajo" class="form-control" placeholder="Orden Trabajo" name="idOrden"/>
	<input id="hdnOrdenTrabajo" type="hidden" name="idOrden"/>	
</div>
<div class="col-md-2 dynamic">
	<input id="txtDetraccion" class="form-control" placeholder="Detraccion" name="montoDetraccion"/>	
</div>
</script>
<script id="templateOtraCobranza" type="text/x-handlebars-template">
<div class="col-md-3 dynamic">	
	<select id="sltCliente" class="form-control" name="idCliente"></select>
</div>
<div class="col-md-2 dynamic">		
	<input id="txtFactura" type="text" class="form-control" placeholder="Factura" name="factura"/>	
</div>
</script>
<script id="templateDetraccion" type="text/x-handlebars-template">
<div class="col-md-3 dynamic">	
	<select id="sltCliente" class="form-control" name="idCliente"></select>
</div>
<div class="col-md-2 dynamic">		
	<input id="txtFactura" type="text" class="form-control" placeholder="Factura" name="factura"/>	
</div>
<div class="col-md-3 dynamic">
	<input id="txtOrdenTrabajo" class="form-control" placeholder="Orden Trabajo"/>
	<input id="hdnOrdenTrabajo" type="hidden" name="idOrden"/>	
</div>
</script>
<script id="templateTransferenciaCuentaIngreso" type="text/x-handlebars-template">
<div class="col-md-3 dynamic">
	<input id="txtCuentaDestino" class="form-control" placeholder="Cuenta Origen" name="cuentaBancoOrigen"/>
</div>
<div class="col-md-3 dynamic">
	<input id="txtCodigoOperacion" class="form-control" placeholder="Codigo Operacion" name="codigoOperacion"/>
</div>
</script>
<script id="templateSearchResultEmpleado" type="text/x-handlebars-template">
	<div class="detailCardPane ui-menu-item" id="empleado_{{idEmpleado}}" style="cursor: pointer;">
		<div class="">
			<div></div>												
			<div class="detailCardItem">
				<span class="value">{{primerNombre}} {{segundoNombre}} {{apellidoPaterno}} {{apellidoMaterno}}</span>
			</div>
		</div>
	</div>									
</script>

</body>
</html>