Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2,  ENV["GOOGLE_CLIENT_ID"], ENV["GOOGLE_CLIENT_SECRET"]
  {
    :name => "google",
    :scope => "email, profile, puls.me",
    :image_aspect_ratio => 'square',
    :image_size => 48,
    :access_type => 'online',
    :approval_prompt => 'force'
  }
end
