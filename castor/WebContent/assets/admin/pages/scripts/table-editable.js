var TableEditable = function () {

    var handleTable = function () {
   
        function restoreRow(oTable, nRow) {
            var aData = oTable.fnGetData(nRow);
            var jqTds = $('>td', nRow);

            for (var i = 0, iLen = jqTds.length; i < iLen; i++) {
                oTable.fnUpdate(aData[i], nRow, i, false);
            }

            oTable.fnDraw();
        }

        function editRow(oTable, nRow) {
            var aData = oTable.fnGetData(nRow);
            var jqTds = $('>td', nRow);
                        
            jqTds[0].innerHTML = '<input type="hidden" name="idCliente" value="'+ aData[0] +'">';
            jqTds[1].innerHTML = '<input type="text" class="form-control input-small" name="ruc" value="' + aData[1] + '">';
            jqTds[2].innerHTML = '<input type="text" class="form-control input-small" name="nombre" value="' + aData[2] + '">';
            jqTds[3].innerHTML = '<input type="text" class="form-control input-large" name="direccion" value="' + aData[3] + '">';
            jqTds[4].innerHTML = '<a class="edit" href="">Grabar</a>';
            jqTds[5].innerHTML = '<a class="cancel" href="">Cancelar</a>';
        }

        function saveRow(oTable, nRow) {
            var jqInputs = $('input', nRow);
            oTable.fnUpdate(jqInputs[0].value, nRow, 0, false);
            oTable.fnUpdate(jqInputs[1].value, nRow, 1, false);
            oTable.fnUpdate(jqInputs[2].value, nRow, 2, false);
            oTable.fnUpdate(jqInputs[3].value, nRow, 3, false);
            oTable.fnUpdate('<a class="edit" href="">Editar</a>', nRow, 4, false);
            oTable.fnUpdate('<a class="delete" href="">Borrar</a>', nRow, 5, false);
            oTable.fnDraw();
        }

        function cancelEditRow(oTable, nRow) {
            var jqInputs = $('input', nRow);
            oTable.fnUpdate(jqInputs[0].value, nRow, 0, false);
            oTable.fnUpdate(jqInputs[1].value, nRow, 1, false);
            oTable.fnUpdate(jqInputs[2].value, nRow, 2, false);
            oTable.fnUpdate(jqInputs[3].value, nRow, 3, false);
            oTable.fnUpdate('<a class="edit" href="">Editar</a>', nRow, 4, false);
            oTable.fnDraw();
        }
        
        function borrarCrearTabla(){
        	$('#sample_editable_1').remove();
			$('#sample_editable_1_wrapper').remove();
		
		
			$('#divPortletBody').append(
				"<table class='table table-striped table-hover' id='sample_editable_1'><thead><tr><th></th><th>RUC</th><th>Nombre</th><th>Direccion</th>" +
				"<th>Acciones</th><th>Delete</th></tr></thead><tbody id='viewClientesHandlerbars'></tbody></table>"	
			);
        }

        var table = $('#sample_editable_1');

        var oTable = table.dataTable({

            // Uncomment below line("dom" parameter) to fix the dropdown overflow issue in the datatable cells. The default datatable layout
            // setup uses scrollable div(table-scrollable) with overflow:auto to enable vertical scroll(see: assets/global/plugins/datatables/plugins/bootstrap/dataTables.bootstrap.js). 
            // So when dropdowns used the scrollable div should be removed. 
            //"dom": "<'row'<'col-md-6 col-sm-12'l><'col-md-6 col-sm-12'f>r>t<'row'<'col-md-5 col-sm-12'i><'col-md-7 col-sm-12'p>>",

            "lengthMenu": [
                [5, 15, 20, -1],
                [5, 15, 20, "All"] // change per page values here
            ],

            // Or you can use remote translation file
            //"language": {
            //   url: '//cdn.datatables.net/plug-ins/3cfcc339e89/i18n/Portuguese.json'
            //},

            // set the initial value
            "pageLength": 10,

            "language": {
                "lengthMenu": " _MENU_ records"
            },
            "columnDefs": [{ // set default column settings
                'orderable': true,
                'targets': [0]
            }, {
                "searchable": true,
                "targets": [0]
            }],
            "order": [
                [0, "asc"]
            ] // set first column as a default sort by asc
        });
        
        var tableWrapper = $("#sample_editable_1_wrapper");

        tableWrapper.find(".dataTables_length select").select2({
            showSearchInput: false //hide search box with special css class
        }); // initialize select2 dropdown

        var nEditing = null;
        var nNew = false;

        $('#sample_editable_1_new').click(function (e) {
            e.preventDefault();

            if (nNew && nEditing) {
                if (confirm("Previose row not saved. Do you want to save it ?")) {
                    saveRow(oTable, nEditing); // save
                    $(nEditing).find("td:first").html("Untitled");
                    nEditing = null;
                    nNew = false;
                } else {
                    oTable.fnDeleteRow(nEditing); // cancel
                    nEditing = null;
                    nNew = false;
                    
                    return;
                }
            }

            var aiNew = oTable.fnAddData(['', '', '', '', '', '']);
            var nRow = oTable.fnGetNodes(aiNew[0]);
            editRow(oTable, nRow);
            nEditing = nRow;
            nNew = true;
        });

        table.on('click', '.delete', function (e) {
            e.preventDefault();
            
            if(confirm("¿Seguro de Borrar?") == false) {
                return;
            }

            var nRow = $(this).parents('tr')[0];
            var aData = oTable.fnGetData(nRow);
            oTable.fnDeleteRow(nRow);
            //alert("Deleted! Do not forget to do some ajax to sync with backend :)");
            $.ajax({
    	 		url: 'ajaxEliminarCliente-' + aData[0],
    	 		type: 'post',
    	 		dataType: 'json',
    	 		data: '',
    	 		success: function(resultado){
    	 			//listarClientes(); 			
    	 		}
    	 	});
        });

        table.on('click', '.cancel', function (e) {
            e.preventDefault();
            
            if (nNew) {
                oTable.fnDeleteRow(nEditing);
                nEditing = null;
                nNew = false;
            } else {
                restoreRow(oTable, nEditing);
                nEditing = null;
            }
        });

        table.on('click', '.edit', function (e) {
            e.preventDefault();
            
            /* Get the row as a parent of the link that was clicked on */
            var nRow = $(this).parents('tr')[0];

            if (nEditing !== null && nEditing != nRow) {
                /* Currently editing - but not this row - restore the old before continuing to edit mode */
                restoreRow(oTable, nEditing);
                editRow(oTable, nRow);
                nEditing = nRow;
            } else if (nEditing == nRow && this.innerHTML == "Grabar") {
                /* Editing this row and want to save it */
                saveRow(oTable, nEditing);
                nEditing = null;
                //alert("Updated! Do not forget to do some ajax to sync with backend :)");
                var aData = oTable.fnGetData(nRow);
                
                if(aData[0] == ""){
                	$('#frmModificarCliente').remove();
                    $('<form id="frmModificarCliente_'+ aData[0] +'" method="post">'+
                    		'<input type="hidden" name="idCliente" value="'+ aData[0] +'">'+
                    		'<input type="hidden" name="ruc" value="'+ aData[1] +'">'+
                    		'<input type="hidden" name="nombre" value="'+ aData[2] +'">'+
                    		'<input type="hidden" name="direccion" value="'+ aData[3] +'">'+
                    '</form>').appendTo('#divFormEditarCliente');
                    
                    $.ajax({
                 		url: 'ajaxCrearCliente',
                 		type: 'post',
                 		dataType: 'json',
                 		data: $('#frmModificarCliente_' + aData[0]).serialize(),
                 		beforeSend: function(){
                 			;
                 		},
                 		success: function(resultado){
                 			$('#frmModificarCliente_').remove();
                 			
                 			borrarCrearTabla();
                 			
                 			listarClientes();			
                 		}
                 	});
                }else{
                    $('<form id="frmModificarCliente_'+ aData[0] +'" method="post">'+
                    		'<input type="hidden" name="idCliente" value="'+ aData[0] +'">'+
                    		'<input type="hidden" name="ruc" value="'+ aData[1] +'">'+
                    		'<input type="hidden" name="nombre" value="'+ aData[2] +'">'+
                    		'<input type="hidden" name="direccion" value="'+ aData[3] +'">'+
                    '</form>').appendTo('#divFormEditarCliente');
                    
                    $.ajax({
                 		url: 'ajaxModificarCliente',
                 		type: 'post',
                 		dataType: 'json',
                 		data: $('#frmModificarCliente_' + aData[0]).serialize(),
                 		beforeSend: function(){
                 			;
                 		},
                 		success: function(resultado){
                 			$('#frmModificarCliente_' + aData[0]).remove();
                 			//borrarCrearTabla();	
                 			//listarClientes();
                 		}
                 	});
                }

            } else {
                /* No edit in progress - let's start one */
                editRow(oTable, nRow);
                nEditing = nRow;
            }
        });
    }

    return {

        //main function to initiate the module
        init: function () {
            handleTable();
        }

    };

}();