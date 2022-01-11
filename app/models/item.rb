class Item < ApplicationRecord
  belongs_to :cart
  belongs_to :size

  def self.create_in_cart(client_id, size_id)
    unless Cart.where(client_id: client_id).first.items.pluck(:size_id).include?(size_id.to_i)
      create!(
        quantity: 1,
        cart_id: Client.find(client_id).cart.id,
        size: Size.find(size_id)
      )
    end
  end
end
