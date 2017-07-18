class HomeController < ApplicationController
  def welcome
    @images = (Dir.glob("app/assets/images/webcam/*.jpg")).sort!
    @images = @images.reverse!
    @videos = (Dir.glob("app/assets/images/webcam/*.ogg")).sort!
    @video = @videos.reverse!
  end
end
