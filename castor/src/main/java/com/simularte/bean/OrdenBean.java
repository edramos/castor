package com.simularte.bean;

import java.math.BigDecimal;

public class OrdenBean {
	private Integer idOrden;
	private Integer idCliente;
	private Integer idEmpresa;
	
	private String codigo;
	private String nombre;
	private String tipoOrden;
	private String tipoTrabajo;
	private String lat;
	private String lon;
	private String ciudad;
	private String departamento;
	private String moneda;
	
	private double eficiencia;
	private BigDecimal oferta;
	private BigDecimal ofertaIgv;
	private BigDecimal utilidadBruta;
	private BigDecimal gastosGenerales;
	private BigDecimal total;
	private String fechaInicio;
	private String fechaEntrega;
	private BigDecimal detraccion;
	private BigDecimal gananciaProyectada;
	private BigDecimal gananciaDisponible;
	
	private String busqueda;
	private String campo;
		
	private Integer creadoPor;
	private String creadoPorNombre;
	private String fechaCreacion;	
	private String estado;		
	
	//CLIENTE
	private String nombreCliente;
	
	//FILTROS PARA BUSQUEDA BASICA
	private String fechaCreacionMinima;
	private String fechaCreacionMaxima;
	private BigDecimal ofertaMinima;
	private BigDecimal ofertaMaxima;
	
	//PANEL
	private String contador;
	private String sumOferta;
	private String sumMonto;
	private String utilidad;
	
	//REPORTE
	private String totalPagarProveedor;
	private String totalPagadoProveedor;
	private String totalPagadoDetraccionProveedor;
	private String totalDeudaProveedor;
	private String nombreProveedor;
	private String porcentajePagado;
	private String totalPagar;
	private String totalPagado;
	private String totalDeuda;
	private String totalPorcentajePagado;
	private int idProveedor;
	private int idCuenta;
	private BigDecimal deudaActual;
	private BigDecimal deudaComprometida;
	private BigDecimal deudaCorrespondiente;
	private BigDecimal pagado;
	private String pagadoS;
	private String igv;
	private String sTotal;
	private String deudaActualS;
	private String deudaComprometidaS;
	private String deudaCorrespondienteS;
	private String ofertaS;
	private String gtPagado;
	private String gtDeudaActual;
	private String gtDeudaComprometida;
	private String gtDeudaCorrespondiente;
	private String perPagado;
	private int idMes;
	
	//REPORTE ESTADO POR MES
	private int[] contadorMeses = new int[12];
	
	
	
