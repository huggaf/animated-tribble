class Api::ProductsController < ApplicationController
  skip_before_filter :restrict_access, only: :index
  def index
    render json: Oj.dump(Product.order('products.name').map{|p| ProductSerializer.new(p)})
  end
end