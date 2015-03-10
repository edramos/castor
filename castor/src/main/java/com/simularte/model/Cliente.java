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
public class Cliente {

	@Id @GeneratedValue @Column(name = "idcliente")	
	private Integer idCliente;
	
	//References
	@ManyToOne 
	@JoinColumn(name = "idempresa", nullable = false)
	private Empresa clienteEmpresa;
	
	@OneToMany(mappedBy = "proyectoCliente")
	private Collection<Proyecto> proyectosCli;
	
	@Column(length = 180, nullable = true)
	private String nombre;	
	@Column(name = "fechacreacion", nullable = false)
	private Timestamp fechaCreacion;
	@Column(length = 30, nullable = false)
	private String estado;
	
	@Column(name = "creadopor", nullable = false)
	private Integer creadoPor;
	
	public Integer getIdCliente() {
		return idCliente;
	}
	public void setIdCliente(Integer idCliente) {
		this.idCliente = idCliente;
	}
	public Empresa getClienteEmpresa() {
		return clienteEmpresa;
	}
	public void setClienteEmpresa(Empresa clienteEmpresa) {
		this.clienteEmpresa = clienteEmpresa;
	}
	public Collection<Proyecto> getProyectosCli() {
		return proyectosCli;
	}
	public void setProyectosCli(Collection<Proyecto> proyectosCli) {
		this.proyectosCli = proyectosCli;
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
	
	
	
}