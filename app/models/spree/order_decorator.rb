Spree::Order.class_eval do

  include Spree::Order::GiftCard
  
  def finalize!
    card_items = line_items.joins(:product).where("spree_products.is_gift_card = ?", true)
    card_items.each do |li|
      li.gift_card.update_column(:enabled, true)
      ::Spree::OrderMailer.gift_card_email(li.gift_card.id, self).deliver_later
    end
    super
  end

end
