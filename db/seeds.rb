# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end


require_relative '../app/services/product_api_service'

puts "Fetching products from API..."
service = ProductApiService.new
products = service.fetch_products

if products.any?
  products.each do |product|
    Product.find_or_create_by(
      name: product['title'],
      # description: product['description']
    )
  end
  puts "#{products.count} products imported successfully."
else
  puts "No products were fetched."
end
