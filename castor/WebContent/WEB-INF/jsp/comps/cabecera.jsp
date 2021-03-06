<style>
.page-header.navbar.navbar-fixed-top {
    z-index: 8010;
}
</style>
<!-- BEGIN HEADER -->
<div class="page-header navbar navbar-fixed-top">
	<!-- BEGIN HEADER INNER -->
	<div class="page-header-inner">
		<!-- BEGIN LOGO -->
		<div class="page-logo">
			<a href="#"><img src="assets/frontend/onepage/img/logo/simularte.png" alt="" class="logo-default"/></a>
			<div class="menu-toggler sidebar-toggler"><!-- DOC: Remove the above "hide" to enable the sidebar toggler button on header --></div>
		</div>
		<!-- END LOGO -->
		
		<!-- BEGIN RESPONSIVE MENU TOGGLER -->
		<a href="javascript:;" class="menu-toggler responsive-toggler" data-toggle="collapse" data-target=".navbar-collapse"></a>
		<!-- END RESPONSIVE MENU TOGGLER -->
		
		<div style="height: 75px;display: inline-block;padding: 25px 10px 18px;float: left;font-size: 14px;font-weight: 600">
		<span <% if(session.getAttribute("tipo").equals("cliente")) { %>style="color:#EFA800;"<% } %>>
			<%=session.getAttribute("nombreEmpresa")%>&nbsp;&nbsp;</span>			    
		</div>
		
		<!-- BEGIN PAGE TOP -->
		<div class="page-top">
			<!-- BEGIN TOP NAVIGATION MENU -->
			<div class="top-menu">
				<ul class="nav navbar-nav pull-right">
					<li class="separator hide"></li>
					<li class="separator hide"></li>
					<li class="separator hide"></li>
					
					<!-- BEGIN USER LOGIN DROPDOWN -->
					<!-- DOC: Apply "dropdown-dark" class after below "dropdown-extended" to change the dropdown styte -->
					<li class="dropdown dropdown-user dropdown-dark">
						<a href="#" class="dropdown-toggle" data-toggle="dropdown" data-hover="dropdown" data-close-others="true">
						    <span class="username username-hide-on-mobile" ><%=session.getAttribute("nombreUsuario")%></span>
						    <span style="font-weight: 800">(<%=session.getAttribute("rol")%>)</span>
							<!-- DOC: Do not remove below empty space(&nbsp;) as its purposely used -->
							<img alt="" class="img-circle" src="assets/admin/layout4/img/avatar.png"/>
						</a>
						<ul class="dropdown-menu dropdown-menu-default">
							<% if(session.getAttribute("rol").equals("Administrador")) {%>
							<li><a href="toMyCompany"><i class="icon-user"></i> Mi Compa�ia </a></li>
							<% } %>
							<!-- <li><a href="toMyProfile"><i class="icon-calendar"></i> Mi Perfil </a></li>
							<li><a href="inbox.html"><i class="icon-envelope-open"></i> Mi Inbox <span class="badge badge-danger">3 </span></a></li>
							<li><a href="page_todo.html"><i class="icon-rocket"></i> Mis Tareas <span class="badge badge-success">7 </span></a></li> -->
							<li class="divider"></li>
							<li><a href="toLogout"><i class="icon-key"></i> Log Out </a></li>
						</ul>
					</li>
					<!-- END USER LOGIN DROPDOWN -->
				</ul>
			</div>
			<!-- END TOP NAVIGATION MENU -->
		</div>
		<!-- END PAGE TOP -->
	</div>
	<!-- END HEADER INNER -->
</div>
<!-- END HEADER -->