package com.simularte.model;

import java.math.BigDecimal;
import java.sql.Timestamp;
import java.util.Collection;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;

@Entity
public class Proyecto {

	@Id @GeneratedValue @Column(name = "idproyecto")	
	private Integer idProyecto;	
	
	//References
	@ManyToOne @JoinColumn(name = "idcliente", nullable = false)
	private Cliente proyectoCliente;
	
	@ManyToOne @JoinColumn(name = "idempresa", nullable = false)
	private Empresa proyectoEmpresa;
		
	@OneToOne(mappedBy = "ordenProyecto")
	private Orden proyectoOrden;
	
	@OneToMany(mappedBy = "proyectoDetProyecto")
	private Collection<ProyectoDetalle> proyectosDetalleProy;
  	
	@Column(length = 30, nullable = false)
	private String codigo;
	@Column(length = 180, nullable = true)
	private String nombre;
	@Column(length = 60, nullable = true)
	private String tipo;
	@Column(length = 255, nullable = true)
	private String direccion;
	@Column(length = 60, nullable = true)
	private String distrito;
	@Column(length = 60, nullable = true)
	private String ciudad;
	@Column(length = 60, nullable = true)
	private String departamento;
	@Column(name = "creadopor", nullable = false)
	private Integer creadoPor;
	
	@Column(name = "fechacreacion", nullable = false)
	private Timestamp fechaCreacion;
	@Column(length = 30, nullable = false)
	private String estado;
	
	//Datos de Subcontratos
	@Column(name = "oferta", nullable = true)
	private BigDecimal oferta;
	@Column(name = "eficiencia", nullable = true)
	private Double eficiencia;
	@Column(name = "utilidadbruta", nullable = true)
	private BigDecimal utilidadBruta;
	
	@Column(name = "subtotal", nullable = true)
	private BigDecimal subTotal;
	@Column(name = "gastosgenerales", nullable = true)
	private BigDecimal gastosGenerales;
	@Column(name = "total", nullable = true)
	private BigDecimal total;
	
	
	public BigDecimal getOferta() {
		return oferta;
	}
	public void setOferta(BigDecimal oferta) {
		this.oferta = oferta;
	}
	public Integer getIdProyecto() {
		return idProyecto;
	}
	public void setIdProyecto(Integer idProyecto) {
		this.idProyecto = idProyecto;
	}
	public Cliente getProyectoCliente() {
		return proyectoCliente;
	}
	public void setProyectoCliente(Cliente proyectoCliente) {
		this.proyectoCliente = proyectoCliente;
	}
	public Empresa getProyectoEmpresa() {
		return proyectoEmpresa;
	}
	public void setProyectoEmpresa(Empresa proyectoEmpresa) {
		this.proyectoEmpresa = proyectoEmpresa;
	}
	public Orden getProyectoOrden() {
		return proyectoOrden;
	}
	public void setProyectoOrden(Orden proyectoOrden) {
		this.proyectoOrden = proyectoOrden;
	}
	public Collection<ProyectoDetalle> getProyectosDetalleProy() {
		return proyectosDetalleProy;
	}
	public void setProyectosDetalleProy(
			Collection<ProyectoDetalle> proyectosDetalleProy) {
		this.proyectosDetalleProy = proyectosDetalleProy;
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
	public String getTipo() {
		return tipo;
	}
	public void setTipo(String tipo) {
		this.tipo = tipo;
	}
	public String getDireccion() {
		return direccion;
	}
	public void setDireccion(String direccion) {
		this.direccion = direccion;
	}
	public String getDistrito() {
		return distrito;
	}
	public void setDistrito(String distrito) {
		this.distrito = distrito;
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
	public Timestamp getFechaCreacion() {
		return fechaCreacion;
	}
	public void setFechaCreacion(Timestamp fechaCreacion) {
		this.fechaCreacion = fechaCreacion;
	}
	public String getEstado() {
		return estado;
	}
	public void setEstado(String estado) {
		this.estado = estado;
	}
	public Integer getCreadoPor() {
		return creadoPor;
	}
	public void setCreadoPor(Integer creadoPor) {
		this.creadoPor = creadoPor;
	}
	public Double getEficiencia() {
		return eficiencia;
	}
	public void setEficiencia(Double eficiencia) {
		this.eficiencia = eficiencia;
	}
	public BigDecimal getUtilidadBruta() {
		return utilidadBruta;
	}
	public void setUtilidadBruta(BigDecimal utilidadBruta) {
		this.utilidadBruta = utilidadBruta;
	}
	public BigDecimal getSubTotal() {
		return subTotal;
	}
	public void setSubTotal(BigDecimal subTotal) {
		this.subTotal = subTotal;
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
}