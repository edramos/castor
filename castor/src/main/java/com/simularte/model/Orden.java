package com.simularte.model;

import java.math.BigDecimal;
import java.sql.Timestamp;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;

@Entity
public class Orden {

	@Id @GeneratedValue @Column(name = "idorden")
	private Integer idOrden;	
	
	//References	
	@OneToOne(cascade = CascadeType.ALL) 
	@JoinColumn(name = "idproyecto", nullable = false)
	private Proyecto ordenProyecto;
	
	@OneToOne(mappedBy = "facturaOrden")
	private Factura ordenFactura;
	
	@Column(length = 30, nullable = false)
	private String codigo;
	@Column(nullable = false)
	private BigDecimal oferta;	
	@Column(name = "fechacreacion", nullable = false)
	private Timestamp fechaCreacion;
	@Column(length = 30, nullable = false)
	private String estado;
	
	public Integer getIdOrden() {
		return idOrden;
	}
	public void setIdOrden(Integer idOrden) {
		this.idOrden = idOrden;
	}
	public Proyecto getOrdenProyecto() {
		return ordenProyecto;
	}
	public void setOrdenProyecto(Proyecto ordenProyecto) {
		this.ordenProyecto = ordenProyecto;
	}
	public Factura getOrdenFactura() {
		return ordenFactura;
	}
	public void setOrdenFactura(Factura ordenFactura) {
		this.ordenFactura = ordenFactura;
	}
	public String getCodigo() {
		return codigo;
	}
	public void setCodigo(String codigo) {
		this.codigo = codigo;
	}
	public BigDecimal getOferta() {
		return oferta;
	}
	public void setOferta(BigDecimal oferta) {
		this.oferta = oferta;
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

}