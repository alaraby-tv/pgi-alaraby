class Episodes::ViewingFormsController < ApplicationController
  before_action :set_viewing_form, only: [:show, :edit, :update, :destroy]
  before_action :set_episode
  before_action :set_product

  
  # GET products/1/episodes/1/viewing_forms/1
  # GET products/1/episodes/1/viewing_forms/1.json
  def show
  end

  # GET products/1/episodes/1/viewing_forms/new
  def new
    @viewing_form = @episode.build_viewing_form
  end

  # GET products/1/episodes/1/viewing_forms/1/edit
  def edit
  end

  # POST products/1/episodes/1/viewing_forms
  # POST products/1/episodes/1/viewing_forms.json
  def create
    @viewing_form = @episode.build_viewing_form(viewing_form_params)

    respond_to do |format|
      if @viewing_form.save
        @viewing_form.user = current_user
        format.html { redirect_to product_episode_viewing_form_path(@product, @episode, @viewing_form), notice: 'Viewing form was successfully created.' }
        format.json { render :show, status: :created, location: product_episode_viewing_form_path(@product, @episode, @viewing_form) }
      else
        format.html { render :new }
        format.json { render json: @viewing_form.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT products/1/episodes/1/viewing_forms/1
  # PATCH/PUT products/1/episodes/1/viewing_forms/1.json
  def update
    respond_to do |format|
      if @viewing_form.update(viewing_form_params)
        format.html { redirect_to product_episode_viewing_form_path(@product, @episode, @viewing_form), notice: 'Viewing form was successfully updated.' }
        format.json { render :show, status: :ok, location: product_episode_viewing_form_path(@product, @episode, @viewing_form) }
      else
        format.html { render :edit }
        format.json { render json: @viewing_form.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE products/1/episodes/1/episodes/viewing_forms/1
  # DELETE products/1/episodes/1/episodes/viewing_forms/1.json
  def destroy
    @viewing_form.destroy
    respond_to do |format|
      format.html { redirect_to product_episode(@product, @episode), notice: 'Viewing form was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    def set_product
      @product = Product.find(params[:product_id])
    end

    def set_episode
      @episode = set_product.episodes.find(params[:episode_id])
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_viewing_form
      @viewing_form = set_episode.viewing_form
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def viewing_form_params
      params.fetch(:viewing_form).permit(:user_id, :viewable_type, :viewable_id, :programme_id, :contact_number, :ingest_date, :tx_date, :aspect_ratio, parts_attributes: [:id, :in, :out, :duration, :note, :_destroy])
    end
end
