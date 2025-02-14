class PagesController < ApplicationController
    def index
        @user = params["name"].blank? ? "User" : params["name"]
    end
end
