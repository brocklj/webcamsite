class HomeController < ApplicationController
  def welcome
    @images = (Dir.glob("app/assets/images/webcam/*.jpg")).sort
    @images = @images

  end
end
