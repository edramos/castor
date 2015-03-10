package com.simularte.bean;

import java.sql.Timestamp;

public class ProveedorBean {
	
	private Integer idProveedor;
	private Integer idEmpresa;
	private String nombre;
	private Timestamp fechaCreacion;
	private String estado;
	private Integer creadoPor;
	private String nombreCreadoPor;
	
	public Integer getIdProveedor() {
		return idProveedor;
	}
	public void setIdProveedor(Integer idProveedor) {
		this.idProveedor = idProveedor;
	}
	public Integer getIdEmpresa() {
		return idEmpresa;
	}
	public void setIdEmpresa(Integer idEmpresa) {
		this.idEmpresa = idEmpresa;
	}
	public String getNombre() {
		return nombre;
	}
	public void setNombre(String nombre) {
		this.nombre = nombre;
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
	public String getNombreCreadoPor() {
		return nombreCreadoPor;
	}
	public void setNombreCreadoPor(String nombreCreadoPor) {
		this.nombreCreadoPor = nombreCreadoPor;
	}
	
	
	
}
