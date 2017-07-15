require 'pry'
def consolidate_cart(cart)
  # code here
  consolidated_cart = {}
  cart.each do |items|
    item = items.keys.first
    if consolidated_cart.include?(item)
      consolidated_cart[item][:count] += 1 #increment count
    else
      consolidated_cart[item] = items.values.first.merge({:count => 1})  #count is hash
    end
  end
  consolidated_cart #return consolidated_cart
end

def apply_coupons(cart, coupons)
  # code here
  coupons.each do |coupon|

    if cart.include?(coupon[:item]) == false || cart[coupon[:item]][:count] - coupon[:num] < 0
        next
    elsif cart.include?(coupon[:item]) && cart.include?("#{coupon[:item]} W/COUPON")
        cart[coupon[:item]][:count] = cart[coupon[:item]][:count] - coupon[:num]
        cart["#{coupon[:item]} W/COUPON"][:count] += 1
    else
        cart[coupon[:item]][:count] = cart[coupon[:item]][:count] - coupon[:num]
        cart["#{coupon[:item]} W/COUPON"] = {:price => coupon[:cost], :clearance => cart[coupon[:item]][:clearance], :count => 1}

    end
  end
  cart
end

def apply_clearance(consolidated_cart)
  # code here
  consolidated_cart.each do |item, attributes|
    if attributes[:clearance] == true
      attributes[:price] = (attributes[:price] * 0.8).round(2) #rounds to nearest two decimal places
    end
  end
  consolidated_cart
end

def checkout(cart, coupons)
  # code here
  total = 0
  consolidated_cart = consolidate_cart(cart)
  coupon_cart = apply_coupons(consolidated_cart, coupons)
  final_cart = apply_clearance(coupon_cart)
  final_cart.each do |name, properties|
    total += properties[:price] * properties[:count]
  end
  total = total * 0.9 if total > 100
  total
end
