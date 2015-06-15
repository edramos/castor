<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Castor | Mi Compañia</title>
<jsp:include page="../comps/headMandatory.jsp"/>
<!-- BEGIN PAGE LEVEL STYLES -->
<link href="assets/global/plugins/icheck/skins/all.css" rel="stylesheet"/>
<link rel="stylesheet" type="text/css" href="assets/global/plugins/select2/select2.css"/>
<link rel="stylesheet" type="text/css" href="assets/global/plugins/datatables/plugins/bootstrap/dataTables.bootstrap.css"/>
<!-- END PAGE LEVEL STYLES -->
<style>
#map-container img { 
	max-width: none;
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
		<div class="row">
		
			<div class="col-md-12">
				<div class="portlet light">
					<div class="portlet body">
						<div class="tabbable tabs-left">
							<ul class="nav nav-tabs">
								<li class="active">
									<a aria-expanded="true" href="#tab_1_1_1" data-toggle="tab">
									<span class="caption-subject font-blue-madison bold uppercase">Informacion</span></a>
								</li>
								<li class="">
									<a aria-expanded="false" href="#tab_1_1_2" data-toggle="tab">
									<span class="caption-subject font-blue-madison bold uppercase">Oficinas</span></a>
								</li>
								<li class="">
									<a aria-expanded="false" href="#tab_1_1_3" data-toggle="tab">
									<span class="caption-subject font-blue-madison bold uppercase">Empleados</span></a>
								</li>
								<li class="">
									<a aria-expanded="false" href="#tab_1_1_4" data-toggle="tab">
									<span class="caption-subject font-blue-madison bold uppercase">Clientes</span></a>
								</li>
								<%if(!session.getAttribute("tipo").equals("proveedor")){%>
								<li class="">
									<a aria-expanded="false" href="#tab_1_1_5" data-toggle="tab">
									<span class="caption-subject font-blue-madison bold uppercase">Proveedores</span></a>
								</li>
								<%} %>
							</ul>
						</div>
						
						<!-- BEGIN TABS -->
						<div class="tab-content">
							<div class="tab-pane active" id="tab_1_1_1">
								<jsp:include page="miCompania/tabInformacion.jsp"/>
							</div>
							<div class="tab-pane" id="tab_1_1_2">
								<jsp:include page="miCompania/tabOficinas.jsp"/>
							</div>
							<div class="tab-pane" id="tab_1_1_3">
								<jsp:include page="miCompania/tabEmpleados.jsp"/>
							</div>
							<div class="tab-pane" id="tab_1_1_4">
								<jsp:include page="miCompania/tabClientes.jsp"/>
							</div>
							
							<div class="tab-pane" id="tab_1_1_5">
								<jsp:include page="miCompania/tabProveedores.jsp"/>
							</div>
							
						</div>
						<!-- END TABS -->
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
<script type="text/javascript" src="assets/global/plugins/jquery-validation/js/jquery.validate.min.js"></script>
<script type="text/javascript" src="assets/global/plugins/jquery-validation/js/additional-methods.min.js"></script>
<script src="http://maps.google.com/maps/api/js?sensor=true" type="text/javascript"></script>
<script src="assets/global/plugins/gmaps/gmaps.min.js" type="text/javascript"></script>
<script src="assets/global/plugins/icheck/icheck.min.js"></script>
<script type="text/javascript" src="assets/global/plugins/select2/select2.min.js"></script>
<script type="text/javascript" src="assets/global/plugins/datatables/media/js/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="assets/global/plugins/datatables/plugins/bootstrap/dataTables.bootstrap.js"></script>
<!-- END PAGE LEVEL PLUGINS -->
<!-- BEGIN PAGE LEVEL SCRIPTS -->
<script src="assets/admin/pages/scripts/maps-google.js" type="text/javascript"></script>
<script type="text/javascript" src="assets/global/scripts/metronic.js"></script>
<script type="text/javascript" src="assets/admin/layout4/scripts/layout.js"></script>
<script type="text/javascript" src="assets/admin/layout4/scripts/demo.js"></script>
<script src="assets/global/plugins/icheck/icheck.min.js"></script>
<script src="assets/admin/pages/scripts/form-icheck.js"></script>
<script src="assets/admin/pages/scripts/table-editable.js"></script>
<!-- END PAGE LEVEL SCRIPTS -->
<script>
var tipo = '<%=session.getAttribute("tipo").toString()%>';
var flag = 0;

