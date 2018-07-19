class Account < Array

    # PUBLIC METHODS
    def initialize (transaction)
        self << transaction
    end


    def << (transaction)
        self.push transaction
    end

end