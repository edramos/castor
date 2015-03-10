package com.simularte.model;

import java.sql.Timestamp;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

@Entity
public class Oficina {

	@Id @GeneratedValue @Column(name = "idoficina")
	private Integer idOficina;
	
	//References
	@ManyToOne 
	@JoinColumn(name = "idempresa", nullable = false)
	private Empresa oficinaEmpresa;
	
	@Column(length = 90, nullable = true)
	private String nombre;
	@Column(length = 255, nullable = true)
	private String direccion;
	@Column(length = 60, nullable = true)
	private String distrito;
	@Column(length = 60, nullable = true)
	private String ciudad;
	@Column(length = 60, nullable = true)
	private String departamento;
	@Column(name = "telefonooficina", length = 30, nullable = true)
	private String telefonoOficina;
	
	@Column(name = "fechacreacion", nullable = false)
	private Timestamp fechaCreacion;
	@Column(length = 30, nullable = false)
	private String estado;
	
	public Integer getIdOficina() {
		return idOficina;
	}
	public void setIdOficina(Integer idOficina) {
		this.idOficina = idOficina;
	}
	public Empresa getOficinaEmpresa() {
		return oficinaEmpresa;
	}
	public void setOficinaEmpresa(Empresa oficinaEmpresa) {
		this.oficinaEmpresa = oficinaEmpresa;
	}
	public String getNombre() {
		return nombre;
	}
	public void setNombre(String nombre) {
		this.nombre = nombre;
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
	public String getTelefonoOficina() {
		return telefonoOficina;
	}
	public void setTelefonoOficina(String telefonoOficina) {
		this.telefonoOficina = telefonoOficina;
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