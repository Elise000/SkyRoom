Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, "1503295549996665", "46b21b29dbe6a5111939debf90fc28a9",
 					 :scope => 'email,user_birthday', :display => 'popup'

end