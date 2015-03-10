package com.simularte.model;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;

@Entity
public class Factura {

	@Id @GeneratedValue @Column(name = "idfactura")
	private Integer idFactura;	
	
	//References	
	@OneToOne(cascade = CascadeType.ALL) 
	@JoinColumn(name = "idorden", nullable = false)
	private Orden facturaOrden;

	public Integer getIdFactura() {
		return idFactura;
	}

	public void setIdFactura(Integer idFactura) {
		this.idFactura = idFactura;
	}

	public Orden getFacturaOrden() {
		return facturaOrden;
	}

	public void setFacturaOrden(Orden facturaOrden) {
		this.facturaOrden = facturaOrden;
	}
	
}
