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
            title: "Are you sure?",
            text: "Do you want delete selected item!",
            type: "warning",
            showCancelButton: true,
            confirmButtonColor: "#DD6B55",
            confirmButtonText: "Yes, delete it!",
            cancelButtonText: "No, cancel plx!",
            closeOnConfirm: false,
            closeOnCancel: false
        },
        function (isConfirm) {
            if (isConfirm) {
                form.submit()
            } else {
                swal("Cancelled", "Your it is safe :)", "error");
            }
        });
    });

    /** Keep track of which modal button was clicked. **/
    var currentModalBtn;
    jQuery('.modal-btn').click(function(){
        currentModalBtn = jQuery(this);
    });
        
    jQuery('.laradrop').laradrop({
        onInsertCallback: function (obj){
            // Populate our id and src
            currentModalBtn.closest('.imageUpload').find('.file-id').text(obj.id);
            currentModalBtn.closest('.imageUpload').find('input.file-src').val(obj.src);
            
            $('#modalLaradrop').modal('toggle');
        },
        onErrorCallback: function(jqXHR,textStatus,errorThrown){
            // if you need an error status indicator, implement here
            alert('An error occured: '+ errorThrown);
        },
        onSuccessCallback: function(serverData){
            // if you need a success status indicator, implement here
        }
    }); 
});

function printOrder(orderStateId,order,items,specials,notes){
    var order       = JSON.parse(order);
    var items       = JSON.parse(items);
    var specials    = JSON.parse(specials);
    var notes       = JSON.parse(notes);
    console.log('%o',order);
    console.log('%o',items);
    console.log('%o',specials);
    console.log('%o',notes);

    console.log('printOrder',JSON.stringify(order));
    var printContents, popupWin;
    if(orderStateId == '1') {
      printContents = this.templateOrder(order,items,specials,notes);
    } else {
      printContents = this.templateOrderCompleted(order,items,specials,notes);
    }
    popupWin = window.open('', '_blank', 'top=0,left=0,height=auto,width=auto');
    popupWin.document.open();
    popupWin.document.write(`
      <html>
        <head>
          <title>Ordinazione</title>
          <link rel="stylesheet" type="text/css" href="{{ asset(\'css/bootstrap.css\' }}" />
	        <link rel="stylesheet" type="text/css" href="{{ asset(\'assets/css/main.css\' }}" />
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
            padding: 15px;
          }
          .printOrder .tableComande {
            font-size: 1.5em;
          }
          .printOrder .tableRicevuta {
            font-size: 1em;
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
    '     <h2>'+order.client+'</h2>'+
    '     <h4>Date: '+moment(order.date).format('MM DD, YYYY HH:mm A')+'</h4>'+
    '  </div>'+     
    '  <hr />'+     
    '  <table class="table table-hover tableComande">'+
    '    <thead>'+
    '      <tr>'+
    '        <th>QTY</th>'+
    '        <th>ITEM</th>'+
    '      </tr>'+
    '    </thead>'+
    '    <tbody>';

    for (var item of items) {
      var classItem = '';
      if(item.state == 'pending') {
        classItem = '';
      } else {
        classItem = 'deleteItem';
      }
      template += ''+
      '      <tr class="'+classItem+'">'+
      '        <td>'+item.quantity+'x </td>';
      if(item.note != '') {
        template += '<td>'+item.name+'<br /><em>('+item.note+')</em></td>';
      } else {
        template += '<td>'+item.name+'</td>';        
      }
      template += ''+
      '      </tr>';
    }

    for (var special of specials) {
      var classItem = '';
      if(special.state == 'pending') {
        classItem = '';
      } else {
        classItem = 'deleteItem';
      }
      template += ''+
      '      <tr class="'+classItem+'">'+
      '        <td>1x </td>';
      if(special.note != '') {
        template += '<td>'+special.name+'<br /><em>('+special.note+')</em></td>';
      } else {
        template += '<td>'+special.name+'</td>';        
      }
      template += ''+
      '      </tr>';
    }

    template += ''+
    '    </tbody>'+
    '  </table>';

    for (var note of notes) {
      template += ''+
      '      <div class="notesList">'+
      '        - <em>'+note.note+'</em>'+
      '      </div>';
    }

    return template;
  }

function  templateOrderCompleted(order,items,specials,notes) {
    var template = ''+
    '<div class="container printOrder">'+
    '  <div class="logo"><img src="{{ asset(\'img/logo-small.png\') }}" /></div>'+
    '  <hr />'+     
    '  <div class="orderInfo">'+     
    '     <h2>'+order.client+'</h2>'+
    '     <h4>Date: '+moment(order.date).format('MM DD, YYYY HH:mm A')+'</h4>'+
    '  </div>'+     
    '  <hr />'+     
    '  <table class="table table-hover tableRicevuta">'+
    '    <thead>'+
    '      <tr>'+
    '        <th>QTY</th>'+
    '        <th>ITEM</th>'+
    '        <th>TOTAL</th>'+
    '      </tr>'+
    '    </thead>'+
    '    <tbody>';

    for (var item of items) {
      console.log('%o',item);
      template += ''+
      '      <tr>'+
      '        <td>'+item.quantity+'x </td>'+
      '        <td>'+item.menuname+'</td>'+
      '        <td>&euro; '+item.total+'</td>'+
      '      </tr>';
    }

    for (var special of specials) {
      template += ''+
      '      <tr>'+
      '        <td>1x </td>'+
     '         <td>'+special.special+'</td>'+ 
      '        <td>&euro; '+special.price+'</td>'+
      '      </tr>';
    }

    template += ''+
      '      <tr>'+
      '        <td></td>'+
      '        <td><strong>Total</strong></td>'+
      '        <td><strong>&euro; '+order.totalorder+'</strong></td>'+
      '      </tr>'+
      '      <tr>'+
      '        <td></td>'+
      '        <td></td>'+
      '        <td><strong>Service (10%)</td></strong>'+
      '        <td><strong>&euro; '+order.totalservice+'</strong></td>'+
      '      </tr>';

    template += ''+
    '    </tbody>'+
    '  </table>';

    template += ''+
    '  <hr />'+     
    '  <div class="orderInfo">'+     
    '     <h3>Thank you</h3>'+
    '     <h3>Please come again!</h3>'+
    '  </div>'+ 
    '</div>';
    return template;
  }