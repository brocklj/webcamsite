class HomeController < ApplicationController
  def welcome
    @images = (Dir.glob("app/assets/images/webcam/*.jpg")).sort!
    @images = @images.reverse!
    @videos = (Dir.glob("app/assets/images/webcam/*.ogg")).sort!
    @video = @videos.reverse!

    #start date from which images should start from
    @start_date = params[:date] != nil ? params[:date] : Date.today().to_s
    cookies[:date] = params[:date] if cookies[:date] != params[:date] && params[:date] != nil

    #------start date end

    @current_page = params[:imgpage].to_i == nil ? 0 : params[:imgpage].to_i
    cookies[:per_page] = params[:perpage] if cookies[:per_page] != params[:perpage] && params[:perpage] != nil && params[:perpage]  != "0"
    @per_page = cookies[:per_page] != nil ? cookies[:per_page].to_i : 21
  end
end
