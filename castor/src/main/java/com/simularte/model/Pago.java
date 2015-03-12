package com.simularte.model;

import java.math.BigDecimal;
import java.sql.Timestamp;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;

@Entity
public class Pago {

	@Id @GeneratedValue @Column(name = "idpago")
	private Integer idPago;
	
	//References
	/*1 Proveedor puede recibir 1-n pagos para el mismo proyecto, esta tabla debe tener estas Keys:
	 * idPago(PK), idOrden(FK), idProveedor(FK) el idProveedor se saca de ProyectoDetalle*/
	
	
	@Column(name = "fechacobro", nullable = false)
	private Timestamp fechaCobro;
	@Column(nullable = false)
	private BigDecimal monto;
	
	@Column(name = "fechacreacion", nullable = false)
	private Timestamp fechaCreacion;
	@Column(length = 30, nullable = false)
	private String estado;
	
	
	
	public Integer getIdPago() {
		return idPago;
	}
	public void setIdPago(Integer idPago) {
		this.idPago = idPago;
	}
	public Timestamp getFechaCobro() {
		return fechaCobro;
	}
	public void setFechaCobro(Timestamp fechaCobro) {
		this.fechaCobro = fechaCobro;
	}
	public BigDecimal getMonto() {
		return monto;
	}
	public void setMonto(BigDecimal monto) {
		this.monto = monto;
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