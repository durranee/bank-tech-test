class BankAccount
  attr_reader :statement, :balance
  def initialize
    @balance = 0
    @statement = [[]]
  end
end
