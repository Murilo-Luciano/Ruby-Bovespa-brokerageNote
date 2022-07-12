class BrokerageGenerator
    attr_accessor :ticker, :price, :quantity, :investment, :brokerage, :emoluments, :expense

    def initialize(ticker_in, price_in, quantity_in)
        @ticker = ticker_in
        @price = price_in
        @quantity = quantity_in
        @investment = 0.0
        @brokerage = 0.0
        @emoluments = 0.0
        @expense = 0.0
    end

    def run
        @investment = total_investment(@price, @quantity)
        @brokerage = brokerage_BOVESPA(@investment)
        @emoluments = emoluments_and_taxes(@investment)
        @expense = purchase_cost(@investment, @emoluments, @brokerage)
    end

    protected

    def total_investment(price_in, quantity_in)
        price_in * quantity_in
    end

    def brokerage_BOVESPA(total_investment_in)
        if total_investment_in <= 135.07
            2.70
        elsif total_investment_in >= 135.08 and total_investment_in <= 498.62
            (total_investment_in * 0.02)
        elsif total_investment_in >= 498.63 and total_investment_in <= 1514.69
            (total_investment_in * 0.015) + 2.49
        elsif total_investment_in >= 1514.70 and total_investment_in <= 3029.38
            (total_investment_in * 0.01) + 10.06
        else
            (total_investment_in * 0.005) + 25.21
        end
        
    end

    def emoluments_and_taxes(total_investment_in)
        total_investment_in * 0.0003
    end

    def purchase_cost(total_investment_in, emoluments_and_taxes_in, brokerage_BOVESPA_in)
        total_investment_in + emoluments_and_taxes_in + brokerage_BOVESPA_in
    end

    

end