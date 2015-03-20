<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<script>
/* $(document).ready(function(){
	$("#frmCrearOficina").validate({
		rules: {
			direccionCompleta: {
				required: true,
			},nombre: {
				required: true,
			},telefono: {
				required: true,
			}                                 
		},
		messages: {
			nombre: "*",
			nombre: "*",
			telefono: "*"
		},
		submitHandler: function(form){
			crearOficina();
		}
	});
	
	$("#frmModificarOficina").validate({
		rules: {
			direccionCompleta: {
				required: true,
			},nombre: {
				required: true,
			},telefono: {
				required: true,
			}                                   
		},
		messages: {
			nombre: "*",
			nombre: "*",
			telefono: "*"
		},
		submitHandler: function(form){
			modificarOficina();
		}
	});
});
$(document).ready(function(e) {
	
	$(document).on('click','.eventBtn', function(e){
		switch(this.id){
		//OFICINA
		case "btnIrCrearOficina":
			$('#oficinaInit').hide();
			$('#oficinaCrear').show();
			break;
		case "btnCancelarOficina":
			$('#oficinaCrear').hide();
			$('#oficinaModificar').hide();
			$('#oficinaInit').show();
			break;
		case "btnCrearOficina":
			$('#frmCrearOficina').submit();
			break;
		case "btnModificarOficina":
			$('#frmModificarOficina').submit();
			break;		
		}
		
	});
	
	listarOficinas();
}); */

function crearOficina(){
	$.ajax({
 		url: 'ajaxCrearOficina',
 		type: 'post',
 		dataType: 'json',
 		data: $('#frmCrearOficina').serialize(),
 		success: function(resultado){
 			$('#txtNombreOfi').val('');
 			$('#txtTelefonoOfi').val('');
 			$('#gmap_geocoding_address').val('');
 			$('#txtLatitud').val('');
 			$('#txtLongitud').val('');
 			listarOficinas(); 			
 		}
 	});	
}

//Open View Form Proveedor
function editarOficina(idOficina){
	$('#oficinaInit').hide();
	$('#oficinaModificar').show();
	//
	$('#txtIdOficinaE').val(idOficina);
	$('#txtNombreOfiE').val($('#spnNombreOfi_'+idOficina).text());
	$('#gmap_geocoding_address_edit').val($('#spnDireccionCompletaOfi_'+idOficina).text());
	$('#txtTelefonoOfiE').val($('#spnTelefonoOfi_'+idOficina).text());
	$('#txtLatitudE').val($('#spnLatitudOfi_'+idOficina).text());
	$('#txtLongitudE').val($('#spnLongitudOfi_'+idOficina).text());
	
	initMapaModificarOficina($('#spnLatitudOfi_'+idOficina).text(), $('#spnLongitudOfi_'+idOficina).text());
	
}
function modificarOficina(){
	$.ajax({
 		url: 'ajaxModificarOficina',
 		type: 'post',
 		dataType: 'json',
 		data: $('#frmModificarOficina').serialize(),
 		success: function(resultado){
 			$('#txtIdOficinaE').val('');
 			$('#txtNombreOfiE').val('');
 			$('#gmap_geocoding_address_edit').val('');
 			$('#txtTelefonoOfiE').val('');
 			$('#txtLatitudE').val('');
 			$('#txtLongitudE').val('');
 			
 			listarOficinas(); 			
 		}
 	});	
}

function eliminarOficina(idOficina){
	if(confirm("Esta seguro que desea eliminar esta oficina?")){
		$.ajax({
	 		url: 'ajaxEliminarOficina-'+idOficina,
	 		type: 'post',
	 		dataType: 'json',
	 		data: '',
	 		success: function(resultado){
	 			$('#txtIdOficinaE').val('');
	 			$('#txtNombreOfiE').val('');
	 			$('#gmap_geocoding_address_edit').val('');
	 			$('#txtTelefonoOfiE').val('');
	 			$('#txtLatitudE').val('');
	 			$('#txtLongitudE').val('');
	 			listarOficinas(); 			
	 		}
	 	});
	}		
}

//


