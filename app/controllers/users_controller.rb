class UsersController < ApplicationController

    def new
        @user = User.new
    end

    def create
        @user = User.create(params.required(:user).permit(:name, :inscription, :email, :phone, :password))
    end
end
