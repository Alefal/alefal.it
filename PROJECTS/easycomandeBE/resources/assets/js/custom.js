$(function() {
    //tinymce.init({ selector:'textarea',   plugins: "link"});
    
    $('.sidebar-toggle').bind('click', function(e) {
        console.log('sidebar-toggle');
        $('#sidebar').toggleClass('active');
        $('.app-container').toggleClass('__sidebar');
    });

    $('.navbar-toggle').bind('click', function(e) {
        console.log('navbar-toggle');

        $('#navbar').toggleClass('active');
        $('.app-container').toggleClass('__navbar');
    });

    $('.buttonDelete').click(function(){
        var form = $(this).parents('form');
        swal({
            title: "Sei sicuro?",
            text: "Vuoi eliminare il prodotto selezionato!",
            type: "warning",
            showCancelButton: true,
            confirmButtonColor: "#DD6B55",
            confirmButtonText: "SI",
            cancelButtonText: "NO",
            closeOnConfirm: false,
            closeOnCancel: false
        },
        function (isConfirm) {
            if (isConfirm) {
                form.submit()
            } else {
                swal("Cancellazione", "La cancellazione è stata annullata :)", "error");
            }
        });
    });

    $('#photoMenu').change(function(ev) {
        console.log('-> '+$(this).val());
        $('.photoMenuPath').val($(this).val());
    });

    /** Keep track of which modal button was clicked. **/
    var currentModalBtn;
    jQuery('.modal-btn').click(function(){
        currentModalBtn = jQuery(this);
    });
    
});

function printOrder(orderStateId,order,items,specials,notes,configurations){
    var order           = JSON.parse(order);
    var items           = JSON.parse(items);
    var specials        = JSON.parse(specials);
    var notes           = JSON.parse(notes);
    var configurations  = JSON.parse(configurations);

    //console.log('%o',order);
    //console.log('%o',items);
    //console.log('%o',specials);
    //console.log('%o',notes);
    //console.log('%o',configurations);
    //console.log('printOrder',JSON.stringify(order));

    var printtablecomandefont   = '1.8em';
    var printtablericevutafont  = '1.2em';

    for (var conf of configurations) {
        console.log('->',conf.key+' | '+conf.enable+' | '+conf.value);

        //Font per la stampa della comanda per la cucina 
        if(conf.key == 'printtablecomandefont' && conf.enable == 1) {
            printtablecomandefont = conf.value;
        }
        //Font per la stampa della comanda per il cliente
        if(conf.key == 'printtablericevutafont' && conf.enable == 1) {
            printtablericevutafont = conf.value;
        }
    }

    console.log('-> ',printtablecomandefont);
    console.log('-> ',printtablericevutafont);
    
    var printContents, popupWin;
    if(orderStateId == '1') {
      printContents = this.templateOrder(order,items,specials,notes);
    } else {
      printContents = this.templateOrderCompleted(order,items,specials,notes,configurations);
    }
    popupWin = window.open('', '_blank', 'top=0,left=0,height=auto,width=auto');
    popupWin.document.open();
    popupWin.document.write(`
      <html>
        <head>
            <title>Ordinazione</title>
            <style>
            //........Customized style.......
            .printOrder {
                text-align:center;
                margin: 0 auto;
            }
            .printOrder .orderInfo {
                text-align:center;
            }
            .printOrder .logo {
                text-align:center;
            }
            .printOrder .logo img {
                margin: 0 auto;
                max-width: 150px;
            }
            .printOrder .deleteItem {
                /*text-decoration: line-through;*/
                display: none;
            }
            .printOrder .notesList {
                padding-top: 15px;
            }

            .printOrder .tableComande {
                font-size: `+printtablecomandefont+`;
                width: 100%;
                border-collapse: collapse; 
            }
            .printOrder .tableComande th {
                text-align: left;
                border-bottom: 1px solid #ccc;
                padding: 5px;
            }
            .printOrder .tableComande td {
                border-bottom: 1px solid #ddd;
                padding: 5px;
            }

            .printOrder .tableRicevuta {
                font-size: `+printtablericevutafont+`;
                width: 100%;
                border-collapse: collapse; 
            }
            .printOrder .tableRicevuta th {
                text-align: left;
                border-bottom: 1px solid #ccc;
                padding: 5px;
            }
            .printOrder .tableRicevuta td {
                border-bottom: 1px solid #ddd;
                padding: 5px;
            }
            </style>
        </head>
        <body onload="window.print();window.close()">${printContents}</body>
      </html>`
    );
    popupWin.document.close();
}

