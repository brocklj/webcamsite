class HomeController < ApplicationController
  include HomeHelper
  @@images_dir = (Dir.glob("app/assets/images/webcam/*.jpg"))
  def welcome

    cookies[:from_date] = params[:from_date] if params[:from_date] != cookies[:from_date] && params[:from_date] != nil && params[:from_date] != "" && params[:from_date] != cookies[:from_date]
    cookies[:to_date] = params[:to_date] if params[:to_date] != cookies[:to_date] && params[:to_date] != nil && params[:to_date] != "" && params[:to_date] != cookies[:to_date]

    from_date = params[:from_date].to_s == "" && cookies[:from_date].to_s == ""? Date.today() - 7 : cookies[:from_date].to_date
    to_date = params[:to_date].to_s == "" && cookies[:to_date].to_s == "" ? Date.today() :  cookies[:to_date].to_date

    @images_hash = get_files_date_hash(@@images_dir)
    @images = get_images_from_date_hash(@images_hash, from_date, to_date)

    @current_page = params[:imgpage].to_i == nil ? 0 : params[:imgpage].to_i
    cookies[:per_page] = params[:perpage] if cookies[:per_page] != params[:perpage] && params[:perpage] != nil && params[:perpage]  != "0" && params[:perpage]  != ""
    @per_page = cookies[:per_page] != nil ? cookies[:per_page].to_i : 21

  end

end
