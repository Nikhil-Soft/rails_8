require 'httparty'

class ProductApiService
  include HTTParty
  base_uri 'https://fakestoreapi.com'

  def fetch_products
    response = self.class.get('/products')
    if response.success?
      response.parsed_response
    else
      Rails.logger.error "Failed to fetch products: #{response.code} #{response.message}"
      []
    end
  end
end