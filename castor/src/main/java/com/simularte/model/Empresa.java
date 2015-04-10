package com.simularte.model;

import java.sql.Timestamp;
import java.util.Collection;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToMany;

@Entity	//En el futuro cambiara de nombre por Organizacion, tipo define que es
public class Empresa {

	@Id @GeneratedValue @Column(name = "idempresa")
	private Integer idEmpresa;
	
	//References	
	@OneToMany(mappedBy = "usuarioEmpresa")
	private Collection<Usuario> usuariosEmp;
	@OneToMany(mappedBy = "oficinaEmpresa")
	private Collection<Oficina> oficinasEmp;
	@OneToMany(mappedBy = "clienteEmpresa")
	private Collection<Cliente> clientesEmp;
	@OneToMany(mappedBy = "proveedorEmpresa")
	private Collection<Proveedor> proveedoresEmp;
	@OneToMany(mappedBy = "ordenEmpresa")
	private Collection<Orden> ordenesEmp;
	@OneToMany(mappedBy = "libroEmpresa")
	private Collection<Libro> libroEmp;
	
	//Fields
	@Column(length = 90, nullable = true)
	private String nombre;
	@Column(length = 30, nullable = true)
	private String tipo;
	@Column(length = 30, nullable = true)
	private String ruc;
	@Column(length = 270, nullable = true)
	private String website;
	@Column(length = 270, nullable = true)
	private String facebook;
	
	@Column(name = "fechacreacion", nullable = false)
	private Timestamp fechaCreacion;
	@Column(length = 30, nullable = false)
	private String estado;
	
	
	
	public Collection<Libro> getLibroEmp() {
		return libroEmp;
	}
	public void setLibroEmp(Collection<Libro> libroEmp) {
		this.libroEmp = libroEmp;
	}
	public String getTipo() {
		return tipo;
	}
	public void setTipo(String tipo) {
		this.tipo = tipo;
	}
	public Integer getIdEmpresa() {
		return idEmpresa;
	}
	public void setIdEmpresa(Integer idEmpresa) {
		this.idEmpresa = idEmpresa;
	}
	public Collection<Usuario> getUsuariosEmp() {
		return usuariosEmp;
	}
	public void setUsuariosEmp(Collection<Usuario> usuariosEmp) {
		this.usuariosEmp = usuariosEmp;
	}
	public Collection<Oficina> getOficinasEmp() {
		return oficinasEmp;
	}
	public void setOficinasEmp(Collection<Oficina> oficinasEmp) {
		this.oficinasEmp = oficinasEmp;
	}
	public Collection<Cliente> getClientesEmp() {
		return clientesEmp;
	}
	public void setClientesEmp(Collection<Cliente> clientesEmp) {
		this.clientesEmp = clientesEmp;
	}
	public Collection<Proveedor> getProveedoresEmp() {
		return proveedoresEmp;
	}
	public void setProveedoresEmp(Collection<Proveedor> proveedoresEmp) {
		this.proveedoresEmp = proveedoresEmp;
	}
	public Collection<Orden> getOrdenesEmp() {
		return ordenesEmp;
	}
	public void setOrdenesEmp(Collection<Orden> ordenesEmp) {
		this.ordenesEmp = ordenesEmp;
	}
	public String getNombre() {
		return nombre;
	}
	public void setNombre(String nombre) {
		this.nombre = nombre;
	}
	public String getRuc() {
		return ruc;
	}
	public void setRuc(String ruc) {
		this.ruc = ruc;
	}
	public String getWebsite() {
		return website;
	}
	public void setWebsite(String website) {
		this.website = website;
	}
	public String getFacebook() {
		return facebook;
	}
	public void setFacebook(String facebook) {
		this.facebook = facebook;
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