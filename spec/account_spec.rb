require 'account'

describe Account do

    before(:all) do
        @credit_test = Transaction.new.entry(amount: 1000, date: "10-01-2012")
        @debit_test  = Transaction.new.entry(amount: -500, date: "14/01/2012")
    end


    describe 'use case scenarios' do

        it 'created with first transaction' do
            Account.new(@credit_test)
        end

        it 'cannot go into debt' do
            expect {Account.new(@debit_test)}.to raise_error(RuntimeError, "Cannot go into debt")
        end

        it 'stores all transactions by reverse date' do
        end

        it 'records current balance history' do
        end

    end


    describe 'unit tests' do

        describe 'methods' do

            it '#<<' do
                account = Account.new(@credit_test)
                account << @debit_test
                expect(account.size).to eq(2)
            end

            it '.to_hash' do
            end

        end

    end

end