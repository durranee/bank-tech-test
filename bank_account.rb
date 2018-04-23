class BankAccount
  attr_reader :statement, :balance

  def initialize
    @balance = 0
    @statement = [[]]
  end

  def deposit(date, amount)
    @balance += amount
    @statement.push([date, amount, nil, @balance])
  end

  def debit(date, amount)
    raise "Insufficient balance: Transaction declined." if @balance < amount
    @balance -= amount
    @statement.push([date, nil, amount, @balance])
  end
end