jQuery(document).ready(function() {    
    Metronic.init(); // init metronic core components
	Layout.init(); // init current layout
	Demo.init(); // init demo features
	FormiCheck.init(); // init page demo

	
	$(document).on('click','.eventBtn', function(e){
		switch(this.id){
		//INFORMACION
		case "btnEditarInfo":
			$('#informacionInit').hide();
			$('#informacionEdit').show();			
			break;
		case "btnCancelarInfo":
			$('#informacionEdit').hide();
			$('#informacionInit').show();
			break;
		case "btnGrabarInfo":
			$('#frmModificarEmpresa').submit();
			break;
		//OFICINA
		case "btnIrCrearOficina":
			$('#oficinaInit').hide();
			$('#oficinaCrear').show();
			//MapsGoogle.init();
			initMapaCrearOficina();
			break;
		case "btnCancelarOficina":
			$('#oficinaCrear').hide();
			$('#oficinaModificar').hide();
			$('#oficinaInit').show();
			//MapsGoogle.init();
			break;
		case "btnCrearOficina":
			$('#frmCrearOficina').submit();
			break;
		case "btnModificarOficina":
			$('#frmModificarOficina').submit();
			break;
		//EMPLEADO
		case "btnIrCrearEmpleado":
			$('#empleadoInit').hide();
			$('#empleadoCrear').show();
			break;
		case "btnCancelarEmpleado":
			$('#empleadoCrear').hide();
			$('#empleadoModificar').hide();
			$('#empleadoInit').show();
			break;
		case "btnCrearEmpleado":
			$('#frmCrearEmpleado').submit();
			break;
		case "btnModificarEmpleado":
			$('#frmModificarEmpleado').submit();
			break;	
			
		//CLIENTE
		case "btnIrCrearCliente":
			$('#clienteInit').hide();
			$('#clienteCrear').show();
			break;
		case "btnCancelarCliente":
			$('#clienteCrear').hide();
			$('#clienteModificar').hide();
			$('#clienteInit').show();
			break;
		case "btnCrearCliente":
			$('#frmCrearCliente').submit();
			break;
		case "btnModificarCliente":
			$('#frmModificarCliente').submit();
			break;	
		//PROVEEDOR
		case "btnIrCrearProveedor":
			$('#proveedorInit').hide();
			$('#proveedorCrear').show();
			break;
		case "btnCancelarProveedor":
			$('#proveedorCrear').hide();
			$('#proveedorModificar').hide();
			$('#proveedorInit').show();
			break;
		case "btnCrearProveedor":
			$('#frmCrearProveedor').submit();
			break;
		case "btnModificarProveedor":
			$('#frmModificarProveedor').submit();
			break;		
			
		}
		
	});
	extraerInformacionEmpresa(); 
	listarClientes();
	if(tipo != "proveedor"){
		listarProveedores();
	}
	listarOficinas();
	listarEmpleados();
	
	$('a[href="#tab_1_1_2"]').on('shown.bs.tab', function(e){
		if(flag == 0){
			flag = -1;
			//MapsGoogle.init();
			initMapOficinas(oficinasArray);
		}
    });
});

$(document).ready(function(){
	$("#frmCrearCliente").validate({
		rules: {
			nombre: {
				required: true,
			}                                   
		},
		messages: {
			nombre: "*"
		},
		submitHandler: function(form){
			crearCliente();
		}
	});
	
	$("#frmModificarCliente").validate({
		rules: {
			nombre: {
				required: true,
			}                                   
		},
		messages: {
			nombre: "*"
		},
		submitHandler: function(form){
			modificarCliente();
		}
	});
	
	$("#frmCrearProveedor").validate({
		rules: {
			nombre: {
				required: true,
			}                                   
		},
		messages: {
			nombre: "*"
		},
		submitHandler: function(form){
			crearProveedor();
		}
	});
	
	$("#frmModificarProveedor").validate({
		rules: {
			nombre: {
				required: true,
			}                                   
		},
		messages: {
			nombre: "*"
		},
		submitHandler: function(form){
			modificarProveedor();
		}
	});
	
	
	$("#frmCrearOficina").validate({
		rules: {
			direccionCompleta: {
				required: true,
			},nombre: {
				required: true,
			},telefonoOficina: {
				required: true,
			}                                 
		},
		messages: {
			direccionCompleta: "*",
			nombre: "*",
			telefonoOficina: "*"
		},
		submitHandler: function(form){
			crearOficina();
		}
	});
	
	$("#frmModificarOficina").validate({
		rules: {
			direccionCompleta: {
				required: true,
			},nombre: {
				required: true,
			},telefonoOficina: {
				required: true,
			}                                   
		},
		messages: {
			direccionCompleta: "*",
			nombre: "*",
			telefonoOficina: "*"
		},
		submitHandler: function(form){
			modificarOficina();
		}
	});
	
	
	//EMPLEADO
	$("#frmCrearEmpleado").validate({
		rules: {
			primerNombre: {
				required: true,
			}, 
			segundoNombre: {
				required: true,
			}, 
			apellidoPaterno: {
				required: true,
			}, 
			apellidoMaterno: {
				required: true,
			}, 
			rol: {
				required: true,
			}, 
			email: {
				required: true,
				email: true
			}
		},
		messages: {
			primerNombre: "*",
			segundoNombre: "*",
			apellidoPaterno: "*",
			apellidoMaterno: "*",
			rol: "*",
			email: "*"
		},
		submitHandler: function(form){
			crearEmpleado();
		}
	});
	
	$("#frmModificarEmpleado").validate({
		rules: {
			primerNombre: {
				required: true,
			}, 
			segundoNombre: {
				required: true,
			}, 
			apellidoPaterno: {
				required: true,
			}, 
			apellidoMaterno: {
				required: true,
			}, 
			rol: {
				required: true,
			}, 
			email: {
				required: true,
				email: true
			}                                   
		},
		messages: {
			primerNombre: "*",
			segundoNombre: "*",
			apellidoPaterno: "*",
			apellidoMaterno: "*",
			rol: "*",
			email: "*"
		},
		submitHandler: function(form){
			modificarEmpleado();
		}
	});
	
	
	$("#frmModificarEmpresa").validate({
		rules: {
			nombre: {
				required: true,
			}, 
			ruc: {
				required: true,
			}, 
			website: {
				required: true,
			}, 
			facebook: {
				required: true,
			}                                  
		},
		messages: {
			nombre: "*",
			ruc: "*",
			website: "*",
			facebook: "*"
		},
		submitHandler: function(form){
			modificarEmpresa();
		}
	});
	
});	
</script>
</body>
</html>