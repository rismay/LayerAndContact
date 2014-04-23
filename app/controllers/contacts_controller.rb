class ContactsController < ApplicationController
  def user_params
    params.require(:contact).permit(:name, :email, :userid)
  end

  def create
    @contact = Contact.new(user_params)
    if @contact.save
      render json: @contact
    else
      render json: @contact.errors.full_messages, status: :unprocessable_entity
    end
  end

  def destroy
    @contact = Contact.find(params[:id])
    @contact.try(:destroy)

    render json: { :text => "destroyed" }
  end

  def index
    p params
    @user = User.find(params[:user_id])

    render json: @user.contacts
  end

  def show
    @contact = Contact.find(params[:id])
    black_book = @contact.contacts_for_user_id(params[:user_id].to_i)
    p black_book
    match = black_book.select {|contact| params[:id] == contact.id}
    p match
    if !match.nil?
      render json: @contact
    else
      render json: { message: "I don't know you fool" }
    end
  end

  def update
    @contact = Contact.find(params[:id])
    if @contact.update_attributes(user_params)
      render json: @contact
    else
      render json: @contact.errors.full_messages
    end
  end
end
