require 'date'
require 'statement'

describe Statement do

    # date       || credit  ||  debit  || balance
    # 14/01/2012 ||         ||  500.00 || 2500.00
    # 13/01/2012 || 2000.00 ||         || 3000.00
    # 10/01/2012 || 1000.00 ||         || 1000.00

    # a1 = Transaction.new.entry(amount:1000, date: "10-01-2012")
    # a2 = Transaction.new.entry(amount:2000, date: "13-01-2012")
    # a3 = Transaction.new.entry(amount:-500, date: "14-01-2012")
    # client = Account.new(a1)
    # client << a2
    # client << a3
    # puts Statement.new(client).printStatement

    describe 'use case scenarios' do

        it 'prints a bank statement' do

            transaction_01 = {:date=> DateTime.parse("10/01/2012"), :credit=>1000, :debit=>nil, :balance=>1000}
            transaction_02 = {:date=> DateTime.parse("13/01/2012"), :credit=>2000, :debit=>nil, :balance=>3000}
            transaction_03 = {:date=> DateTime.parse("14/01/2012"), :credit=>nil,  :debit=>500, :balance=>2500}

            account_hash = [transaction_01,transaction_02,transaction_03]

            expected_statement = "date || credit || debit || balance\n14/01/2012 || || 500.00 || 2500.00 \n13/01/2012 || 2000.00 || || 3000.00 \n10/01/2012 || 1000.00 || || 1000.00"

            account = double('account')
            expect(account).to receive(:to_hash).and_return(account_hash)

            statement = Statement.new(account)

            expect(statement.printStatement).to eq("#{expected_statement}")
        end

    end
    
end