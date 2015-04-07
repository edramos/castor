package com.simularte.model;

import java.sql.Date;
import java.sql.Timestamp;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

@Entity
public class Archivo {

	@Id @GeneratedValue @Column(name = "idarchivo")
	private Integer idArchivo;
	
	//References
	@Column(name = "identidad", nullable = false)
	private Integer idEntidad;
	@Column(name = "tipoentidad", length = 60, nullable = false)	
	private String tipoEntidad;
	@ManyToOne @JoinColumn(name = "idusuario")
	private Usuario archivoUsuario;
	
	//Fields
	@Column(length = 180, nullable = true)	
	private String nombre;
	@Column(length = 60, nullable = true)	
	private String tipo;
	@Column(name = "tipoarchivo", length = 120, nullable = true)	
	private String tipoArchivo;
	@Column(length = 255, nullable = true)	
	private String url;
	@Column(nullable = true)	
	private Long tamanio;
	
	@Column(name = "ultimamodificacion", nullable = true)	
	private Date ultimaModificacion;
	@Column(name = "otrosdetalles", length = 60, nullable = true)	
	private String otrosDetalles;
	@Column(length = 60, nullable = true)	
	private String visibility;
	@Column(length = 300, nullable = true)	
	private String descripcion;
	
	@Column(name = "creadopor", nullable = false)
	private Integer creadoPor;
	@Column(name = "fechacreacion", nullable = false)
	private Timestamp fechaCreacion;
	@Column(length = 30, nullable = false)
	private String estado;
	
	
	
	
	public Integer getIdArchivo() {
		return idArchivo;
	}
	public void setIdArchivo(Integer idArchivo) {
		this.idArchivo = idArchivo;
	}
	public Integer getIdEntidad() {
		return idEntidad;
	}
	public void setIdEntidad(Integer idEntidad) {
		this.idEntidad = idEntidad;
	}
	public String getTipoEntidad() {
		return tipoEntidad;
	}
	public void setTipoEntidad(String tipoEntidad) {
		this.tipoEntidad = tipoEntidad;
	}
	public Usuario getArchivoUsuario() {
		return archivoUsuario;
	}
	public void setArchivoUsuario(Usuario archivoUsuario) {
		this.archivoUsuario = archivoUsuario;
	}
	public String getNombre() {
		return nombre;
	}
	public void setNombre(String nombre) {
		this.nombre = nombre;
	}
	public String getTipo() {
		return tipo;
	}
	public void setTipo(String tipo) {
		this.tipo = tipo;
	}
	public String getTipoArchivo() {
		return tipoArchivo;
	}
	public void setTipoArchivo(String tipoArchivo) {
		this.tipoArchivo = tipoArchivo;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public Long getTamanio() {
		return tamanio;
	}
	public void setTamanio(Long tamanio) {
		this.tamanio = tamanio;
	}
	public Date getUltimaModificacion() {
		return ultimaModificacion;
	}
	public void setUltimaModificacion(Date ultimaModificacion) {
		this.ultimaModificacion = ultimaModificacion;
	}
	public String getOtrosDetalles() {
		return otrosDetalles;
	}
	public void setOtrosDetalles(String otrosDetalles) {
		this.otrosDetalles = otrosDetalles;
	}
	public String getVisibility() {
		return visibility;
	}
	public void setVisibility(String visibility) {
		this.visibility = visibility;
	}
	public String getDescripcion() {
		return descripcion;
	}
	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
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