Spree::AppConfiguration.class_eval do
  preference :allow_gift_card_redeem, :boolean, default: true
  preference :emails_must_match, :boolean, default: true
  # allow_anonymous
end
