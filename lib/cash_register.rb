class CashRegister
  attr_accessor :total

    def initialize(discout = 0)
      @total = 0
      @discout = discout
      @items = []
    end

    def discount
      @discout
    end

    def add_item(title, price, quantity = 1)
      @previous_total = @total
      for i in 0...quantity
        @items << title
      end
      @total += (price * quantity)
    end

    def apply_discount
      if @discout == 0
        "There is no discount to apply."
      else
        @total -= (@total * @discout / 100)
        "After the discount, the total comes to $#{@total}."
      end
    end

    def items
      @items
    end

    def void_last_transaction
      @total = @previous_total
      @items.pop
    end


end
