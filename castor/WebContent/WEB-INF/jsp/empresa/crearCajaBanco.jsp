<!DOCTYPE html>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Castor | Caja Banco</title>
<jsp:include page="../comps/headMandatory.jsp"/>
<!-- BEGIN PAGE LEVEL STYLES -->
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
				<div class="caption"><i class="icon-share"></i>Crear Caja Banco</div>
				<div class="actions">							
					<a class="btn btn-icon-only btn-default btn-sm fullscreen" href="#" data-original-title="" title=""></a>
				</div>
			</div>
			
			<div class="portlet-body form">
			<form:form id="frmCrearCajaBanco" class="form-horizontal" action="crearOrden" method="post" commandName="ordenBean">
				<div class="form-body">
					
					<div class="row">
						<div class="col-md-3">
							<div class="form-group">
								<div class="col-md-12">
									<input id="txtNombre" class="form-control" placeholder="Monto $/." name="nombre"/>
								</div>
							</div>
						</div>
						<div class="col-md-3">
							<div class="form-group">
								<div class="col-md-12">
									<select id="sltTipo" class="form-control" name="tipoTrabajo">
										<option value="Obra">Ingreso</option>
										<option value="Estudio">Egreso</option>
									</select>
								</div>
							</div>
						</div>
						<div class="col-md-3">
							<div class="form-group">
								<div class="col-md-12">
									<select id="sltTipo" class="form-control" name="tipoTrabajo">
										<option value="Obra">Cobranzas Ventas/Servicio</option>
										<option value="Estudio">Otras cobranzas</option>
										<option value="Estudio">Transferencia cta.</option>
										<option value="Estudio">Intereses ganados</option>
										<option value="Estudio">Prestamos recibidos</option>
									</select>
								</div>
							</div>
						</div>
						<div class="col-md-3">
							<div class="form-group">
								<div class="col-md-12">
									<input id="txtNombre" class="form-control" placeholder="RUC Cliente" name="nombre"/>
								</div>
							</div>
						</div>
						</div>
						
						<div class="row">
						<div class="col-md-3">
							<div class="form-group">
								<div class="col-md-12">
									<input id="txtNombre" class="form-control" placeholder="COD Factura" name="nombre"/>
								</div>
							</div>
						</div>
						<div class="col-md-3">
							<div class="form-group">
								<div class="col-md-12">
									<a id="btnGrabar" class="btn btn-default" ><i class="fa fa-plus"></i> Subir Archivo</a>
								</div>
							</div>
						</div>
						<div class="col-md-6">
							<div class="form-group">
								<div class="col-md-12">
									<input id="txtNombre" class="form-control" placeholder="Desripcion...falta fecha" name="nombre"/>
								</div>
							</div>
						</div>
						</div>
						
						<div class="row">
							<div class="col-md-3">
							<a id="btnGrabar" class="btn btn-default btn-sm eventBtn" ><i class="fa fa-plus"></i> Grabar</a>
							
							</div>
						</div>
					
					
				</div>
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

<jsp:include page="../comps/footer.jsp"/>
<jsp:include page="../comps/corePlugins.jsp"/>
<!-- BEGIN PAGE LEVEL PLUGINS -->
<!-- END PAGE LEVEL PLUGINS -->

<!-- BEGIN PAGE LEVEL SCRIPTS -->
<!-- END PAGE LEVEL SCRIPTS -->
</body>
</html>