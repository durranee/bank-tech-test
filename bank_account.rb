require 'time'

# Bank account class
class BankAccount
  attr_reader :statement, :balance

  def initialize
    @balance = 0
    @statement = []
  end

  def credit(date, amount)
    @balance += amount
    @statement.push([Time.parse(date), amount, nil, @balance])
  end

  def debit(date, amount)
    raise 'Insufficient balance: Transaction declined.' if @balance < amount
    @balance -= amount
    @statement.push([Time.parse(date), nil, amount, @balance])
  end

  def print_statement
    print_header
    statement.each do |transaction|
      print "#{transaction[0].strftime('%d/%m/%Y').center(12)} || "
      print "#{transaction[1].to_s.rjust(10)} || "
      print "#{transaction[2].to_s.rjust(10)} || "
      print transaction[3].to_s.rjust(10).to_s
      puts ''
    end
  end

  private

  def print_header
    print 'Date'.center(12) + ' || '
    print 'Credit'.center(10) + ' || '
    print 'Debit'.center(10) + ' || '
    print 'Balance'.center(10)
    puts ''
  end
end
