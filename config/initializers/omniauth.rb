OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, '785958475282-vbm392b5bhbnev0g06vj8o8j93pe6grq.apps.googleusercontent.com', 'ncqCMeoadQh7WLpXXnLPP8Ty', {client_options: {ssl: {ca_file: Rails.root.join("cacert.pem").to_s}}}
end
