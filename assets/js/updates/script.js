(function ($) 
{
  "use strict";

     
});

    function areyousure()
    {
        return confirm('Are You Sure You Want Delete This');
    }
    $(function() {
        // $('#example1').dataTable({
        // });
    });


    $(function() {
    
        $('.chzn').chosen();
        
    });


    $(function() {
        //bootstrap WYSIHTML5 - text editor
        $(".txtarea").wysihtml5();
    });

    $(function() {
            $( "#datepicker" ).pickmeup({
            format  : 'Y-m-d'
        });
    });




  $(document).ready(function(){
    $('.redactor').redactor({
            minHeight: 200,
            imageUpload:  admin_folder_wysiwyg+'upload_image',
            fileUpload:   admin_folder_wysiwyg+'upload_file',
            imageGetJson: admin_folder_wysiwyg+'get_images', 
            imageUploadErrorCallback: function(json)
            {
                alert(json.error);
            },
            fileUploadErrorCallback: function(json)
            {
                alert(json.error);
            }
      });
});
  
    