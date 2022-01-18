class Cart < ApplicationRecord
  has_many :items
  belongs_to :client

  def self.update
    Cart.where('total_price > 0').each do |cart|
      cart.items.each do |item|
        if quantity_item_in_cart_bigger_than_quantity_product?(item)
          update_total_price(cart, item)
          update_item_quantity_with_actually_product_quantity(item)
        elsif item.size.quantity.zero?
          update_total_price(cart, item)
          item.destroy!
        end
      end
    end
  end

  def self.quantity_item_in_cart_bigger_than_quantity_product?(item)
    return true if item.quantity > item.size.quantity && item.size.quantity > 0
  end

  def self.update_total_price(cart, item)
    cart.total_price -= item.size.product.price * quantity_difference(item)
    cart.save!
  end

  def self.quantity_difference(item)
    item.quantity - item.size.quantity
  end

  def self.update_item_quantity_with_actually_product_quantity(item)
    item.quantity = item.size.quantity
    item.save!
  end
end
