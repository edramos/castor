package com.simularte.model;

import java.sql.Timestamp;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;

@Entity
public class Perfil {

	@Id @GeneratedValue @Column(name = "idperfil")
	private Integer idPerfil;
	
	//References	
	@OneToOne(cascade = CascadeType.ALL) 
	@JoinColumn(name = "idusuario", nullable = false)
	private Usuario perfilUsuario;
	
	@Column(name = "primernombre", length = 90, nullable = true)
	private String primerNombre;
	@Column(name = "segundonombre", length = 90, nullable = true)
	private String segundoNombre;
	@Column(name = "apellidopaterno", length = 90, nullable = true)
	private String apellidoPaterno;
	@Column(name = "apellidomaterno", length = 90, nullable = true)
	private String apellidoMaterno;
	@Column(length = 255, nullable = true)
	private String direccion;
	@Column(length = 60, nullable = true)
	private String distrito;
	@Column(length = 60, nullable = true)
	private String ciudad;
	@Column(length = 60, nullable = true)
	private String departamento;
	@Column(name = "telefonocasa", length = 30, nullable = true)
	private String telefonoCasa;
	@Column(name = "telefonooficina", length = 30, nullable = true)
	private String telefonoOficina;
	@Column(name = "celularprimario", length = 30, nullable = true)
	private String celularPrimario;
	@Column(name = "celularsecundario", length = 30, nullable = true)
	private String celularSecundario;
	@Column(length = 30, nullable = false)
	private String rol;
	@Column(length = 30, nullable = false)
	private String tipo;
	
	@Column(name = "fechacreacion", nullable = false)
	private Timestamp fechaCreacion;
	@Column(length = 30, nullable = false)
	private String estado;
	
	public Integer getIdPerfil() {
		return idPerfil;
	}
	public void setIdPerfil(Integer idPerfil) {
		this.idPerfil = idPerfil;
	}
	public Usuario getPerfilUsuario() {
		return perfilUsuario;
	}
	public void setPerfilUsuario(Usuario perfilUsuario) {
		this.perfilUsuario = perfilUsuario;
	}
	public String getPrimerNombre() {
		return primerNombre;
	}
	public void setPrimerNombre(String primerNombre) {
		this.primerNombre = primerNombre;
	}
	public String getSegundoNombre() {
		return segundoNombre;
	}
	public void setSegundoNombre(String segundoNombre) {
		this.segundoNombre = segundoNombre;
	}
	public String getApellidoPaterno() {
		return apellidoPaterno;
	}
	public void setApellidoPaterno(String apellidoPaterno) {
		this.apellidoPaterno = apellidoPaterno;
	}
	public String getApellidoMaterno() {
		return apellidoMaterno;
	}
	public void setApellidoMaterno(String apellidoMaterno) {
		this.apellidoMaterno = apellidoMaterno;
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
	public String getTelefonoCasa() {
		return telefonoCasa;
	}
	public void setTelefonoCasa(String telefonoCasa) {
		this.telefonoCasa = telefonoCasa;
	}
	public String getTelefonoOficina() {
		return telefonoOficina;
	}
	public void setTelefonoOficina(String telefonoOficina) {
		this.telefonoOficina = telefonoOficina;
	}
	public String getCelularPrimario() {
		return celularPrimario;
	}
	public void setCelularPrimario(String celularPrimario) {
		this.celularPrimario = celularPrimario;
	}
	public String getCelularSecundario() {
		return celularSecundario;
	}
	public void setCelularSecundario(String celularSecundario) {
		this.celularSecundario = celularSecundario;
	}
	public String getRol() {
		return rol;
	}
	public void setRol(String rol) {
		this.rol = rol;
	}
	public String getTipo() {
		return tipo;
	}
	public void setTipo(String tipo) {
		this.tipo = tipo;
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