function templateOrder(order,items,specials,notes) {
    var template = ''+
    '<div class="container printOrder">'+    
    '  <div class="orderInfo">'+     
    '     <h3>'+order.client+'</h3>'+
    '  </div>'+     
    '  <table class="table table-hover tableComande">'+
    '    <tbody>';

    for (var item of items) {
      var classItem = '';
      if(item.statename == 'pending') {
        classItem = '';
      } else {
        classItem = 'deleteItem';
      }
      template += ''+
      '      <tr class="'+classItem+'">'+
      '        <td>'+item.quantity+'x </td>';
      if(item.note != '') {
        template += '<td>'+item.menuname+'<br /><em>('+item.note+')</em></td>';
      } else {
        template += '<td>'+item.menuname+'</td>';        
      }
      template += ''+
      '      </tr>';
    }
    
    for (var special of specials) {
      var classItem = '';
      if(special.statename == 'pending') {
        classItem = '';
      } else {
        classItem = 'deleteItem';
      }
      template += ''+
      '      <tr class="'+classItem+'">'+
      '        <td>1x </td>';
      if(special.note != '') {
        template += '<td>'+special.special+'<br /><em>('+special.note+')</em></td>';
      } else {
        template += '<td>'+special.special+'</td>';        
      }
      template += ''+
      '      </tr>';
    }
    
    template += ''+
    '    </tbody>'+
    '  </table>';

    if(notes.length > 0){
      template += ''+
        ' <div class="notesList">'+
        '     <strong>NOTE:</strong>'+
        '     <br /><h3>';
      for (var note of notes) {
        template += ''+
        '     <em>'+note.note+'</em>; ';
      }
       template += ''+
        ' </h3></div>';
    }
    
    template += ''+
      '</div>';
    
    return template;
  }

function  templateOrderCompleted(order,items,specials,notes,configurations) {

    var serviceenable       = false;
    var coveredenable       = false;
    var printtitle          = '<img src="../img/logo-small-print.png" />';
    var printmessageline1   = 'Arrivederci';
    var printmessageline2   = 'A presto...';

    console.log('%o',items);
    console.log('%o',configurations);

    for (var conf of configurations) {
        console.log('->',conf.key+' | '+conf.enable);

        //Servizio 10% del total
        if(conf.key == 'serviceenable' && conf.enable == 1) {
            serviceenable = true;
        } 
        //Prezzo per coperto
        else if(conf.key == 'coveredenable' && conf.enable == 1) {
            coveredenable = true;
        }
        //Titolo della stampa 
        else if(conf.key == 'printtitle' && conf.enable == 1) {
            printtitle = '<h2>'+conf.value+'</h2>';
        }
        //Primo messaggio nella stampa della ricevuta 
        else if(conf.key == 'printmessageline1' && conf.enable == 1) {
            printmessageline1 = conf.value;
        }
        //Secondo messaggio nella stampa della ricevuta
        else if(conf.key == 'printmessageline2' && conf.enable == 1) {
            printmessageline2 = conf.value;
        }
    }

    var template = ''+
    '<div class="container printOrder">'+
    '  <div class="logo">'+printtitle+'</div>'+
    '  <div class="orderInfo">'+     
    '     <h3>'+order.client+'</h3>'+
    '     <h4>Date: '+moment(order.date).format('DD MM, YYYY HH:mm A')+'</h4>'+
    '  </div>'+     
    '  <hr />'+     
    '  <table class="table table-hover tableRicevuta">'+
    '    <thead>'+
    '      <tr>'+
    '        <th width="10%">QTY</th>'+
    '        <th>ITEM</th>'+
    '        <th>PRICE</th>'+
    '        <th>TOTAL</th>'+
    '      </tr>'+
    '    </thead>'+
    '    <tbody>';

    for (var item of items) {
      template += ''+
      '      <tr>'+
      '        <td width="10%">'+item.quantity+'x </td>'+
      '        <td>'+item.menuname+'</td>'+
      '        <td>&euro; '+parseFloat(item.total) / parseInt(item.quantity)+'</td>'+
      '        <td>&euro; '+item.total+'</td>'+
      '      </tr>';
    }

    for (var special of specials) {
      template += ''+
      '      <tr>'+
      '        <td>1x </td>'+
     '         <td>'+special.special+'</td>'+   
      '        <td></td>'+
      '        <td>&euro; '+special.price+'</td>'+
      '      </tr>';
    }

    //SERVICE or COVERED
    template += '<tr>';
    if(serviceenable) {
        template += ''+
        '   <td></td>'+
        '   <td>Servizio (10%)</td>';
    }
    if(coveredenable) {
        template += ''+
        '   <td> '+order.covered+'x</td>'+
        '   <td>Coperti</td>';
    }
    template += ''+
      '        <td></td>'+
      '        <td>&euro; '+order.totalservice+'</td>'+
      '      </tr>';

    //TOTAL
    template += ''+
      '      <tr>'+
      '        <td></td>'+
      '        <td></td>'+
      '        <td><strong>Total</strong></td>'+
      '        <td><strong>&euro; '+(parseFloat(order.totalorder) + parseFloat(order.totalservice)).toFixed(2)+'</strong></td>'+
      '      </tr>';

    template += ''+
    '    </tbody>'+
    '  </table>';

    template += ''+
    '  <hr />'+     
    '  <div class="orderInfo">'+     
    '     <h3>'+printmessageline1+'</h3>'+
    '     <h3>'+printmessageline2+'</h3>'+
    '  </div>'+ 
    '</div>';
    return template;
  }