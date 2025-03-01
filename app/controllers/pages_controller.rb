class PagesController < ApplicationController
    def index
        current_user
        @user = @current_user.blank? ? "User" : @current_user.name
    end
end
