require 'time'

# Printer class
class Printer
  def self.print_body(statement)
    statement.each do |transaction|
      print "#{transaction.date.strftime('%d/%m/%Y').center(12)} || "
      print "#{transaction.credit.to_s.rjust(10)} || "
      print "#{transaction.debit.to_s.rjust(10)} || "
      print transaction.balance.to_s.rjust(10).to_s
      puts ''
    end
  end

  def self.print_header
    print 'Date'.center(12) + ' || '
    print 'Credit'.center(10) + ' || '
    print 'Debit'.center(10) + ' || '
    print 'Balance'.center(10)
    puts ''
  end
end
