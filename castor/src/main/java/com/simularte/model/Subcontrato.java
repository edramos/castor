package com.simularte.model;

import java.math.BigDecimal;
import java.sql.Date;
import java.sql.Timestamp;
import java.util.Collection;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;

@Entity
public class Subcontrato {

	@Id @GeneratedValue @Column(name = "idsubcontrato")
	private Integer idSubcontrato;
	
	//References
	@ManyToOne @JoinColumn(name = "idorden")
	private Orden ordenSubcontrato;
	@ManyToOne @JoinColumn(name = "idproveedor", nullable = false)
	private Proveedor proveedorSubcontrato;	
	
	//Fields
	@Column(nullable = false)
	private BigDecimal monto;
	@Column(length = 30, nullable = false)
	private String moneda;
	@Column(name = "tipotrabajo", length = 30, nullable = true)
	private String tipoTrabajo;
	@Column(name = "fechaterminoobra", nullable = true)
	private Date fechaTerminoObra;
	
	@Column(name = "creadopor", nullable = false)
	private Integer creadoPor;
	@Column(name = "fechacreacion", nullable = false)
	private Timestamp fechaCreacion;
	@Column(length = 30, nullable = false)
	private String estado;
	
	
	@OneToMany(mappedBy = "cuentaSubcontrato")
	private Collection<Cuenta> cuentasSubcon;
	
	
	public Date getFechaTerminoObra() {
		return fechaTerminoObra;
	}
	public void setFechaTerminoObra(Date fechaTerminoObra) {
		this.fechaTerminoObra = fechaTerminoObra;
	}
	public Integer getIdSubcontrato() {
		return idSubcontrato;
	}
	public void setIdSubcontrato(Integer idSubcontrato) {
		this.idSubcontrato = idSubcontrato;
	}
	public Orden getOrdenSubcontrato() {
		return ordenSubcontrato;
	}
	public void setOrdenSubcontrato(Orden ordenSubcontrato) {
		this.ordenSubcontrato = ordenSubcontrato;
	}
	public Proveedor getProveedorSubcontrato() {
		return proveedorSubcontrato;
	}
	public void setProveedorSubcontrato(Proveedor proveedorSubcontrato) {
		this.proveedorSubcontrato = proveedorSubcontrato;
	}
	public BigDecimal getMonto() {
		return monto;
	}
	public void setMonto(BigDecimal monto) {
		this.monto = monto;
	}
	public String getMoneda() {
		return moneda;
	}
	public void setMoneda(String moneda) {
		this.moneda = moneda;
	}
	public String getTipoTrabajo() {
		return tipoTrabajo;
	}
	public void setTipoTrabajo(String tipoTrabajo) {
		this.tipoTrabajo = tipoTrabajo;
	}
	public Integer getCreadoPor() {
		return creadoPor;
	}
	public void setCreadoPor(Integer creadoPor) {
		this.creadoPor = creadoPor;
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
	public Collection<Cuenta> getCuentasSubcon() {
		return cuentasSubcon;
	}
	public void setCuentasSubcon(Collection<Cuenta> cuentasSubcon) {
		this.cuentasSubcon = cuentasSubcon;
	}
}