class HomeController < ApplicationController
  def welcome
    @images = Dir.glob("app/assets/images/webcam/*.jpg")
  end
end
