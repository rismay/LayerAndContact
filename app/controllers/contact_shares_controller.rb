class ContactSharesController < ApplicationController
  def user_params
    params.require(:contact_share).permit(:userid, :contactid)
  end

  def create
    @contact_share = ContactShare.new(user_params)
    if @contact_share.save
      render json: @contact_share
    else
      render json: @contact_share.errors.full_messages, status: :unprocessable_entity
    end
  end

  def destroy
    @contact_share = ContactShare.find(params[:id])
    @contact_share.try(:destroy)

    render json: { :text => "destroyed" }
  end
end