<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!-- BEGIN SIDEBAR -->
<div class="page-sidebar-wrapper">
	<!-- DOC: Set data-auto-scroll="false" to disable the sidebar from auto scrolling/focusing -->
	<!-- DOC: Change data-auto-speed="200" to adjust the sub menu slide up/down speed -->
	<div class="page-sidebar navbar-collapse collapse">
		<!-- BEGIN SIDEBAR MENU -->
		<!-- DOC: Apply "page-sidebar-menu-light" class right after "page-sidebar-menu" to enable light sidebar menu style(without borders) -->
		<!-- DOC: Apply "page-sidebar-menu-hover-submenu" class right after "page-sidebar-menu" to enable hoverable(hover vs accordion) sub menu mode -->
		<!-- DOC: Apply "page-sidebar-menu-closed" class right after "page-sidebar-menu" to collapse("page-sidebar-closed" class must be applied to the body element) the sidebar sub menu mode -->
		<!-- DOC: Set data-auto-scroll="false" to disable the sidebar from auto scrolling/focusing -->
		<!-- DOC: Set data-keep-expand="true" to keep the submenues expanded -->
		<!-- DOC: Set data-auto-speed="200" to adjust the sub menu slide up/down speed -->
		<ul class="page-sidebar-menu " data-keep-expanded="false" data-auto-scroll="true" data-slide-speed="200">
			<li class="start active ">
				<a href="toDashboard"><i class="icon-home"></i><span class="title">Dashboard</span></a>
			</li>
			<li>
				<a href="javascript:;"><i class="icon-basket"></i>
				<span class="title">Ordenes</span>
				<span class="arrow "></span>
				</a>
				<ul class="sub-menu">
					<%if(session.getAttribute("tipo").equals("cliente")){
						if(session.getAttribute("rol").equals("Administrador") || session.getAttribute("rol").equals("Coordinador")){%>
						<li><a href="toCrearOrden">Crear Orden</a></li>
					<% }
					}%>
					<li><a href="toBuscarOrden">Buscar Orden</a></li>
				</ul>
			</li>
			
			<%if(session.getAttribute("rol").equals("Administrador") || session.getAttribute("rol").equals("Contable")){ %>
			    <li>
					<a href="javascript:;"><i class="icon-layers"></i>
						<span class="title">Facturas</span><span class="arrow "></span>
					</a>
					<ul class="sub-menu">
						<li><a href="toCrearFactura">Crear Factura</a></li>
					</ul>
				</li>
				<li>
					<a href="javascript:;"><i class="icon-notebook"></i>
						<span class="title">Libros</span><span class="arrow "></span>
					</a>
					<ul class="sub-menu">
						<li><a href="toCajaBanco">Caja Banco</a></li>
						<%if(session.getAttribute("tipo").equals("empresa")){%>
						<li><a href="toCajaChica">Caja Chica</a></li>
						<%}%>
					</ul>
				</li> 
			<% }%>
	
			
			<%if(session.getAttribute("tipo").equals("empresa")){ %>
			<li>
				<a href="javascript:;"><i class="icon-paper-plane"></i><span class="title">Reportes</span><span class="arrow "></span></a>
				<ul class="sub-menu">
					<li><a href="toReporte">Deuda</a></li>
					<li><a href="toMasterDeudaProveedor">Master Deuda</a></li>
				</ul>
			</li>
			<%}else{%>
			<li>
				<a href="javascript:;"><i class="icon-paper-plane"></i><span class="title">Reportes</span><span class="arrow "></span></a>
				<ul class="sub-menu">
					<li><a href="toMasterDeuda">Master Deuda</a></li>
				</ul>
			</li>
			<%} %>
			
		</ul>
		<!-- END SIDEBAR MENU -->
	</div>
</div>
<!-- END SIDEBAR -->