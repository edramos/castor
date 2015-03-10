package com.simularte.model;

import java.math.BigDecimal;
import java.sql.Timestamp;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity @Table(name = "proyectodetalle")
public class ProyectoDetalle {

	@Id @GeneratedValue @Column(name = "idproyectodetalle")
	private Integer idProyectoDetalle;
	
	//References
	@ManyToOne 
	@JoinColumn(name = "idcliente", nullable = false)
	private Cliente proyectoDetCliente;
	
	@ManyToOne 
	@JoinColumn(name = "idproveedor", nullable = false)
	private Proveedor proyectoDetProveedor; 
	
	@ManyToOne 
	@JoinColumn(name = "idproyecto", nullable = false)
	private Proyecto proyectoDetProyecto; 
	
	@Column(nullable = false)
	private BigDecimal costo;	
	@Column(name = "fechacreacion", nullable = false)
	private Timestamp fechaCreacion;
	@Column(length = 30, nullable = false)
	private String estado;
	
	public Integer getIdProyectoDetalle() {
		return idProyectoDetalle;
	}
	public void setIdProyectoDetalle(Integer idProyectoDetalle) {
		this.idProyectoDetalle = idProyectoDetalle;
	}
	public Cliente getProyectoDetCliente() {
		return proyectoDetCliente;
	}
	public void setProyectoDetCliente(Cliente proyectoDetCliente) {
		this.proyectoDetCliente = proyectoDetCliente;
	}
	public Proveedor getProyectoDetProveedor() {
		return proyectoDetProveedor;
	}
	public void setProyectoDetProveedor(Proveedor proyectoDetProveedor) {
		this.proyectoDetProveedor = proyectoDetProveedor;
	}
	public Proyecto getProyectoDetProyecto() {
		return proyectoDetProyecto;
	}
	public void setProyectoDetProyecto(Proyecto proyectoDetProyecto) {
		this.proyectoDetProyecto = proyectoDetProyecto;
	}
	public BigDecimal getCosto() {
		return costo;
	}
	public void setCosto(BigDecimal costo) {
		this.costo = costo;
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