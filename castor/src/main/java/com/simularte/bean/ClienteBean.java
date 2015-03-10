package com.simularte.bean;

import java.sql.Timestamp;

public class ClienteBean {
	
	private Integer idCliente;
	private Integer idEmpresa;
	private String nombre;
	private Timestamp fechaCreacion;
	private String estado;
	private Integer creadoPor;
	private String nombreCreadoPor;
	
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
