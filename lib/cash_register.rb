class CashRegister
  attr_accessor :total, :discount, :last_transaction
  attr_reader :items_in_cart

  def initialize(discount=0)
    @total = 0
    @discount = discount
    @items_in_cart = []
    @last_transaction = 0
  end

  def add_item(title, price, quantity=1)
    @last_transaction = price
    @total += (price * quantity)
    quantity.times do |item|
      @items_in_cart << title
    end
  end

  def apply_discount
    if @discount == 0
      "There is no discount to apply."
    else
      @total -= @discount*10
      "After the discount, the total comes to $#{@total}."
    end
  end

  def items
    @items_in_cart
  end

  def void_last_transaction
    @total -= @last_transaction
  end

end
