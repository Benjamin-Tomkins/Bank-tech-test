require 'date'

class Statement

    # PUBLIC METHODS
    attr_accessor :statement, :transactions


    def initialize (account)
        @transactions = account.to_hash
        @statement = []
    end


    def printStatement
        runStatementBuilder
        @statement
    end


    # PRIVATE METHODS
    def runStatementBuilder
        @statement << headingToString
        @transactions.reverse.each {|item| @statement << itemHashToString(item)}
        @statement.join('\n')
    end


    def headingToString
        heading = @transactions.last.keys.map {|key| key.to_s}
        heading.join(' || ')
    end


    def itemHashToString (item)
        [ dateParser(item[:date]),
          numberParser(item[:credit]),
          numberParser(item[:debit]),
          numberParser(item[:balance]) ].join('|| ')
    end


    def dateParser(date)
        date.strftime("%d/%m/%Y ")
    end


    def numberParser(number)
        !!number ? sprintf('%.2f ', number) : ''
    end


    private :runStatementBuilder, :headingToString, :itemHashToString, :dateParser, :numberParser

end