require 'account'

describe Account do

    before(:all) do
        @credit_test = Transaction.new.entry(amount: 1000, date: '10-01-2012')
        @debit_test  = Transaction.new.entry(amount: -500, date: '14/01/2012')
    end


    describe 'use case scenarios' do

        it 'created with first transaction' do
            Account.new(@credit_test)
        end

        it 'cannot go into debt' do
            expect { Account.new(@debit_test) }
                .to raise_error(RuntimeError, 'Cannot go into debt')
        end

        it 'can only add valid transactions' do
            expect { Account.new(5) }
                .to raise_error(RuntimeError, 'Not a transaction')
        end

        xit 'stores all transactions by reverse date' do
        end

        it 'records current balance history' do
            account = Account.new(@credit_test)
            account << @debit_test
            expect(account.to_hash.first[:balance]).to eq(1000)
            expect(account.to_hash.last[:balance]).to eq(500)
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
                account = Account.new(@credit_test)
                account << @debit_test
                hash =  [{ date: Date.parse('10/01/2012'),
                           credit: 1000,
                           debit: nil,
                           balance: 1000 },
                         { date: Date.parse('14/01/2012'),
                           credit: nil,
                           debit: 500,
                           balance: 500 }]
                expect(account.to_hash).to eq(hash)
            end

        end

    end

end