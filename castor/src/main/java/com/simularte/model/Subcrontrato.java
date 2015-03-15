package com.simularte.model;

import java.math.BigDecimal;
import java.sql.Timestamp;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

@Entity
public class Subcrontrato {

	@Id @GeneratedValue @Column(name = "idsubcontrato")
	private Integer idSubcontrato;
	
	//References
	@ManyToOne @JoinColumn(name = "idorden")
	private Orden ordenSubcontrato;
	@ManyToOne @JoinColumn(name = "idproveedor", nullable = false)
	private Proveedor proveedorSubcontrato;	
	
	
	@Column(nullable = false)
	private BigDecimal monto;
	@Column(length = 30, nullable = false)
	private String moneda;
	@Column(length = 30, nullable = true)
	private String tipoTrabajo;
	@Column(name = "creadopor", nullable = false)
	private Integer creadoPor;
	
	@Column(name = "fechacreacion", nullable = false)
	private Timestamp fechaCreacion;
	@Column(length = 30, nullable = false)
	private String estado;
}