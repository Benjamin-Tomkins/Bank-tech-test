require './lib/transaction.rb'
require './lib/account.rb'
require './lib/statement.rb'

a1 = Transaction.new.entry(amount:1000, date: "10-01-2012")
a2 = Transaction.new.entry(amount:2000, date: "13-01-2012")
a3 = Transaction.new.entry(amount:-500, date: "14-01-2012")
client = Account.new(a1)
client << a2
client << a3
puts Statement.new(client).printStatement


# date       || credit  ||  debit  || balance
# 14/01/2012 ||         ||  500.00 || 2500.00
# 13/01/2012 || 2000.00 ||         || 3000.00
# 10/01/2012 || 1000.00 ||         || 1000.00