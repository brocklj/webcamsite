class HomeController < ApplicationController
  def welcome
    @images = (Dir.glob("app/assets/images/webcam/*.jpg")).sort!
    @images = @images.reverse!
    @videos = (Dir.glob("app/assets/images/webcam/*.ogg")).sort!
    @video = @videos.reverse!
    @current_page = params[:imgpage].to_i == nil ? 0 : params[:imgpage].to_i
    @per_page = 6
  end
end
