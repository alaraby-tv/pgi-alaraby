class AttachmentsController < ApplicationController

  def show
    @attachment = Attachment.find(params[:id])
    
    send_data(@attachment.file_attached.read,
      type: @attachment.file_attached.content_type,
      disposition: 'attachment',
      filename: @attachment.file_attached.identifier)
  end

  def create
    @attachment = Attachment.new(attachment_params)

    respond_to do |format|
      if @attachment.save
        @attachment.update(user: current_user)
        AttachmentMailer.email_on_creation(@attachment).deliver_now
        format.html { redirect_back(fallback_location: root_path) }
        format.json { render :show, status: :created, location: root_path }
      else
        flash[:error] = @attachment.errors.full_messages.first
        format.html { redirect_back(fallback_location: root_path) }
      end
    end
  end

  private

  def attachment_params
    params.fetch(:attachment).permit(:file_attached, :notes, :marketing_material_id)
  end
end
