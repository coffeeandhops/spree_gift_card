Spree::OrderMailer.class_eval do
  def gift_card_email(card_id, order_id)
    @gift_card = Spree::GiftCard.find_by(id: card_id)
    @order = Spree::Order.find_by(id: order_id)
    subject = "#{Spree.t('gift_card_email.subject')}"
    @gift_card.update_attribute(:sent_at, Time.now)
    store = ::Spree::Store.where(default: true).first
    use_store_name = !store.nil? && Spree::Config.use_store_name_as_email
    address_or_name = use_store_name ? store.name : from_address
    mail(to: @gift_card.email, from: address_or_name, subject: subject)
  end
end
