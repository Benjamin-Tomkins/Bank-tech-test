class Statement

    # PUBLIC METHODS
    attr_accessor :statement, :transactions


    def initialize (account)
        fail 'There are no transactions to print' if account.empty?
        @transactions = account.to_hash
        @statement = []
    end

end