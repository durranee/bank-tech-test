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

  def print_header
    print "Date".center(10) + " || "
    print "Credit".center(10) + " || "
    print "Debit".center(10) + " || "
    print "Balance".center(10)
  end
end
