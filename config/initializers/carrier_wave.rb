require 'carrierwave/orm/activerecord'
   CarrierWave.configure do |config|
#     config.fog_credentials = {
#       :provider             => 'Rackspace',
#       :rackspace_username   => ENV["RACKSPACE_USERNAME"],
#       :rackspace_api_key    => ENV["RACKSPACE_APIKEY"],
#       :rackspace_region    => :DTF
#     }
    config.fog_directory = 'wayuumochilas'
# end
  if Rails.env.development? || Rails.env.cucumber?
     config.storage = :file
     config.enable_processing = false
     config.root = "#{Rails.root}/tmp"
   else
     config.storage = :fog
   end
end
