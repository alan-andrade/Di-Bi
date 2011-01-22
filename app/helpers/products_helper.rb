module ProductsHelper
  def product_brand_name_select(options={})
    product = options[:product].brand_name if options[:product]
    brand   = options[:brand].name  if options[:brand]
    options_for_select(Brand.all.map{|b| [b.name, b.name]} + [['otra','otra']], (product || brand))
  end
end
