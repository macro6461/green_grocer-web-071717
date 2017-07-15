def consolidate_cart(cart)
  # code here
  count = 1
  cart_hash = Hash[cart.collect { |item| [item, ""] }]
  cart_hash.each do |item, value|
    item.each do |attributes, count|
      cart_hash[attributes][:count] = 1
      if
        count += 1
      else
        count
      end
    end
  end
end

def apply_coupons(cart, coupons)
  # code here
end

def apply_clearance(cart)
  # code here
  cart.each do
end

def checkout(cart, coupons)
  # code here

end
