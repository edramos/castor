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
import javax.persistence.OneToOne;

@Entity
public class Usuario {

	@Id @GeneratedValue @Column(name = "idusuario")	
	private Integer idUsuario;
	
	//References
	@ManyToOne @JoinColumn(name = "idempresa", nullable = false)
	private Empresa usuarioEmpresa;
	@OneToOne(mappedBy = "perfilUsuario")
	private Perfil usuarioPerfil;
	@OneToMany(mappedBy = "archivoUsuario")
	private Collection<Archivo> usuarioArchivo;
	
	//Fields
	@Column(length = 60, nullable = false)
	private String email;	
	@Column(length = 60, nullable = false)
	private String password;	
	@Column(name = "fechacreacion", nullable = false)
	private Timestamp fechaCreacion;
	@Column(length = 30, nullable = false)
	private String estado;
	
	
	
	public Collection<Archivo> getUsuarioArchivo() {
		return usuarioArchivo;
	}
	public void setUsuarioArchivo(Collection<Archivo> usuarioArchivo) {
		this.usuarioArchivo = usuarioArchivo;
	}
	public Integer getIdUsuario() {
		return idUsuario;
	}
	public void setIdUsuario(Integer idUsuario) {
		this.idUsuario = idUsuario;
	}
	public Empresa getUsuarioEmpresa() {
		return usuarioEmpresa;
	}
	public void setUsuarioEmpresa(Empresa usuarioEmpresa) {
		this.usuarioEmpresa = usuarioEmpresa;
	}
	public Perfil getUsuarioPerfil() {
		return usuarioPerfil;
	}
	public void setUsuarioPerfil(Perfil usuarioPerfil) {
		this.usuarioPerfil = usuarioPerfil;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
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