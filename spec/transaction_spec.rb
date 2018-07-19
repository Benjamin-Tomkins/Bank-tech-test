require 'date'
require 'transaction'


describe Transaction do

    before do
        @credit_test = Transaction.new.entry(amount: 1000, date: "10-01-2012")
        @debit_test  = Transaction.new.entry(amount: -500, date: "14/01/2012")
    end


    describe 'use case scenarios' do
        
        it 'no zero transactions' do
            expect {Transaction.new.entry(amount: 0)}.to raise_error(RuntimeError, "Transaction denied")
        end

        it 'can be credit transaction' do
            expect(@credit_test.credit).to eq(1000)
            expect(@credit_test.debit).to eq(nil)
        end

        it 'can be debit transaction' do
            expect(@debit_test.credit).to eq(nil)
            expect(@debit_test.debit).to eq(500)
        end

        it 'represents a value' do
        end

    end


    describe 'unit tests' do

        describe 'attributes' do

            it '.date' do
                expect(@credit_test).to respond_to(:date)
            end   

            it '.credit' do
                expect(@credit_test).to respond_to(:credit)
            end

            it '.debit' do
                expect(@credit_test).to respond_to(:debit)
            end

        end

        describe 'methods' do

            it '.entry' do
            end

            it '.value' do
            end

            it '.to_hash' do
            end

        end

    end


end