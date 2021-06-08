require_relative 'brokerage_class'


print "Enter Ticker: "
ticker = gets()
print "\nEnter Price: "
price = gets()
print "\nEnter Quantity: "
quantity = gets()

brk = Brokerage_note.new(ticker, price.to_f, quantity.to_i)
print("Investment: ", brk.investment)
print("\nBrokeage: ", brk.brokerage)
print("\nEmoluments: ", brk.emoluments)
print("\nValue: ", brk.value, "\n")