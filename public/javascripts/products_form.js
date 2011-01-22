$(document).ready(function(){
  $('select').change(function(){
        if ($('select option:selected').val() == "otra" ){
            brandName = prompt('Nombre de Marca');
            if (brandName != null){
                $.post("/brands" , {brand: {name: brandName}})
            }
        }
  });
});
