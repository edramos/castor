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
	@Column(length = 60, nullable = false)
	private String nombre;
	@Column(length = 30, nullable = false)
	private String moneda;
	
	@Column(name = "numerocuenta", length = 60, nullable = true)
	private String numeroCuenta;
	
	@Column(name = "creadopor", nullable = false)
	private Integer creadoPor;
	@Column(name = "fechacreacion", nullable = false)
	private Timestamp fechaCreacion;
	@Column(length = 30, nullable = false)
	private String estado;	
	
	
	public Collection<DetalleLibro> getDetalleLibrolib() {
		return detalleLibrolib;
	}
	public void setDetalleLibrolib(Collection<DetalleLibro> detalleLibrolib) {
		this.detalleLibrolib = detalleLibrolib;
	}
	public String getNombre() {
		return nombre;
	}
	public void setNombre(String nombre) {
		this.nombre = nombre;
	}
	public String getMoneda() {
		return moneda;
	}
	public void setMoneda(String moneda) {
		this.moneda = moneda;
	}
	public String getNumeroCuenta() {
		return numeroCuenta;
	}
	public void setNumeroCuenta(String numeroCuenta) {
		this.numeroCuenta = numeroCuenta;
	}
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
