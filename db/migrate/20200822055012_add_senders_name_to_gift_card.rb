class AddSendersNameToGiftCard < ActiveRecord::Migration[5.2]
  def change
    add_column :spree_gift_cards, :senders_name, :string
  end
end
