require "pry"

class CashRegister

attr_accessor :discount, :total, :previous, :all_items



def initialize(discount = 0)
  @total = 0
  @discount = discount
  @@all_items = []

end

def add_item(title, price, qty=1)
  self.total += price * qty
  self.previous = price * qty
  qty.times do
    @@all_items << title

  # title.split.each do |title|
  #   # binding.pry
  #   # title.each do qty * title
  #   title * qty
  #   # binding.pry
  #   @@all_items << title

  end
  # end
end


def apply_discount
  if discount == 20
  self.total = self.total - self.total * discount / 100
  "After the discount, the total comes to $#{self.total}."
else
  return "There is no discount to apply."
end
end

def items
  @@all_items
end

def void_last_transaction
  self.total = self.total - self.previous

end




end #class end
