require_relative './part_1_solution.rb'

coupons=[
  {:item => "AVOCADO", :num => 2, :cost => 5.00}
]

cart =[
  {:item => "AVOCADO", :price => 3.00, :clearance => true},
  {:item => "AVOCADO", :price => 3.00, :clearance => true},
  {:item => "PEANUT BUTTER", :price => 3.00, :clearance => true},
  {:item => "KALE", :price => 3.00, :clearance => false},
  {:item => "SOY MILK", :price => 4.50, :clearance => true},
  {:item => "AVOCADO", :price => 3.00, :clearance => true},
  {:item => "KALE",    :price => 3.00, :clearance => false}
]

def apply_coupons(cart, coupons)
  # Consult README for inputs and outputs
  #
  # REMEMBER: This method **should** update cart
  new_cart=[]
  # coupon=[]
  cart.each do|k|
    hodown=0
    while hodown <coupons.length
      if k[:item] == coupons[hodown][:item] && k[:count]-coupons[hodown][:num]
        k[:count]=k[:count]-coupons[hodown][:num]
        x={
          :item=>k[:item]+" W/COUPON",
          :price=>coupons[hodown][:cost]/coupons[hodown][:num],
          :clearance=>true,
          :count=>coupons[hodown][:num]
        }
        # coupon<<x
        hodown+=1
      else
        hodown+=1
      end
    end
    new_cart<<k
    new_cart<<x
  end
  # new_cart.concat(coupon)
  new_cart
end

def apply_clearance(cart)
  # Consult README for inputs and outputs
  #
  # REMEMBER: This method **should** update cart
  cart.each do|k|
    k[:price]=(k[:price]*0.8).round(2) if k[:clearance]==true
  end
end

def checkout(cart, coupons)
  # Consult README for inputs and outputs
  #
  # This method should call
  # * consolidate_cart
  # * apply_coupons
  # * apply_clearance
  #
  # BEFORE it begins the work of calculating the total (or else you might have
  # some irritated customers
  c_cart=consolidate_cart(cart)
  coupon_cart=apply_coupons(c_cart,coupons)
  final_cart=apply_clearance(coupon_cart)
  net=0.00
  final_cart.each do|item|
    net+=item[:price]*item[:count].to_f
  end
  p net
end

cart1=consolidate_cart(cart)
p apply_coupons(cart1, coupons)
# p checkout(cart,coupons)
