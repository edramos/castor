package com.simularte.model;

import java.math.BigDecimal;
import java.sql.Timestamp;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;

@Entity
public class Cobro {

	@Id @GeneratedValue @Column(name = "idcobro")
	private Integer idCobro;
	
	//References
	/*Se le puede crobar 1-n veces a 1 cliente, como el cliente es unico por proyecto 
	 * se le saca el idCliente a travez Orden-Proyecto, Keys: idCobro(PK), idOrden(FK)*/
	
	
	@Column(name = "fechacobro", nullable = false)
	private Timestamp fechaCobro;
	@Column(nullable = false)
	private BigDecimal monto;
	
	@Column(name = "fechacreacion", nullable = false)
	private Timestamp fechaCreacion;
	@Column(length = 30, nullable = false)
	private String estado;
	
	
	
	public Integer getIdCobro() {
		return idCobro;
	}
	public void setIdCobro(Integer idCobro) {
		this.idCobro = idCobro;
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