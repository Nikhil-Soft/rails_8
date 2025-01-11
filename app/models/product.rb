class Product < ApplicationRecord
  has_many :subscribers, dependent: :destroy

  has_rich_text :description
  validates :name, presence: true

  has_one_attached :featured_image
  # validates :inventory_count, numericality: { greater_than_or_equal_to: 0 }

  # def self.import_from_api
  #   service = ProductApiService.new
  #   debugger
  #   products = service.fetch_products

  #   products.each do |product_data|
  #     Product.find_or_create_by(external_id: product_data['id']) do |product|
  #       product.name = product_data['title']
  #       # product.description = product_data['description']
  #       # product.price = product_data['price']
  #     end
  #   end
  # end
end
