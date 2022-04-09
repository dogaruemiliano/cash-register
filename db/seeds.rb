products_data = [{ product_code: 'GR1', name: 'Green Tea', price: 3.11 },
                 { product_code: 'SR1', name: 'Strawberries', price: 5.00 },
                 { product_code: 'CF1', name: 'Coffee', price: 11.23 }]

puts 'Products...'
products_data.each do |data|
  if Product.find_by(product_code: data[:product_code])
    puts "Product with product_code #{data[:product_code]} already created"
  else
    puts "Creating product with product_code #{data[:product_code]}..."
    Product.create(data)
    puts 'Succesfully created Product model'
  end
end
puts 'Products done!'