function listarOficinas(){
	$('#oficinaCrear').hide();
	$('#oficinaModificar').hide();
	$('#oficinaInit').show();
	
	
	var html = '';
    $.ajax({
 		url: 'ajaxListarOficinas',
 		type: 'post',
 		dataType: 'json',
 		data: '',
 		success: function(oficinas){
 			oficinasArray = oficinas;
 			$.each(oficinas, function(i, oficina){
 				
 				//var latLng = urlValueToLatLng(oficina.latLng);
 		    	//var marker = addMarker(map, latLng, null, null); 
 		      	//markerCluster.addMarker(marker);
 				
 		      	//addInfoWindow(map, marker, content, "400px", "150px");
 		      	//markers.push(marker);		      									      	
 		      	//fitMarkers(map, markers);
 				
 				
 				//alert(oficina.latLng);
 				//var latLng = oficina.latitud.toString()+', '+oficina.longitud.toString();
 				//var marker = addMarker(map, oficina.latLng, null, null);
 				
 				/* var location = new google.maps.LatLng(oficina.latitud, oficina.longitud);
 				var marker = new google.maps.Marker({
					position: location,
					map: map,
					title:"Lima"});
 				marker.setMap(map); */
 				//
	 			var source = $("#templateOficinas").html();
	 			var template = Handlebars.compile(source);
	 			html += template(oficina);
	 			
 			});
 			
 			$("#viewOficinasHandlerbars").html(html);	        
 		},
 		complete: function() {	 			
 			//removeNulls();
 			if(flag==-1){
 				initMapOficinas(oficinasArray);
 			}
  		}
 	});
}

var oficinasArray = new Array();

function initMapOficinas(entidades) {
	
	var var_location = new google.maps.LatLng(-12.045937, -77.030530);
	
    var var_mapoptions = {
      center: var_location,
      zoom: 4
    };
    
    var var_map = new google.maps.Map(document.getElementById("map-container"),
            var_mapoptions);
    //
    
	/* var var_marker = new google.maps.Marker({
		position: var_location,
		map: var_map,
		title:"Lima"});
	
	var_marker.setMap(var_map); */
	
    //
    $.each(entidades, function(i, entidad){
    	//alert(entidad.latitud+' '+entidad.longitud);
    	var var_location2 = new google.maps.LatLng(entidad.latitud, entidad.longitud);
		var var_marker2 = new google.maps.Marker({
			position: var_location2,
			map: var_map,
			title: entidad.nombre
		});
	
		var_marker2.setMap(var_map);	
    });

}

function initMapaCrearOficina() {
	var map = null;
	var myMarker = null;
	
	map = new google.maps.Map(document.getElementById('gmap_geocoding'), {
	    zoom: 7,
	    center: new google.maps.LatLng(-12.045937, -77.030530),
	    mapTypeId: google.maps.MapTypeId.ROADMAP
	});    	
		
}
	
function iniciarMapaGeocoderOficina(){
	var text = $.trim($('#gmap_geocoding_address').val());
    geocoder = new google.maps.Geocoder();
    
    geocoder.geocode({'address':text}, function(results, status){
    	var result; 
    	
        if(status == google.maps.GeocoderStatus.OK){
            result = results[0]; //Take only the first result returned from geocoding
            
            map = new google.maps.Map(document.getElementById('gmap_geocoding'), {
        	    zoom: 15,
        	    mapTypeId: google.maps.MapTypeId.ROADMAP
        	});
            
            myMarker = new google.maps.Marker({
        	    position: results[0].geometry.location,
        	    draggable: true
        	});
            
        	google.maps.event.addListener(myMarker, 'dragend', function(e) {
        		//alert('Hi' + e.latLng.lat().toFixed(6) + ', ' + e.latLng.lng().toFixed(6));
        		map.setCenter(myMarker.position);
        		//
        		$('#txtLatitud').val(e.latLng.lat().toFixed(6));
        		$('#txtLongitud').val(e.latLng.lng().toFixed(6));
        		
        	});
            
            //map.setCenter(results[0].geometry.location);
            
            map.setCenter(myMarker.position);
        	myMarker.setMap(map);
        	//
        	var markerLatLng = myMarker.getPosition();
            //alert('Hi2' + markerLatLng.lat().toFixed(6) + ', ' + markerLatLng.lng().toFixed(6));
            //
    		$('#txtLatitud').val(markerLatLng.lat().toFixed(6));
    		$('#txtLongitud').val(markerLatLng.lng().toFixed(6));
        }else{
        	result = null;
            //alert('Geocode of Address: \"'+ address +'\" was not successful for the following reason: '+status);
        }            
           
    });      
    
}	

/* $('#gmap_geocoding_btn').click(function (e) {
	e.preventDefault();
    iniciarMapaGeocoderOficina();
}); */

function initMapaModificarOficina(latitudTemp, longitudTemp){
	var var_location = new google.maps.LatLng(latitudTemp, longitudTemp);
	
    var var_mapoptions = {
      center: var_location,
      zoom: 15
    };
    
    var var_map = new google.maps.Map(document.getElementById("gmap_geocoding_edit"),
            var_mapoptions);
    //
    
	var var_marker = new google.maps.Marker({
		position: var_location,
		map: var_map,
		draggable: true
	});
	
	google.maps.event.addListener(var_marker, 'dragend', function(e) {
		//alert('Hi' + e.latLng.lat().toFixed(6) + ', ' + e.latLng.lng().toFixed(6));
		var_map.setCenter(var_marker.position);
		//
		$('#txtLatitudE').val(e.latLng.lat().toFixed(6));
		$('#txtLongitudE').val(e.latLng.lng().toFixed(6));
		
	});
	
	var_marker.setMap(var_map);
}

