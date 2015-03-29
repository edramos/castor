package com.simularte.model;

import java.math.BigDecimal;
import java.sql.Date;
import java.sql.Timestamp;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

@Entity(name = "detallelibro")
public class DetalleLibro {

	@Id @GeneratedValue @Column(name = "iddetallelibro")
	private Integer idDetalleLibro;
	
	// References
	@ManyToOne @JoinColumn(name = "idlibro", nullable = false)
	private Libro detalleLibroLibro;
	
	// Fields
	@Column(name = "fechaoperacion", nullable = false)
	private Date fechaOperacion;
	@Column(nullable = false)
	private BigDecimal monto;
	@Column(length = 30, nullable = false)
	private String operacion;
	@Column(name = "tipooperacion", length = 30, nullable = false)
	private String tipoOperacion;
	@Column(length = 280, nullable = false)
	private String descripcion;
	
	@Column(name = "creadopor", nullable = false)
	private Integer creadoPor;
	@Column(name = "fechacreacion", nullable = false)
	private Timestamp fechaCreacion;
	@Column(length = 30, nullable = false)
	private String estado;
	
	
	
	public Integer getIdDetalleLibro() {
		return idDetalleLibro;
	}
	public void setIdDetalleLibro(Integer idDetalleLibro) {
		this.idDetalleLibro = idDetalleLibro;
	}
	public Libro getDetalleLibroLibro() {
		return detalleLibroLibro;
	}
	public void setDetalleLibroLibro(Libro detalleLibroLibro) {
		this.detalleLibroLibro = detalleLibroLibro;
	}
	public Date getFechaOperacion() {
		return fechaOperacion;
	}
	public void setFechaOperacion(Date fechaOperacion) {
		this.fechaOperacion = fechaOperacion;
	}
	public BigDecimal getMonto() {
		return monto;
	}
	public void setMonto(BigDecimal monto) {
		this.monto = monto;
	}
	public String getOperacion() {
		return operacion;
	}
	public void setOperacion(String operacion) {
		this.operacion = operacion;
	}
	public String getTipoOperacion() {
		return tipoOperacion;
	}
	public void setTipoOperacion(String tipoOperacion) {
		this.tipoOperacion = tipoOperacion;
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