module SpreeGiftCard
  module OrderDecorator
    def self.prepended(base)
      base.include ::Spree::Order::GiftCard
    end

    def finalize!
      card_items = line_items.joins(:product).where("spree_products.is_gift_card = ?", true)
      card_items.each do |li|
        li.gift_card.update_column(:enabled, true)
        ::Spree::OrderMailer.gift_card_email(li.gift_card.id, self).deliver_later
      end
      super
    end

  end
end

::Spree::Order.prepend SpreeGiftCard::OrderDecorator
