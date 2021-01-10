class Products::StepsController < ApplicationController
  before_action :set_product
  include Wicked::Wizard

  steps *Product.form_steps

  def show
    render_wizard
  end


  def update
    params[:product][:status] = step.to_s unless @product.active?
    respond_to do |format|
      if @product.update(product_params(step))
        if current_step? 'add_guests_and_presenters'
          if product_params(step).dig(:presenters_attributes)
            product_params(step).dig(:presenters_attributes).each do |v, presenter_attributes|
              if presenter_attributes[:_destroy] == '1'
                presenter = Presenter.find(presenter_attributes[:id])
                @product.presenters.destroy(presenter)
              end
            end
          end
          if product_params(step).dig(:guests_attributes)
            product_params(step).dig(:guests_attributes).each do |v, guest_attributes|
              if guest_attributes[:_destroy] == '1'
                guest = Guest.find(guest_attributes[:id])
                @product.guests.destroy(guest)
              end
            end
          end
        end 
        if step == steps.last
          english_title = @product.english_title
          @product.send_an_email 
          @product.update(status: 'active', english_title: english_title.titleize)
        end

        format.html { render_wizard @product }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render_wizard @product }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end
  
  private

  def set_product
    @product = Product.find(params[:product_id])
  end

  def redirect_to_finish_wizard(*args)
    redirect_to(@product, notice: "Product successfully saved.")
  end

  def product_params(step)
    permitted_attributes = case step
      when "add_type"
        [:status, :product_type_id, :department_id, :nature_id, :category_id, :genre_id, :logo, :broadcast_medium_ids => []]
      when "add_marketing_details"
        [:status, :format_and_structure, :programme_benchmark, :marketing_message_ideas, :age_ids => [], :education_ids => [], :gender_ids => [], :region_ids => []]
      when "add_guests_and_presenters"
        [:status, :production_company_name, :po, guests_attributes: [:id, :name, :_destroy], presenters_attributes: [:id, :name, :_destroy]]
      when "add_details"
        [:status, :english_title, :arabic_title, :full_description, :short_description, :number_of_episodes, :season, :subtitled, :production_year, :broadcasting_year, :production_region, :first_shooting_date, :duration_id, :broadcasting_frequency_id, :broadcasting_time, :broadcasting_date]
      end

    params.require(:product).permit(permitted_attributes).merge(form_step: step)
  end
end