function iniciarEditMapaGeocoderOficina(){
	var text = $.trim($('#gmap_geocoding_address_edit').val());
    geocoder = new google.maps.Geocoder();
    
    geocoder.geocode({'address':text}, function(results, status){
    	var result; 
    	
        if(status == google.maps.GeocoderStatus.OK){
            result = results[0]; //Take only the first result returned from geocoding
            
            map = new google.maps.Map(document.getElementById('gmap_geocoding_edit'), {
        	    zoom: 15,
        	    mapTypeId: google.maps.MapTypeId.ROADMAP
        	});
            
            myMarker = new google.maps.Marker({
        	    position: results[0].geometry.location,
        	    draggable: true
        	});
            
        	google.maps.event.addListener(myMarker, 'dragend', function(e) {
        		//alert('Hi' + e.latLng.lat().toFixed(6) + ', ' + e.latLng.lng().toFixed(6));
        		map.setCenter(myMarker.position);
        		//
        		$('#txtLatitudE').val(e.latLng.lat().toFixed(6));
        		$('#txtLongitudE').val(e.latLng.lng().toFixed(6));
        		
        	});
            
            //map.setCenter(results[0].geometry.location);
            
            map.setCenter(myMarker.position);
        	myMarker.setMap(map);
        	//
        	var markerLatLng = myMarker.getPosition();
            //alert('Hi2' + markerLatLng.lat().toFixed(6) + ', ' + markerLatLng.lng().toFixed(6));
            //
    		$('#txtLatitudE').val(markerLatLng.lat().toFixed(6));
    		$('#txtLongitudE').val(markerLatLng.lng().toFixed(6));
        }else{
        	result = null;
            //alert('Geocode of Address: \"'+ address +'\" was not successful for the following reason: '+status);
        }            
           
    });      
    
}


</script>

<script id="templateOficinas" type="text/x-handlebars-template">
	<tr>
		<td>
			Nombre: <span id="spnNombreOfi_{{idOficina}}" class="font-blue-hoki">{{nombre}}</span><br>
			Telefono: <span id="spnTelefonoOfi_{{idOficina}}" class="font-blue-hoki">{{telefonoOficina}}</span><br>
			Direccion: <span id="spnDireccionCompletaOfi_{{idOficina}}" class="font-blue-hoki">{{direccionCompleta}}</span>			
			<span style="display:none" id="spnLatitudOfi_{{idOficina}}" class="font-blue-hoki">{{latitud}}</span>
			<span style="display:none" id="spnLongitudOfi_{{idOficina}}" class="font-blue-hoki">{{longitud}}</span>
		</td>
		<td>
			<a id="btnEditarOficina_{{idOficina}}" class="btn btn-default btn-sm eventBtn" onclick="editarOficina({{idOficina}});" ><i class="fa fa-pencil"></i> Editar </a>
			<a id="btnBorrarOficina_{{idOficina}}" class="btn btn-default btn-sm eventBtn" onclick="eliminarOficina({{idOficina}});" ><i class="fa fa-trash"></i> Borrar </a>
		</td>
	</tr>
