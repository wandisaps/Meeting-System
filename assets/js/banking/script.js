(function ($) 
{
  "use strict";

});

  jQuery('.datepicker').datetimepicker({
   timepicker:false,
   format:'Y-m-d'
  });

    function areyousure()
    {
        return confirm('Are You Sure You Want Delete This');
    }

    $(function() {
      $('#datable_1').DataTable({
        responsive: true,
        autoWidth: false,
        language: { search: "",
        searchPlaceholder: "Search",
        sLengthMenu: "_MENU_items"

        }
    });
    });


    $(function() {
    
      $('.chzn').chosen();

      $('.datepicker').datetimepicker({
         lang:'en',
         i18n:{
          de:{
           months:[
            'Januar','Februar','März','April',
            'Mai','Juni','Juli','August',
            'September','Oktober','November','Dezember',
           ],
           dayOfWeek:[
            "So.", "Mo", "Di", "Mi", 
            "Do", "Fr", "Sa.",
           ]
          }
         },
         timepicker:false,
         format:'Y-m-d'
        });
        
    });


