package com.simularte.bean;

import java.util.List;

import org.springframework.web.multipart.commons.CommonsMultipartFile;

public class ArchivoBean {

	private List<CommonsMultipartFile> files;
	private List<S3Bean> archivosS3;
	
	private int idArchivo;
	private int idEntidad;
	private String tipoEntidad;
	private String descripcion;
	private String nombre;
	private String url;
	private String tamanio;

	

	public List<S3Bean> getArchivosS3() {
		return archivosS3;
	}
	public void setArchivosS3(List<S3Bean> archivosS3) {
		this.archivosS3 = archivosS3;
	}
	public int getIdArchivo() {
		return idArchivo;
	}
	public void setIdArchivo(int idArchivo) {
		this.idArchivo = idArchivo;
	}
	public int getIdEntidad() {
		return idEntidad;
	}
	public void setIdEntidad(int idEntidad) {
		this.idEntidad = idEntidad;
	}
	public String getTipoEntidad() {
		return tipoEntidad;
	}
	public void setTipoEntidad(String tipoEntidad) {
		this.tipoEntidad = tipoEntidad;
	}
	public String getDescripcion() {
		return descripcion;
	}
	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}
	public List<CommonsMultipartFile> getFiles() {
		return files;
	}
	public void setFiles(List<CommonsMultipartFile> files) {
		this.files = files;
	}
	public String getNombre() {
		return nombre;
	}
	public void setNombre(String nombre) {
		this.nombre = nombre;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public String getTamanio() {
		return tamanio;
	}
	public void setTamanio(String tamanio) {
		this.tamanio = tamanio;
	}
}