Spree::AppConfiguration.class_eval do
  preference :allow_gift_card_redeem, :boolean, default: true
  preference :emails_must_match, :boolean, default: false
  preference :use_store_name_as_email, :boolean, default: true
  # allow_anonymous
end
