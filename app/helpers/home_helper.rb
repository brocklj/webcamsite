module HomeHelper
  require 'json'
  require 'fileutils'

  def get_images_from_date_hash(images_hash, from_date, to_date)
    images_processed = []
    images_hash.each do |date_str, images_bunch|
      date = date_str.to_date
      if date >= from_date && date <= to_date
        images_bunch.each do |images|
          images_processed << images
        end
      end
    end
    images_processed = images_processed.sort!.reverse!
    return images_processed
  end


  class Image_gallery
    attr_reader :hash
    @hash = {}

    def initialize(files_path)
      @path = files_path
      if File.exist?(@path+"/captures.json")
        generate_json
      end

     return @hash = get_hash
    end

    public
    def generate_json
      hash = get_files_date_hash

      File.open("#{@path}/captures.json", 'w') { |file| file.write(JSON.pretty_generate(hash)) }
      #Does not work FileUtils.move("#{@path}/*.jpg", "#{@path}/history")
    end



    private
    def get_hash
      json = File.read(@path+"/captures.json")
      @hash = JSON.parse(json)
    end

    def get_files_date_hash
      files = get_files
      date_hash = {}
      files.each do |file|
        date = File.mtime(file).to_s[0..9]
        #if date_hash.key?(file.split("/").last[0..7]) == false
        if date_hash.key?(date) == false

          #date_hash[file.split("/").last[0..7]] = [file.split("/").last]
          date_hash[date] = [file.split("/").last]

        else
          date_hash[date] << file.split("/").last
        end
      end
      date_hash = date_hash.sort.to_h
      return date_hash
    end

    def get_files

      files = Dir.glob("#{@path}/*.jpg")
    end

  end
  # function to get modification date and time of file in the parameter
  def get_mtime(file)
    time = File.mtime(file).to_formatted_s(:db)
  end

end
