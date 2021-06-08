class Brokerage_note
    attr_accessor :ticker, :price, :quantity, :investment, :brokerage, :emoluments, :value

    def initialize(ticker_in, price_in, quantity_in)
        @ticker = ticker_in
        @price = price_in
        @quantity = quantity_in
        @investment = self.class.total_investment(@price, @quantity)
        @brokerage = self.class.brokerage_BOVESPA(@investment)
        @emoluments = self.class.emoluments_and_taxes(@investment)
        @value = self.class.purchase_value(@investment, @emoluments, @brokerage)
    end

    def self.total_investment(price_in, quantity_in)
        return price_in * quantity_in
    end

    def self.brokerage_BOVESPA(total_investment_in)
        if total_investment_in <= 135.07
            return (total_investment_in * 0) + 2.70
        elsif total_investment_in >= 135.08 and total_investment_in <= 498.62
            return (total_investment_in * 0.02) + 0
        elsif total_investment_in >= 498.63 and total_investment_in <= 1514.69
            return (total_investment_in * 0.015) + 2.49
        elsif total_investment_in >= 1514.70 and total_investment_in <= 3029.38
            return (total_investment_in * 0.01) + 10.06
        else
            return (total_investment_in * 0.005) + 25.21
        end
        
    end

    def self.emoluments_and_taxes(total_investment_in)
        return total_investment_in * 0.0003
    end

    def self.purchase_value(total_investment_in, emoluments_and_taxes_in, brokerage_BOVESPA_in)
        return total_investment_in + emoluments_and_taxes_in + brokerage_BOVESPA_in
    end

    

end