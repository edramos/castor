package com.simularte.model;

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
public class Proveedor {

	@Id @GeneratedValue @Column(name = "idproveedor")	
	private Integer idProveedor;
	
	//References
	@OneToMany(mappedBy = "proveedorSubcontrato")
	private Collection<Subcontrato> subcontratosProveedor;
	@ManyToOne @JoinColumn(name = "idempresa", nullable = false)
	private Empresa proveedorEmpresa;
	
	
	@Column(length = 180, nullable = true)
	private String nombre;
	@Column(name = "creadopor", nullable = false)
	private Integer creadoPor;
	
	@Column(name = "fechacreacion", nullable = false)
	private Timestamp fechaCreacion;
	@Column(length = 30, nullable = false)
	private String estado;
	
	
	
	public Integer getIdProveedor() {
		return idProveedor;
	}
	public void setIdProveedor(Integer idProveedor) {
		this.idProveedor = idProveedor;
	}
	public Collection<Subcontrato> getSubcontratosProveedor() {
		return subcontratosProveedor;
	}
	public void setSubcontratosProveedor(
			Collection<Subcontrato> subcontratosProveedor) {
		this.subcontratosProveedor = subcontratosProveedor;
	}
	public Empresa getProveedorEmpresa() {
		return proveedorEmpresa;
	}
	public void setProveedorEmpresa(Empresa proveedorEmpresa) {
		this.proveedorEmpresa = proveedorEmpresa;
	}
	public String getNombre() {
		return nombre;
	}
	public void setNombre(String nombre) {
		this.nombre = nombre;
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
}