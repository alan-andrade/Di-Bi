$(document).ready(function(){
  $("select option[value=otra]").click(function(){
    brandName = prompt('Nombre de Marca');
    $.post(
      "/brands",
      {brand: {name: brandName}},
      function(data){
        if (data){
          newOption = "<option value="+data.brand.name+">"+ data.brand.name +"</option>";
          $("#product_brand_name").prepend(newOption)[0]
            .selectedIndex = 0;}
      },"json")
  });
})
