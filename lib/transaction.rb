class Transaction
    attr_reader :date, :credit, :debit

    define_method (:entry) do |amount:, date: DateTime.now|
        fail 'Transaction denied' if amount.zero?
        @date = DateTime.parse(date.to_s)
        amount.positive?? @credit=(amount) : @debit=(amount.abs)
        return itself
    end


    def value
        !!@credit ? @credit : -@debit
    end
    
end