	public Integer getIdOrden() {
		return idOrden;
	}
	public void setIdOrden(Integer idOrden) {
		this.idOrden = idOrden;
	}
	public Integer getIdCliente() {
		return idCliente;
	}
	public void setIdCliente(Integer idCliente) {
		this.idCliente = idCliente;
	}
	public Integer getIdEmpresa() {
		return idEmpresa;
	}
	public void setIdEmpresa(Integer idEmpresa) {
		this.idEmpresa = idEmpresa;
	}
	public String getCodigo() {
		return codigo;
	}
	public void setCodigo(String codigo) {
		this.codigo = codigo;
	}
	public String getNombre() {
		return nombre;
	}
	public void setNombre(String nombre) {
		this.nombre = nombre;
	}
	public String getTipoOrden() {
		return tipoOrden;
	}
	public void setTipoOrden(String tipoOrden) {
		this.tipoOrden = tipoOrden;
	}
	public String getTipoTrabajo() {
		return tipoTrabajo;
	}
	public void setTipoTrabajo(String tipoTrabajo) {
		this.tipoTrabajo = tipoTrabajo;
	}
	public String getLat() {
		return lat;
	}
	public void setLat(String lat) {
		this.lat = lat;
	}
	public String getLon() {
		return lon;
	}
	public void setLon(String lon) {
		this.lon = lon;
	}
	public String getCiudad() {
		return ciudad;
	}
	public void setCiudad(String ciudad) {
		this.ciudad = ciudad;
	}
	public String getDepartamento() {
		return departamento;
	}
	public void setDepartamento(String departamento) {
		this.departamento = departamento;
	}
	public String getMoneda() {
		return moneda;
	}
	public void setMoneda(String moneda) {
		this.moneda = moneda;
	}
	public double getEficiencia() {
		return eficiencia;
	}
	public void setEficiencia(double eficiencia) {
		this.eficiencia = eficiencia;
	}
	public BigDecimal getOferta() {
		return oferta;
	}
	public void setOferta(BigDecimal oferta) {
		this.oferta = oferta;
	}
	public BigDecimal getOfertaIgv() {
		return ofertaIgv;
	}
	public void setOfertaIgv(BigDecimal ofertaIgv) {
		this.ofertaIgv = ofertaIgv;
	}
	public BigDecimal getUtilidadBruta() {
		return utilidadBruta;
	}
	public void setUtilidadBruta(BigDecimal utilidadBruta) {
		this.utilidadBruta = utilidadBruta;
	}
	public BigDecimal getGastosGenerales() {
		return gastosGenerales;
	}
	public void setGastosGenerales(BigDecimal gastosGenerales) {
		this.gastosGenerales = gastosGenerales;
	}
	public BigDecimal getTotal() {
		return total;
	}
	public void setTotal(BigDecimal total) {
		this.total = total;
	}
	public String getFechaEntrega() {
		return fechaEntrega;
	}
	public void setFechaEntrega(String fechaEntrega) {
		this.fechaEntrega = fechaEntrega;
	}
	public BigDecimal getDetraccion() {
		return detraccion;
	}
	public void setDetraccion(BigDecimal detraccion) {
		this.detraccion = detraccion;
	}
	public BigDecimal getGananciaProyectada() {
		return gananciaProyectada;
	}
	public void setGananciaProyectada(BigDecimal gananciaProyectada) {
		this.gananciaProyectada = gananciaProyectada;
	}
	public BigDecimal getGananciaDisponible() {
		return gananciaDisponible;
	}
	public void setGananciaDisponible(BigDecimal gananciaDisponible) {
		this.gananciaDisponible = gananciaDisponible;
	}
	public String getBusqueda() {
		return busqueda;
	}
	public void setBusqueda(String busqueda) {
		this.busqueda = busqueda;
	}
	public String getCampo() {
		return campo;
	}
	public void setCampo(String campo) {
		this.campo = campo;
	}
	public Integer getCreadoPor() {
		return creadoPor;
	}
	public void setCreadoPor(Integer creadoPor) {
		this.creadoPor = creadoPor;
	}
	public String getCreadoPorNombre() {
		return creadoPorNombre;
	}
	public void setCreadoPorNombre(String creadoPorNombre) {
		this.creadoPorNombre = creadoPorNombre;
	}
	public String getFechaCreacion() {
		return fechaCreacion;
	}
	public void setFechaCreacion(String fechaCreacion) {
		this.fechaCreacion = fechaCreacion;
	}
	public String getEstado() {
		return estado;
	}
	public void setEstado(String estado) {
		this.estado = estado;
	}
	public String getNombreCliente() {
		return nombreCliente;
	}
	public void setNombreCliente(String nombreCliente) {
		this.nombreCliente = nombreCliente;
	}
	public String getFechaCreacionMinima() {
		return fechaCreacionMinima;
	}
	public void setFechaCreacionMinima(String fechaCreacionMinima) {
		this.fechaCreacionMinima = fechaCreacionMinima;
	}
	public String getFechaCreacionMaxima() {
		return fechaCreacionMaxima;
	}
	public void setFechaCreacionMaxima(String fechaCreacionMaxima) {
		this.fechaCreacionMaxima = fechaCreacionMaxima;
	}
	public BigDecimal getOfertaMinima() {
		return ofertaMinima;
	}
	public void setOfertaMinima(BigDecimal ofertaMinima) {
		this.ofertaMinima = ofertaMinima;
	}
	public BigDecimal getOfertaMaxima() {
		return ofertaMaxima;
	}
	public void setOfertaMaxima(BigDecimal ofertaMaxima) {
		this.ofertaMaxima = ofertaMaxima;
	}
	public String getContador() {
		return contador;
	}
	public void setContador(String contador) {
		this.contador = contador;
	}
	public String getSumOferta() {
		return sumOferta;
	}
	public void setSumOferta(String sumOferta) {
		this.sumOferta = sumOferta;
	}
	public String getSumMonto() {
		return sumMonto;
	}
	public void setSumMonto(String sumMonto) {
		this.sumMonto = sumMonto;
	}
	public String getUtilidad() {
		return utilidad;
	}
	public void setUtilidad(String utilidad) {
		this.utilidad = utilidad;
	}
	public String getNombreProveedor() {
		return nombreProveedor;
	}
	public void setNombreProveedor(String nombreProveedor) {
		this.nombreProveedor = nombreProveedor;
	}
	public String getPorcentajePagado() {
		return porcentajePagado;
	}
	public void setPorcentajePagado(String porcentajePagado) {
		this.porcentajePagado = porcentajePagado;
	}
	public String getTotalPagarProveedor() {
		return totalPagarProveedor;
	}
	public void setTotalPagarProveedor(String totalPagarProveedor) {
		this.totalPagarProveedor = totalPagarProveedor;
	}
	public String getTotalPagadoProveedor() {
		return totalPagadoProveedor;
	}
	public void setTotalPagadoProveedor(String totalPagadoProveedor) {
		this.totalPagadoProveedor = totalPagadoProveedor;
	}
	public String getTotalDeudaProveedor() {
		return totalDeudaProveedor;
	}
	public void setTotalDeudaProveedor(String totalDeudaProveedor) {
		this.totalDeudaProveedor = totalDeudaProveedor;
	}
	public String getTotalPagar() {
		return totalPagar;
	}
	public void setTotalPagar(String totalPagar) {
		this.totalPagar = totalPagar;
	}
	public String getTotalPagado() {
		return totalPagado;
	}
	public void setTotalPagado(String totalPagado) {
		this.totalPagado = totalPagado;
	}
	public String getTotalDeuda() {
		return totalDeuda;
	}
	public void setTotalDeuda(String totalDeuda) {
		this.totalDeuda = totalDeuda;
	}
	public String getTotalPorcentajePagado() {
		return totalPorcentajePagado;
	}
	public void setTotalPorcentajePagado(String totalPorcentajePagado) {
		this.totalPorcentajePagado = totalPorcentajePagado;
	}
	public String getFechaInicio() {
		return fechaInicio;
	}
	public void setFechaInicio(String fechaInicio) {
		this.fechaInicio = fechaInicio;
	}
	public String getTotalPagadoDetraccionProveedor() {
		return totalPagadoDetraccionProveedor;
	}
	public void setTotalPagadoDetraccionProveedor(
			String totalPagadoDetraccionProveedor) {
		this.totalPagadoDetraccionProveedor = totalPagadoDetraccionProveedor;
	}
	public int getIdProveedor() {
		return idProveedor;
	}
	public void setIdProveedor(int idProveedor) {
		this.idProveedor = idProveedor;
	}
	public int getIdCuenta() {
		return idCuenta;
	}
	public void setIdCuenta(int idCuenta) {
		this.idCuenta = idCuenta;
	}
	public BigDecimal getDeudaActual() {
		return deudaActual;
	}
	public void setDeudaActual(BigDecimal deudaActual) {
		this.deudaActual = deudaActual;
	}
	public BigDecimal getDeudaComprometida() {
		return deudaComprometida;
	}
	public void setDeudaComprometida(BigDecimal deudaComprometida) {
		this.deudaComprometida = deudaComprometida;
	}
	public BigDecimal getDeudaCorrespondiente() {
		return deudaCorrespondiente;
	}
	public void setDeudaCorrespondiente(BigDecimal deudaCorrespondiente) {
		this.deudaCorrespondiente = deudaCorrespondiente;
	}
	public BigDecimal getPagado() {
		return pagado;
	}
	public void setPagado(BigDecimal pagado) {
		this.pagado = pagado;
	}
	public int[] getContadorMeses() {
		return contadorMeses;
	}
	public void setContadorMeses(int index, int contadorMes) {
		contadorMeses[index] = contadorMes;
	}
	public String getIgv() {
		return igv;
	}
	public void setIgv(String igv) {
		this.igv = igv;
	}
	public String getsTotal() {
		return sTotal;
	}
	public void setsTotal(String sTotal) {
		this.sTotal = sTotal;
	}
	public String getDeudaActualS() {
		return deudaActualS;
	}
	public void setDeudaActualS(String deudaActualS) {
		this.deudaActualS = deudaActualS;
	}
	public String getDeudaComprometidaS() {
		return deudaComprometidaS;
	}
	public void setDeudaComprometidaS(String deudaComprometidaS) {
		this.deudaComprometidaS = deudaComprometidaS;
	}
	public String getDeudaCorrespondienteS() {
		return deudaCorrespondienteS;
	}
	public void setDeudaCorrespondienteS(String deudaCorrespondienteS) {
		this.deudaCorrespondienteS = deudaCorrespondienteS;
	}
	public String getPagadoS() {
		return pagadoS;
	}
	public void setPagadoS(String pagadoS) {
		this.pagadoS = pagadoS;
	}
	public String getOfertaS() {
		return ofertaS;
	}
	public void setOfertaS(String ofertaS) {
		this.ofertaS = ofertaS;
	}
	public String getGtPagado() {
		return gtPagado;
	}
	public void setGtPagado(String gtPagado) {
		this.gtPagado = gtPagado;
	}
	public String getGtDeudaActual() {
		return gtDeudaActual;
	}
	public void setGtDeudaActual(String gtDeudaActual) {
		this.gtDeudaActual = gtDeudaActual;
	}
	public String getGtDeudaComprometida() {
		return gtDeudaComprometida;
	}
	public void setGtDeudaComprometida(String gtDeudaComprometida) {
		this.gtDeudaComprometida = gtDeudaComprometida;
	}
	public String getGtDeudaCorrespondiente() {
		return gtDeudaCorrespondiente;
	}
	public void setGtDeudaCorrespondiente(String gtDeudaCorrespondiente) {
		this.gtDeudaCorrespondiente = gtDeudaCorrespondiente;
	}
	public String getPerPagado() {
		return perPagado;
	}
	public void setPerPagado(String perPagado) {
		this.perPagado = perPagado;
	}
	public int getIdMes() {
		return idMes;
	}
	public void setIdMes(int idMes) {
		this.idMes = idMes;
	}
}