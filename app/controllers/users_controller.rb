class UsersController < ApplicationController

  def index
    users = User.all 
    render json: users
  end

  def show
    user = User.find(params[:id])
    render json: user
  end

  def create
    user = User.new(cat_params)
    # replace the `user_attributes_here` with the actual attribute keys
    if user.save
      render json: user
    else
      render json: user.errors.full_messages, status: :bad_request
    end
  end

  def update
    user = User.find(params[:id])
    user.update(cat_params)
    render json: user
  end

  def destroy
    user = User.find(params[:id])
    user.destroy 
    redirect_to '/users'
  end

   private

  # Using a private method to encapsulate the permissible parameters
  # is just a good pattern since you'll be able to reuse the same
  # permit list between create and update. Also, you can specialize
  # this method with per-user checking of permissible attributes.
  def cat_params
    params.require(:user).permit(:name, :email)
  end

end