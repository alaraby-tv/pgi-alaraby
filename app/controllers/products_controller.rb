class ProductsController < ApplicationController

  # GET /products
  # GET /products.json
  def index
    @products = Product.active_products.order(created_at: :desc).page(params[:page])
  end

  def owned
    @products = current_user.active_products.order(created_at: :desc).page(params[:page])
    render 'index'
  end

  def single
    @products = Product.active_products.joins(:product_type).where(product_types: {sort: 'Single product'}).order(created_at: :desc).page(params[:page])
    render 'index'
  end

  def multi_episode
    @products = Product.active_products.joins(:product_type).where(product_types: {sort: 'Multi episode product'}).order(created_at: :desc).page(params[:page])
    render 'index'
  end

  def shared
    @products = current_user.permited_products.order(created_at: :desc).page(params[:page])
    render 'index'
  end

  # GET /products/1
  # GET /products/1.json
  def show
    @product = Product.find(params[:id])
  end

  # GET /products/new
  def new
    @product = Product.new
  end


  def create
    @product = current_user.products.new
    @product.save(validate: false)
    @product.add_marketing_materials
    redirect_to product_step_path(@product, Product.form_steps.first)
  end

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
    @product.destroy
    respond_to do |format|
      format.html { redirect_to products_url, notice: 'Product was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
end
