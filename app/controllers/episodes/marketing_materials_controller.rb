class Episodes::MarketingMaterialsController < ApplicationController
  before_action :set_product
  before_action :set_episode
  before_action :set_marketing_material, only: [:show, :edit, :update, :destroy]

  def index
    @marketing_materials = @episode.marketing_materials.page(params[:page])
  end

  def show
  end

  def new
    @marketing_material = @episode.marketing_materials.build
  end

  def edit
  end

  def create
    @marketing_material = @episode.marketing_materials.new(marketing_material_params)
    @marketing_material.update(user_id: current_user.id)
    respond_to do |format|
      if @marketing_material.save
        format.html { redirect_to product_episode_marketing_material_path(@product, @episode, @marketing_material), notice: 'Marketing material was successfully created.' }
        format.json { render :show, status: :created, location: product_episode_marketing_material_path(@product, @episode, @marketing_material) }
      else
        format.html { render :new }
        format.json { render json: @marketing_material.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @marketing_material.update(marketing_material_params)
        format.html { redirect_to product_episode_marketing_material_path(@product, @episode, @marketing_material), notice: 'Marketing material was successfully updated.' }
        format.json { render :show, status: :ok, location: product_episode_marketing_material_path(@product, @episode, @marketing_material) }
      else
        format.html { render :edit }
        format.json { render json: @marketing_material.errors, status: :unprocessable_entity }
      end
    end
  end

  def remove_attachment
    @attachment = Attachment.find(params[:attachment_id])
    @attachment.destroy
    redirect_back(fallback_location: root_path)
  end

  def destroy
    @marketing_material.destroy
    respond_to do |format|
      format.html { redirect_to product_episode_marketing_materials_url(@product, @episode), notice: 'Marketing material was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:product_id])
    end

    def set_episode
      @episode = set_product.episodes.find(params[:episode_id])
    end

    def set_marketing_material
      @marketing_material = MarketingMaterial.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def marketing_material_params
      params.fetch(:marketing_material).permit(:readiness_date, :material_type_id, :name)
    end
end
