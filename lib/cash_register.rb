class CashRegister
  attr_accessor :discount,:last_transcation_total,:last_transcation_items
  attr_reader :items
  def initialize(discount=0)
    @total = 0
    @discount = discount
    @items = []
    @last_transcation_items = []
    @last_transcation_total = 0
  end

  def total=(total)
    @total = total
  end

  def total
    @total
  end

  def add_item(item, price,quantity=1)
    self.last_transcation_total = price*quantity
    self.total += self.last_transcation_total
    quantity.times do
      @items.push(item)
      @last_transcation_items.push(item)
    end
  end

  def apply_discount
    if discount == 0
      return "There is no discount to apply."
    end
    self.total = self.total.to_f*((100-self.discount.to_f)/100)
    "After the discount, the total comes to $#{total.to_i}."
  end

  def void_last_transaction
    self.items - self.last_transcation_items
    self.total -= self.last_transcation_total
  end
  # 2) CashRegister #void_last_transaction subtracts the last transaction from the total
  #    Failure/Error: expect{cash_register.void_last_transaction}.to change{cash_register.total}.from(1.76).to(0.0)
  #
  #    NoMethodError:
  #      undefined method `void_last_transaction' for #<CashRegister:0x007fa78e045eb0 @total=1.76, @discount=0>
     # ./spec/cash_register_spec.rb:80:in `block (4 levels) in <top (required)>'
     # ./spec/cash_register_spec.rb:80:in `block (3 levels) in <top (required)>'

end
