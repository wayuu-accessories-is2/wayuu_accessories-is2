require 'carrierwave/orm/activerecord'
   CarrierWave.configure do |config|
    config.fog_credentials = {
      :provider             => 'Rackspace',
      :rackspace_username   => 'wayuuteam',
      :rackspace_api_key    => '5007c75aa90f42bc8c39423db1e6a2b7',
      :rackspace_region    => :dfw
    }
    config.fog_directory = 'wayuumochilas'
    #config.fog_hos ='https://mycloud.rackspace.com/cloud/1015754/files#object-store%2CcloudFiles%2CDFW/wayuumochilas/'

# end
  # if Rails.env.development? || Rails.env.cucumber?
  #    config.storage = :file
  #    config.enable_processing = false
  #    config.root = "#{Rails.root}/tmp"
  #  else
  #    config.storage = :fog
  #  end
end
