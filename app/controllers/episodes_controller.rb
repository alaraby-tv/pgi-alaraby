class EpisodesController < ApplicationController
  before_action :set_episode, only: [:show, :edit, :update, :destroy]
  before_action :set_product

  def index
    @episodes = @product.episodes.page(params[:page])
  end

  def show
  end

  def new
    @episode = @product.episodes.new
  end

  def edit
  end

  def create
    @episode = @product.episodes.build(episode_params)
    @episode.user = current_user
    respond_to do |format|
      if @episode.save
        EpisodeMailer.email_on_creation(@episode).deliver_now
        
        format.html { redirect_to product_episode_path(@product, @episode), notice: 'Episode was successfully created.' }
        format.json { render :show, status: :created, location: product_episode_path(@product, @episode) }
      else
        format.html { render :new }
        format.json { render json: @episode.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @episode.update(episode_params)
        if episode_params.dig(:guests_attributes)
            episode_params.dig(:guests_attributes).each do |v, guest_attributes|
              if guest_attributes[:_destroy] == '1'
                guest = Guest.find(guest_attributes[:id])
                @episode.guests.destroy(guest)
              end
            end
          end
        EpisodeMailer.email_on_update(@episode).deliver_now
        
        format.html { redirect_to product_episode_path(@product, @episode), notice: 'Episode was successfully updated.' }
        format.json { render :show, status: :ok, location: product_episode_path(@product, @episode) }
      else
        format.html { render :edit }
        format.json { render json: @episode.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @episode.destroy
    respond_to do |format|
      format.html { redirect_to episodes_url, notice: 'Episode was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_product
      @product = Product.find(params[:product_id])
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_episode
      @episode = Episode.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def episode_params
      params.fetch(:episode).permit(:product_id, :user_id, :production_company_name, :po, :episode_number, :english_title, :arabic_title, :topic, :description, :production_region, :first_shooting_date, :subtitled, guests_attributes: [:id, :name, :_destroy])
    end
end