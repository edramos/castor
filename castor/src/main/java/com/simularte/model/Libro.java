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
public class Libro {

	@Id @GeneratedValue @Column(name = "idlibro")
	private Integer idLibro;
	
	//References
	@ManyToOne @JoinColumn(name = "idempresa", nullable = false)
	private Empresa libroEmpresa;
	@OneToMany(mappedBy = "detalleLibroLibro")
	private Collection<DetalleLibro> detalleLibrolib;
	
	//Fields
	@Column(length = 30, nullable = false)
	private String tipo;
	
	@Column(name = "creadopor", nullable = false)
	private Integer creadoPor;
	@Column(name = "fechacreacion", nullable = false)
	private Timestamp fechaCreacion;
	@Column(length = 30, nullable = false)
	private String estado;
	
	
	
	public Integer getIdLibro() {
		return idLibro;
	}
	public void setIdLibro(Integer idLibro) {
		this.idLibro = idLibro;
	}
	public Empresa getLibroEmpresa() {
		return libroEmpresa;
	}
	public void setLibroEmpresa(Empresa libroEmpresa) {
		this.libroEmpresa = libroEmpresa;
	}
	public String getTipo() {
		return tipo;
	}
	public void setTipo(String tipo) {
		this.tipo = tipo;
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
