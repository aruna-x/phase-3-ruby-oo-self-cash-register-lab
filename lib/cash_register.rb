class CashRegister
    attr_accessor :total
    attr_reader :items

    def initialize(discount=0)
        @total = 0
        @discount = discount
        @items = []
        @transactions = []
    end

    def discount
        @discount
    end

    def add_item(title, price, quantity=1)
        @total += price * quantity
        @transactions << [title, price, quantity]
        while quantity>0 do
            @items << title
            quantity-=1
        end
    end

    def apply_discount
        if (@discount == 0) 
            return "There is no discount to apply."
        end
        @total = (@total - (@total * @discount/100))
        "After the discount, the total comes to $#{@total}."
    end

    def void_last_transaction
        void_me = @transactions.pop
        title = void_me[0]
        price = void_me[1]
        quantity = void_me[2]

        @total = @total - (price*quantity)

        @items.filter do |item|
            if quantity = 0 
                return
            end
            if item == title
                return false
            else
                return true
            end
            quantity-=1
        end
    end
end