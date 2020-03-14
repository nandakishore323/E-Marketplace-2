Cloudinary.config do |config|
   config.cloud_name = ENV['CD_NAME']
   config.api_key = ENV['CD_API_KEY']
   config.api_secret = ENV['CD_API_SECRET']
   config.cdn_subdomain = true
end
