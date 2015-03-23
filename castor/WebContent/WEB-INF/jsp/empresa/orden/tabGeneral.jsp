<div class="portlet-body">	
	<!-- GENERAL -->
	<div class="detailPane">
		<div class="detailHeader"><div class="detailHeaderLeft"><span class="h2v1">General</span></div></div>
		
		<div class="summaryBody sectionBody">
			<div class="summaryBodyLeft">
				<div class="summaryBodyItem">
					<span class="spanLabel">Nombre</span><span id="spnNombre" class="value"></span>
				</div>
				<div class="summaryBodyItem">
					<span class="spanLabel">Cliente</span><span id="spnNombreCliente" class="value"></span>
				</div>
				<div class="summaryBodyItem">
					<span class="spanLabel">Tipo</span><span id="spnTipo" class="value"></span>
				</div>
				<div class="summaryBodyItem">
					<span class="spanLabel">Trabajo</span><span id="spnTrabajo" class="value"></span>
				</div>
			</div>
			<div class="summaryBodyMiddle">
				<div class="summaryBodyItem">
					<span class="spanLabel">Latitud</span><span id="spnLat" class="value"></span>
				</div>
				<div class="summaryBodyItem">
					<span class="spanLabel">Longitud</span><span id="spnLon" class="value"></span>
				</div>
				<div class="summaryBodyItem">
					<span class="spanLabel">Ciudad</span><span id="spnCiudad" class="value"></span>
				</div>
				<div class="summaryBodyItem">
					<span class="spanLabel">Departamento</span><span id="spnDepartamento" class="value"></span>
				</div>
			</div>
			<div class="summaryBodyRight">
				<div class="summaryBodyItem">
					<span class="spanLabel">Entrega</span><span id="spnEntrega" class="value"></span>
				</div>
				<div class="summaryBodyItem">
					<span class="spanLabel">Creacion</span><span id="spnCreacion" class="value"></span>
				</div>
				<div class="summaryBodyItem">
					<span class="spanLabel">Creador</span><span id="spnCreador" class="value"></span>
				</div>
				<div class="summaryBodyItem">
					<span class="spanLabel"></span><span id="#" class="value"></span>
				</div>
			</div>
		
		</div>
	</div>

	<!-- INFORMACIION FINANCIERA -->
	<div class="detailPane">
		<div class="detailHeader"><div class="detailHeaderLeft"><span class="h2v1">Informacion Financiera</span></div></div>
		
		<div class="summaryBody sectionBody">
			<div class="summaryBodyLeft">
				<div class="summaryBodyItem">
					<span class="spanLabel">Oferta</span><span id="spnOferta" class="currencyLabel value"></span>
				</div>
				<div class="summaryBodyItem">
					<span class="spanLabel">Subcontratos</span><span id="spnSumMontoSubs" class="value"></span>
				</div>
				<div class="summaryBodyItem">
					<span class="spanLabel">Gastos Generales</span><span id="spnGastosGenerales" class="value"></span>
				</div>
			</div>
			
			<div class="summaryBodyMiddle">
				<div class="summaryBodyItem">
					<span class="spanLabel">Utilidad Bruta</span><span id="spnUtilBruta" class="value"></span>
				</div>
				<div class="summaryBodyItem">
					<span class="spanLabel">Utilidad Neta</span><span id="spnUtilNeta" class="value"></span>
				</div>
				<div class="summaryBodyItem">
					<span class="spanLabel"></span><span id="#" class="value"></span>
				</div>
			</div>
			
			<div class="summaryBodyRight">
				<div class="summaryBodyItem">
					<span class="spanLabel">Eficiencia</span><span id="spnEficiencia" class="value"></span>
				</div>
				<div class="summaryBodyItem">
					<span class="spanLabel"></span><span id="#" class="value"></span>
				</div>
				<div class="summaryBodyItem">
					<span class="spanLabel"></span><span id="#" class="value"></span>
				</div>
			</div>
		
		</div>
	</div>
</div>
<script>
function initOrdenGeneral(orden){
	$('#spnNombre').text(orden.nombre);
	$('#spnNombreCliente').text(orden.nombreCliente);
	if(orden.tipoOrden == 'OC'){
		$('#spnTipo').text('Obra Civil');	
	}else{
		$('#spnTipo').text('Trabajos Varios');	
	}
	$('#spnTrabajo').text(orden.tipoTrabajo);
	$('#spnLat').text(orden.lat);
	$('#spnLon').text(orden.lon);
	$('#spnCiudad').text(orden.ciudad);
	$('#spnDepartamento').text(orden.departamento);
	$('#spnEntrega').text(orden.fechaEntrega);
	$('#spnCreacion').text(orden.fechaCreacion);
	$('#spnCreador').text(orden.creadoPorNombre);
	//Financiera
	//$('#spnMoneda').text(orden.moneda);
	$('#spnOferta').text($.getFormattedCurrency(orden.oferta));
	$('#spnGastosGenerales').text($.getFormattedCurrency(orden.gastosGenerales));
	$('#spnEficiencia').text(orden.eficiencia);
	$('#spnUBruta').text(orden.utilidadBruta);
	
	oferta = orden.oferta;
	gastosGen = orden.gastosGenerales;
}
</script>