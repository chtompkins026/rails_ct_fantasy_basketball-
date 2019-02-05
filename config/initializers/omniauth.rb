Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, ENV['FACEBOOK_KEY'], ENV['FACEBOOK_SECRET']
end

# token fb8ac0babd93c3dc68c8dbfe6681a8b7
# ID 241092946779960
# Secret 992a9e60cf4d5f9d031d9e5623218541
