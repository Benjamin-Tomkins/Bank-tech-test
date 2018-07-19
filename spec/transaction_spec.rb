require 'date'
require 'transaction'


describe Transaction do


    describe 'use case scenarios' do
        
        it 'no zero transactions' do
        end

        it 'can be credit transaction' do
        end

        it 'can be debit transaction' do
        end

        it 'represents a value' do
        end

    end


    describe 'unit tests' do

        before do
            @t1 = Transaction.new.entry(amount:1000, date: "10-01-2012")
        end

        describe 'attributes' do

            it '.date' do
                expect(@t1).to respond_to(:date)
            end   

            it '.credit' do
                expect(@t1).to respond_to(:credit)
            end

            it '.debit' do
                expect(@t1).to respond_to(:debit)
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