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