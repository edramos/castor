package com.simularte.service;

import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.amazonaws.AmazonClientException;
import com.amazonaws.auth.SystemPropertiesCredentialsProvider;
import com.amazonaws.services.s3.AmazonS3;
import com.amazonaws.services.s3.AmazonS3Client;
import com.amazonaws.services.s3.model.CannedAccessControlList;
import com.amazonaws.services.s3.model.ObjectMetadata;
import com.amazonaws.services.s3.model.PutObjectRequest;
import com.amazonaws.util.IOUtils;
import com.simularte.bean.ArchivoBean;
import com.simularte.model.Archivo;
import com.simularte.model.Usuario;
import com.simularte.util.Dates;
import com.simularte.util.Formatos;

@Service
public class S3ServiceImpl implements S3Service{

	@PersistenceContext
	EntityManager em;
	
	AmazonS3 s3 = new AmazonS3Client(new SystemPropertiesCredentialsProvider());
	private static final String S3_BUCKET = System.getProperty("S3_BUCKET");
	
	@Transactional
	public boolean subirArchivo(ArchivoBean ab, HttpServletRequest req){
		boolean result = false;
		
		try{
			for(int i = 0; i < ab.getFiles().size(); i++){				
				
				ObjectMetadata metadata = new ObjectMetadata(); 				//Prepara toda la informacion neceasria para que se pueda subir al S3
				InputStream is = ab.getFiles().get(i).getInputStream();			//Puente de bytes
				byte[] contentBytes= IOUtils.toByteArray(is);
				Long contentLength = Long.valueOf(contentBytes.length);
				metadata.setContentLength(contentLength);						//Cuanto pesa
				metadata.setContentType(ab.getFiles().get(i).getContentType()); //Tipo del archivo
				
				//In the key (filename) we prefix the company type and id to seggregate attachment into folders
				String key = "";
				if(!(req.getSession().getAttribute("idEmpresa").toString()).equals("null")){
					key = "Emp" + req.getSession().getAttribute("idEmpresa").toString() + "/" + ab.getTipoEntidad() + ab.getIdEntidad();
				}			
				
				key = key + "/" + ab.getFiles().get(i).getOriginalFilename(); 
				
				PutObjectRequest por = new PutObjectRequest(S3_BUCKET, key, ab.getFiles().get(i).getInputStream(), metadata).withCannedAcl(CannedAccessControlList.PublicRead);
				s3.putObject(por);
				
				
				try{
					Archivo archivo = new Archivo();
					Usuario usuario = em.find(Usuario.class, (Integer)req.getSession().getAttribute("idUser"));
					
					archivo.setIdEntidad(ab.getIdEntidad());
					archivo.setTipoEntidad(ab.getTipoEntidad());
					archivo.setArchivoUsuario(usuario);
					
					archivo.setNombre((ab.getFiles().get(i).getOriginalFilename()));
					archivo.setTamanio(contentLength);					
					
					String tempKey = key;
					tempKey =  tempKey.replace("<", "%3C");
					tempKey =  tempKey.replace(">", "%3E");
					tempKey =  tempKey.replace(":", "%3A");				
					tempKey =  tempKey.replace("/", "%2F");
					tempKey =  tempKey.replace("|", "%7C");
					tempKey =  tempKey.replace("?", "%3F");
					tempKey =  tempKey.replace("*", "%2A");
					
					archivo.setUrl("https://" + S3_BUCKET + ".s3.amazonaws.com/" + tempKey);
					archivo.setTipoArchivo(ab.getFiles().get(i).getContentType());
					archivo.setDescripcion("");
					
					archivo.setCreadoPor((Integer)req.getSession().getAttribute("idUser"));
					archivo.setFechaCreacion(Dates.fechaCreacion());
					archivo.setEstado("enabled");
					
					em.persist(archivo);
					
				}catch(IllegalArgumentException e){
					e.printStackTrace();
				}
			}
			result = true;
			
		}catch(AmazonClientException ace){
			ace.printStackTrace();
		}catch(Exception e){
			e.printStackTrace();
		}
		
		return result;
	}
	
	@SuppressWarnings("unchecked")
	public List<ArchivoBean> cargarArchivos(int idEntidad, String tipoEntidad){
		List<ArchivoBean> archivos = new ArrayList<ArchivoBean>();
		System.out.println("idEntidad: " + idEntidad + " tipoEntidad: " + tipoEntidad);
		Query q1 = em.createNativeQuery("SELECT nombre, url, tamanio, descripcion FROM archivo "
				+ "WHERE identidad = '" + idEntidad + "' AND tipoentidad = '" + tipoEntidad + "'");
		
		
		try{
			List<Object[]> rows = q1.getResultList();
			
			for(int x = 0; x < rows.size(); x++){
				Object[] obj = rows.get(x);
				ArchivoBean ab = new ArchivoBean();
				
				ab.setNombre(obj[0].toString());
				ab.setUrl(obj[1].toString());
				ab.setTamanio(Formatos.bytesToString(Long.parseLong(obj[2].toString())));
				ab.setDescripcion(obj[3].toString());
				
				archivos.add(ab);
			}
		}catch(Exception e){
			e.printStackTrace(); 
		}
		
		return archivos;
	}
}
