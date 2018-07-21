class Account < Array

    # PUBLIC METHODS
    def initialize (transaction)
        self << transaction
    end


    def << (transaction)
        if_valid transaction
        push transaction
    end


    def to_hash
        arr = []
        for i in 0..last_transaction
            arr << self[i]
        end
        arr
    end



    # PRIVATE METHODS
    def [] (index)
        fail 'No transaction exists' if index.abs > last_transaction
        at(index).to_hash.merge!(balance: balance_at(index))
    end


    def balance_at (index)
        arr = []
        slice(0..index).each { |i| arr << i.value }
        arr.inject(0, :+)
    end


    def last_transaction
        length.pred
    end


    def if_valid(transaction)
        fail 'Not a transaction' unless Transaction === transaction
        fail 'Cannot go into debt' if overdraft transaction
    end


    def overdraft(transaction)
        return transaction.value.negative? if empty?
        (balance_at(last_transaction) + transaction.value).negative?
    end


    private :[], :balance_at, :last_transaction, :if_valid, :overdraft

end