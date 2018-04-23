class BankAccount
  attr_reader :statement, :balance

  def initialize
    @balance = 0
    @statement = [[]]
  end

  def deposit(date, credit, debit = nil)
    @balance += credit
    @statement.push([date, credit, debit, @balance])
  end
end
