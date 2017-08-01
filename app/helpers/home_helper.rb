module HomeHelper
  def get_files_date_hash(files)
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
    return images_processed.reverse!
  end
end
