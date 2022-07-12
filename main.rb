require_relative 'brokerage_generator'

class SimpleTable
  
    def initialize(arr)
        @components = arr.clone
        @to_be_printed = []
    end
    
    def to_table
        return if @components[1].nil?
        header =  true
        
        column_sizes = @components.reduce([]) do |lengths, row|
          row.each_with_index.map{|iterand, index| [lengths[index] || 0, iterand.to_s.length].max}
        end
        
        head = '+' + column_sizes.map{|column_size| '-' * (column_size + 2) }.join('+') + '+'
        
        @to_be_printed << head
  
        to_print = @components
        
        header = to_print.shift
        print_table_data_row(column_sizes, header)
        @to_be_printed << head
        
        to_print.each{ |row| print_table_data_row(column_sizes, row) }
        @to_be_printed << head
  
  
        @to_be_printed.join("\n")
        
    end
  
    private
    def print_table_data_row(column_sizes, row)
      row = row.fill(nil, row.size..(column_sizes.size - 1))
      row = row.each_with_index.map{|v, i| v = v.to_s + ' ' * (column_sizes[i] - v.to_s.length)}
      @to_be_printed << '| ' + row.join(' | ') + ' |'
    end
  
end


print "Enter Ticker: "
ticker = gets()
print "\nEnter Price: "
price = gets()
print "\nEnter Quantity: "
quantity = gets()

system 'clear'

brk = BrokerageGenerator.new('BIDI11', 25.4, 2)
brk.run

puts SimpleTable.new([["Investment","Brokeage","Emoluments","Value"], [brk.investment,brk.brokerage,brk.emoluments,brk.expense]]).to_table