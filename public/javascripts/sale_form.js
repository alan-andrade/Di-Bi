$(document).ready(function(){
    var loader  = $("#loader");
    $("#customer-finder-form")
      .bind('ajax:loading',   function(){ loader.show();  })
      .bind('ajax:complete',  function(){ loader.hide();  })
      
    $('div[id^="customer_"][class]').live('click', function(){
        //forms changes
        $("#customer_name").val($(this).attr('name'));
        $("#customer_id").val($(this).attr('id'));
        //close the form        
        $("#customer-finder").dialog('close');
    });
})

$(document).ready(function(){
  $('#customer-finder').dialog({
                    autoOpen: false,
                    title:  'Buscador de Clientes',
                    modal: true,
                    width: 400
                    });
                    
  $("#customer_name").focus(function(){
      $('#customer-finder').dialog('open');
      return false;
  })
  
  autocompleteFields();
  
});
  // AutoCompletition.
  function  autocompleteFields(){
  
  
  
      $('.sale_product_name').autocomplete({
          source: function(request, response){
              $.post(
                  "/products/search",
                  { 'name'  : request.term },
                  function(data){
                      response($.map(data, function(product){
                          return{
                              label : product.brand + ', ' + product.name,
                              value : product.id,
                              price : product.price
                          }                  
                      } ) )              
                  },
                  'json'
                  )
          },
          select: function(event, ui){
              event.preventDefault();
              $(this).val(ui.item.label).attr('readonly', true)
                .next('input:hidden').val(ui.item.value)
                .next().next('input').val(ui.item.price).focus();
          },
          focus:  function(event,ui){
                evant.preventDefault();
          }
          ,
			    open: function() {
				    $( this ).removeClass( "ui-corner-all" ).addClass( "ui-corner-top" );
			    },
			    close: function() {
				    $( this ).removeClass( "ui-corner-top" ).addClass( "ui-corner-all" );
			    }
      })
    
  }

