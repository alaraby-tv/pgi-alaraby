class MarketingMaterialsController < ApplicationController
  before_action :set_product
  before_action :set_marketing_material, only: [:show, :edit, :update, :destroy]

  def index
    @marketing_materials = @product.marketing_materials.includes(:material_type).order(:name).page(params[:page])
  end

  def show
  end

  def new
    @marketing_material = @product.marketing_materials.build
  end

  def create
    @marketing_material = @product.marketing_materials.new(marketing_material_params)
    @marketing_material.user_id = current_user.id
    respond_to do |format|
      if @marketing_material.save

        format.html { redirect_to product_marketing_material_path(@product, @marketing_material), notice: 'Marketing material was successfully created.' }
        format.json { render :show, status: :created, location: product_marketing_material_path(@product, @marketing_material) }
      else
        format.html { render :new }
        format.json { render json: @marketing_material.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
  end

  def update
    respond_to do |format|
      if @marketing_material.update(marketing_material_params)
  
        format.html { redirect_to product_marketing_material_path(@product, @marketing_material), notice: 'Material was successfully updated.' }
        format.json { render :show, status: :ok, location: product_marketing_material_path(@product, @marketing_material) }
      else
        format.html { render :edit }
        format.json { render json: @marketing_material.errors, status: :unprocessable_entity }
      end
    end
  end

  def remove_attachment
    @attachment = Attachment.find(params[:attachment_id])
    # AttachmentMailer.email_on_delete(@attachment).deliver_now
    @attachment.destroy
    flash[:notice] = 'Attachment successfully deleted.'
    redirect_back(fallback_location: root_path)
  end

  private

  def set_product
    @product = Product.find(params[:product_id])
  end

  def set_marketing_material
    @marketing_material = MarketingMaterial.find(params[:id])
  end

  def marketing_material_params
    params.fetch(:marketing_material).permit(:name, :readiness_date, :material_type_id)
  end
end
