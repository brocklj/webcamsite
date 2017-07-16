class HomeController < ApplicationController
  def welcome
    @images = Dir.glob("app/assets/images/webcam/*.jpg")
    @image.sort!
  end
end
