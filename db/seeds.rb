capslim   = Brand.create  :name =>  'Capslim'
demograss = Brand.create  :name =>  'Nutrimalteada'
etapa1    = Product.create :name=>'etapa 1', :base_price=>450.50, :description=>"Se toma primero que todo", :brand=>capslim
nutrimalteada = Product.create :name=>'nutrimalteada', :base_price=>400, :description=>"Evacuaciones ligeras", :brand=>demograss

ventiscas = {:street=>'Colina de las Ventiscas #49', :city=>'Naucalpan', :zip=>'54321'}
chiluca   = {:street=>'Castiallo de Nothingam #22', :city=>'Atizapan', :zip=>'23224'}

Customer.create([{:name=>'Beatriz Martinez Acosta', 
                  :email=>'betty@gmail.com', 
                  :home_phone=>'567093443', 
                  :address_attributes=>ventiscas},
                  {:name=>'Juan Acosta Miranda',
                  :email=>'juan.jo@hotmail.com', 
                  :home_phone=>'53735982',
                  :cellphone=>'2225166029',
                  :address_attributes=>chiluca}])

boss    = Boss.create :name=>'Patricia Cestelos',  :email=>'patcestelos@hotmail.com', :home_phone=>'54321223'
altena  = Store.create({:name=>'La Altenia',:boss=>boss, :address_attributes=>{:street=>'Pasea de Lomas Verdes #23',
                                                                  :city =>  'Mexico',
                                                                  :zip  =>  '43231'}})
atizapan  = Store.create({:name=>'Atizapan',:boss=>boss, :address_attributes=>{:street=>'Boulvard de Atizapan #45',
                                                                  :city =>  'Mexico',
                                                                  :zip  =>  '43210'}})

Employee.create([ {:name=>"Aris Gonzales Perez", :email=>'aris@dibi.com', :home_phone=>'43451212'},
                  {:name=>"Juanita la del Barrio", :email=>'juanita@dibi.com', :home_phone=>'1231231235'}])
                  
## Surtir a las tiendas con productos. Es igual a llenar el stock.
altena.stock.stock_products << StockProduct.new(:product=>etapa1,:quantity=>10, :perish_on=>Date.today+1.month)
