require 'pry'

class CashRegister
  attr_accessor :total, :discount, :items, :last_transaction

  def initialize(*discount)
    @total = 0
    @discount = discount.join.to_f
    @items=[]
    @last_transaction=0
  end

  def add_item(title, price, quantity=1)
    @last_transaction = @total
    @total+=price*quantity
    quantity.times do |x|
      @items<<title
    end
  end

  def apply_discount
    if discount>0
      @total = total - total * @discount / 100.00
      return "After the discount, the total comes to $#{@total.to_i}."
    else
      return "There is no discount to apply."
    end
  end

  def void_last_transaction
    @total = @last_transaction
  end
end
