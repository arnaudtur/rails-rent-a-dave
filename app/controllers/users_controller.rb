class UsersController < ApplicationController
    def index
      @users = policy_scope(User)
    end

    def show
      @user = User.find(params[:id])
      authorize @user
    end

    private

    def user_params
      params.require(:user).permit(:name, :email, :password, :photo)
    end
end
