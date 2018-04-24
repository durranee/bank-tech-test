require 'time'
require_relative 'transaction'

# Bank account class
class BankAccount
  attr_reader :statement, :balance

  def initialize
    @balance = 0
    @statement = []
  end

  def credit(date, amount)
    @balance += amount
    @statement.push(Transaction.new(date, @balance, amount, nil))
  end

  def debit(date, amount)
    raise 'Insufficient balance: Transaction declined.' if @balance < amount
    @balance -= amount
    @statement.push(Transaction.new(date, @balance, nil, amount))
    # @statement.push([Time.parse(date), nil, amount, @balance])
  end

end