</script>
<div class="row">
	<div class="col-md-12">
		<!-- BEGIN PORTLET-->
		<div id="oficinaInit" class="portlet box blue-hoki">
			<div class="portlet-title">
				<div class="caption">Oficinas</div>
				<div class="actions">
					<a id="btnIrCrearOficina" class="btn btn-default btn-sm eventBtn"><i class="fa fa-plus"></i> Nueva </a>
					<a class="btn btn-icon-only btn-default btn-sm fullscreen" href="#" data-original-title="" title="">
					</a>
				</div>
			</div>
			<div class="portlet-body">
				<div id="map-container" class="gmaps"></div>
				
				<table class="table table-scrollable table-hover">
					<tbody id="viewOficinasHandlerbars"></tbody>
				</table>
			</div>
			
		</div>
		<!-- END PORTLET-->
		
		
		
		<!-- BEGIN GEOCODING PORTLET-->
		<div id="oficinaCrear" class="portlet box blue-hoki" style="display: none;">
			<div class="portlet-title">
				<div class="caption">Oficinas</div>
				<div class="actions">
					<a id="btnCrearOficina" class="btn green-meadow btn-sm eventBtn"><i class="fa fa-check"></i> Grabar </a>
					<a id="btnCancelarOficina" class="btn red-sunglo btn-sm eventBtn"><i class="fa fa-close"></i> Cancelar </a>
					<a class="btn btn-icon-only btn-default btn-sm fullscreen" href="#" data-original-title="" title="">
					</a>
				</div>
			</div>
			<div class="portlet-body">
			
			<form:form id="frmCrearOficina" commandName="oficina">
			
			<div class="row">
				<div class="col-md-12">
				
					<div class="input-group col-md-12">
						<input type="text" class="form-control col-md-12" id="gmap_geocoding_address" placeholder="direccion, distrito, ciudad, pais" name="direccionCompleta">
						<span class="input-group-btn"><span class="btn blue" id="gmap_geocoding_btn" onclick="iniciarMapaGeocoderOficina();"><i class="fa fa-search"></i></span></span>
					</div>
				
				</div>
			</div>
			<div id="gmap_geocoding" class="gmaps"></div>
			
			<div class="form-horizontal margin-top-10">
				<div class="form-body">
				
					<div class="form-group">
						<label class="control-label col-md-2">Nombre Oficina:</label>
						<div class="col-md-8"><input id="txtNombreOfi" class="form-control" type="text" name="nombre"></div>
					</div>
					<div class="form-group">
						<label class="control-label col-md-2">Telefono:</label>
						<div class="col-md-8"><input id="txtTelefonoOfi" class="form-control" type="text" name="telefonoOficina"></div>
					</div>
					<div class="form-group" style="display:none">
						<label class="control-label col-md-2">Latitud:</label>
						<div class="col-md-8"><input id="txtLatitud" class="form-control" type="hidden" name="latitud"></div>
					</div>
					<div class="form-group" style="display:none">
						<label class="control-label col-md-2">Longitud:</label>
						<div class="col-md-8"><input id="txtLongitud" class="form-control" type="hidden" name="longitud"></div>
					</div>
				
				</div>
			</div>
			
		</form:form>
		
		</div>
	</div>
	<!-- END GEOCODING PORTLET-->
	
	
	<!-- BEGIN GEOCODING PORTLET-->
		<div id="oficinaModificar" class="portlet box blue-hoki" style="display: none;">
			<div class="portlet-title">
				<div class="caption">Oficinas</div>
				<div class="actions">
					<a id="btnModificarOficina" class="btn green-meadow btn-sm eventBtn"><i class="fa fa-check"></i> Grabar </a>
					<a id="btnCancelarOficina" class="btn red-sunglo btn-sm eventBtn"><i class="fa fa-close"></i> Cancelar </a>
					<a class="btn btn-icon-only btn-default btn-sm fullscreen" href="#" data-original-title="" title="">
					</a>
				</div>
			</div>
			<div class="portlet-body">
			
			<form:form id="frmModificarOficina" commandName="oficina">
			
			<div class="row">
				<div class="col-md-12">
				
					<div class="input-group col-md-12">
						<input type="text" class="form-control col-md-12" id="gmap_geocoding_address_edit" placeholder="direccion, distrito, ciudad, pais" name="direccionCompleta">
						<span class="input-group-btn"><span class="btn blue" id="gmap_geocoding_btn" onclick="iniciarEditMapaGeocoderOficina();"><i class="fa fa-search"></i></span></span>
					</div>
				
				</div>
			</div>
			<div id="gmap_geocoding_edit" class="gmaps"></div>
			
			<div class="form-horizontal margin-top-10">
				<div class="form-body">
					<div class="form-group" style="display:none">
						<label class="control-label col-md-2">Id Oficina:</label>
						<div class="col-md-8"><input id="txtIdOficinaE" class="form-control" type="hidden" name="idOficina"></div>
					</div>
					<div class="form-group">
						<label class="control-label col-md-2">Nombre Oficina:</label>
						<div class="col-md-8"><input id="txtNombreOfiE" class="form-control" type="text" name="nombre"></div>
					</div>
					<div class="form-group">
						<label class="control-label col-md-2">Telefono:</label>
						<div class="col-md-8"><input id="txtTelefonoOfiE" class="form-control" type="text" name="telefonoOficina"></div>
					</div>
					<div class="form-group" style="display:none">
						<label class="control-label col-md-2">Latitud:</label>
						<div class="col-md-8"><input id="txtLatitudE" class="form-control" type="hidden" name="latitud"></div>
					</div>
					<div class="form-group" style="display:none">
						<label class="control-label col-md-2">Longitud:</label>
						<div class="col-md-8"><input id="txtLongitudE" class="form-control" type="hidden" name="longitud"></div>
					</div>
				
				</div>
			</div>
			
		</form:form>
		
		</div>
	</div>
	<!-- END GEOCODING PORTLET-->
	
		
	</div>
</div>