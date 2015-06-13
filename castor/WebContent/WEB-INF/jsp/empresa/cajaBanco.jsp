<!DOCTYPE html>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Castor | Caja Banco</title>
<jsp:include page="../comps/headMandatory.jsp"/>
<!-- BEGIN PAGE LEVEL STYLES -->
<link rel="stylesheet" type="text/css" href="assets/global/plugins/bootstrap-datepicker/css/datepicker.css"/>
<link rel="stylesheet" type="text/css" href="assets/global/plugins/typeahead/typeahead.css">
<!-- END PAGE LEVEL STYLES -->
<style type="text/css">
.table td, th{text-align: center;}
.tt-hint, .tt-input {color: #000000;}
</style>
</head>

<body class="page-header-fixed page-sidebar-closed-hide-logo page-sidebar-closed-hide-logo">
<jsp:include page="../comps/cabecera.jsp"/>
<div class="clearfix"></div>

<!-- BEGIN CONTAINER -->
<div class="page-container">
<jsp:include page="../comps/menuCostado.jsp"/>
	
<!-- BEGIN CONTENT -->
<div class="page-content-wrapper"><div class="page-content">

<div class="row">
<div class="col-md-12">
	
	<form:form id="frmCrearDetalleLibro" modelAttribute="libroDetalleBean" method="post">
	<div id="divCrearCajaBanco" class="portlet box blue-hoki">
	
		<div class="portlet-title">
			<div class="caption"><i class="icon-notebook"></i>Caja Banco</div>
			<div class="actions">
				<select id="sltCuentaBanco" class="form-control input-sm" style="color: #333;font-weight: bold;" name="idLibro"></select>
			</div>
		</div>
		
		<div class="portlet-body form">
			<div class="form-body">
				
				<div class="row">
					<div class="col-md-2">
						<div id="txtFechaOperacion" class="input-group date date-picker margin-bottom-5" data-date-format="dd/mm/yyyy">
							<input type="text" class="form-control form-filter valid" placeholder="Fecha" name="fechaOperacion" aria-required="true" aria-invalid="false">												
							<span class="input-group-btn"><button class="btn default" type="button"><i class="fa fa-calendar"></i></button></span>
						</div>
					</div>
					<div class="col-md-2">
						<select id="sltOperacion" class="form-control" name="operacion">
							<%if(session.getAttribute("tipo").equals("empresa")){%><option value="Ingreso">Ingreso</option><%}%>
							<option value="Egreso">Egreso</option>
						</select>
					</div>
					<div class="col-md-2">
						<select id="sltTipoOperacion" class="form-control" name="tipoOperacion">
						<%if(session.getAttribute("tipo").equals("empresa")){%>
							<option value="Cobranza Venta/Servicio">Cobranza Venta/Servicio</option>
							<option value="Detraccion">Detraccion</option>
							<option value="Otra cobranza">Otra cobranza</option>
							<option value="Transferencia cuenta">Transferencia cuenta</option>
							<option value="Interese ganado">Interes ganado</option>
						<%}else{%>
							<option value="Pago Proveedor">Pago Proveedor</option>
						<%}%>
						</select>
					</div>
					<div class="col-md-2">		
						<input id="txtFactura" type="text" class="form-control" placeholder="Factura" name="factura"/>	
					</div>
					<div class="col-md-2">	
					<%if(session.getAttribute("tipo").equals("empresa")){%>
						<select id="sltCliente" class="form-control" name="idCliente"></select>
					<%}else{%>
						<select id="sltPague" class="form-control">
							<option>Pague Total</option><option>Pague Detraccion</option><option>Pague Sin Detraccion</option>
						</select>
					<%}%>
					</div>
					<div class="col-md-2">
						<!-- <a class="btn green" onclick="grabarDL()"><i class="fa fa-check"></i> Grabar</a> -->
						<button type="submit" class="btn green"><i class="fa fa-check"></i> Grabar</button>
					</div>
				</div>
				
				<div class="row">
					<div class="col-md-12">
						<table class="table table-bordered table-condensed table-advance" style="margin-top: 3px;">
						<thead>
							<tr>
								<th>Factura</th><th>Orden</th><th>Proveedor</th><th>Condicion</th><th>Monto</th><th>IGV</th>
								<th>Total</th><th>Detraccion</th><th>Sin Detraccion</th>
							</tr>
						</thead>
						<tbody id="tbodyRegistro">
							<tr id="trRegistro"></tr>
						</tbody>
						</table>
					</div>
				</div>
				
				<div class="row">
					<div class="col-md-12">
						<input class="form-control" placeholder="Descripcion...">
						<input id="hdnMonto" type="hidden" name="monto">
						<input id="hdnIdFactura" type="hidden" name="idFactura">
						<input id="hdnIdOrden" type="hidden" name="idOrden">
						<input id="hdnIdProveedor" type="hidden" name="idProveedor">
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
	<div id="divRegistrosCajaBanco" class="portlet box blue-hoki">
		<div class="portlet-title">
			<div class="caption"><i class="icon-notebook"></i>Registros Caja Banco</div>
			<div class="actions"></div>
		</div>
		<div id="divPortletBody" class="portlet-body">
			<table class='table table-striped table-hover' id='tblResultados'>
			<thead>
			<tr>
				<th>Fecha</th><th>Factura</th><th>Orden</th><th>Proveedor</th><th>Ingreso</th><th>Egreso</th><th>Saldo</th>
			</tr>
			</thead>
			<tbody id='viewResultadosHandlerbars'>
			</tbody>
			</table>					
		</div>
	</div>
</div>
</div>
	
</div></div>
<!-- END CONTENT -->
</div>
<!-- END CONTAINER -->

<jsp:include page="../comps/footer.jsp"/>
<jsp:include page="../comps/corePlugins.jsp"/>
<!-- BEGIN PAGE LEVEL PLUGINS -->
<script type="text/javascript" src="assets/global/plugins/bootstrap-datepicker/js/bootstrap-datepicker.js"></script>
<script type="text/javascript" src="assets/global/plugins/typeahead/typeahead.bundle.min.js"></script>
<script type="text/javascript" src="assets/global/plugins/jquery-validation/js/jquery.validate.min.js"></script>
<!-- END PAGE LEVEL PLUGINS -->

<!-- BEGIN PAGE LEVEL SCRIPTS -->
<script src="assets/global/scripts/metronic.js" type="text/javascript"></script>
<script src="assets/admin/layout4/scripts/layout.js" type="text/javascript"></script>
<!-- END PAGE LEVEL SCRIPTS -->
<script>
var aLibros = [];
var idOrden = null;
var idProveedor = null;

jQuery(document).ready(function() {   
	Metronic.init(); // init metronic core components
	Layout.init(); // init current layout
	
	//init sltLibros
	llenarLibros();
	
	//init fechaOperacion
	$('#txtFechaOperacion').datepicker("setDate", new Date());
	$('#txtFechaOperacion').datepicker({
		"setDate": new Date()
	});
	$('#txtFechaOperacion').datepicker().on('changeDate', function (ev){
		$(this).datepicker('hide');
	});
	
	//Selecciona el monto que se pago
	$('#sltPague').on('change', function(){
		switch(this.value){
		case "Pague Total":
			$('#tdTotal').css("font-weight","bold");$('#tdDetraccion').css("font-weight","");$('#tdSinDetraccion').css("font-weight","");
			break;
		case "Pague Detraccion":
			$('#tdDetraccion').css("font-weight","bold");$('#tdTotal').css("font-weight","");$('#tdSinDetraccion').css("font-weight","");
			break;
		case "Pague Sin Detraccion":
			$('#tdSinDetraccion').css("font-weight","bold");$('#tdTotal').css("font-weight","");$('#tdDetraccion').css("font-weight","");
			break;
		}
	});
	
	//init suggestFacturas por pagar
	suggestFactura("pagar");
	
	//validar form
	$('#frmCrearDetalleLibro').validate({
		ignore: ":hidden",
		rules: {
			fechaOperacion:{required:true}, factura:{required:true} 
		},
		messages: {
			fechaOperacion:"*", factura:"*"
		},
		submitHandler: function(){
			grabarDL();
			return false;
		}
	});
});
</script>
<script>
function suggestFactura(tipo){
	var facturas = new Bloodhound({
		datumTokenizer: function (datum) {return Bloodhound.tokenizers.whitespace(datum.value);},
		queryTokenizer: Bloodhound.tokenizers.whitespace,
		limit: 10,
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
	
	$('#txtFactura').on('typeahead:selected', function (e, datum){
		$('#hdnIdFactura').val(datum['idFactura']);
		
		$.ajax({
	 		url: 'cargarFacturaCajaBanco_' + datum['idFactura'],
	 		type: 'post',
	 		dataType: 'json',
	 		success: function(filas){
	 			$('#trRegistro').remove();
	 			$('#tbodyRegistro').append('<tr id="trRegistro"></tr>');
	 			$.each(filas, function(i, fila){
	 				$('#hdnIdOrden').val(fila.idOrden);
	 				$('#hdnIdProveedor').val(fila.idProveedor);
		 			$('#trRegistro').append('<td>'+ fila.codigo +'</td><td><a href="ordenPag-'+ fila.idOrden +'" target="_blank">'+ fila.nombreOrden +'</a></td>'+
		 				'<td>'+ fila.nombreProveedor +'</td><td>'+ fila.condicionPago +'</td><td>'+ fila.subTotal +'</td><td>'+ fila.conIgv +'</td><td id="tdTotal">'+ fila.total +'</td>'+
		 				'<td id="tdDetraccion">'+ fila.montoDetraccion +' ('+ fila.detraccion +'%)</td><td id="tdSinDetraccion">'+ fila.sinDetraccion +'</td>');
	 			});	
	 			$('#tdTotal').css("font-weight","bold");
	 		}
	 	});
		
	});
}
</script>
<script>
function grabarDL(){
	var monto = null;
	
	switch($('#sltPague option:selected').text()){
	case "Pague Total":
		monto = Number($('#tdTotal').html().replace(/[^0-9\.]+/g,""));
		break;
	case "Pague Detraccion":
		var temp = $('#tdDetraccion').html();
		var aTemp = temp.split('(');
		monto = Number(aTemp[0].replace(/[^0-9\.]+/g,""));
		break;
	case "Pague Sin Detraccion":
		monto = Number($('#tdSinDetraccion').html().replace(/[^0-9\.]+/g,""));
		break;
	}
	//alert(monto);
	//alert($('#hdnIdFactura').val());
	//alert($('#sltCuentaBanco').val());
	//alert($('#hdnIdProveedor').val());
	$('#hdnMonto').val(monto);
	
	/* $.ajax({
 		url: 'ajaxCrearRegistroLibro',
 		type: 'post',
 		dataType: 'json',
 		data: $('#frmCrearDetalleLibro').serialize(),
 		success: function(resultado){
 			
 		}
 	}); */
}
</script>
<script>
function llenarLibros(){
	$.ajax({
 		url: 'listarLibros',
 		type: 'get',
 		success: function(libros){
 			$.each(libros, function(i, libro){
 				aLibros[i] = libro;
 			});	
 			llenarSelect("sltCuentaBanco", aLibros);
 		}
 	});
}
function llenarSelect(objeto, array){
	$('#' + objeto).empty();
	
	switch(objeto){
	case "sltCuentaBanco":
		for(var i = 0; i < array.length; i++){
			$('<option/>').val(array[i].idLibro).html(array[i].nombre).appendTo('#' + objeto);
		}
		break;
	}
}
</script>
</body>
</html>