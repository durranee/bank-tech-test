require './printer'
require 'time'

describe Printer do

  before(:each) do
    @account = BankAccount.new
  end

  describe '#print_body' do
    context 'should print transaction body' do
      expected_output = '21/02/2017'.center(12) + ' || ' + '1000'.rjust(10) + ' || ' +
      ''.rjust(10) + ' || ' + '1000'.rjust(10) + "\n" +
      '22/02/2017'.center(12) + ' || ' + ''.rjust(10) + ' || ' +
      '100'.rjust(10) + ' || ' + '900'.rjust(10) + "\n"

      specify do
        @account.credit(Time.parse('21/02/2017'), 1000)
        @account.debit(Time.parse('22/02/2017'), 100)
        expect { Printer.print_body(@account.statement) }.to output(expected_output).to_stdout
      end
    end
  end

  describe '#print_header' do
    context 'should print transaction header' do
      expected_output = 'Date'.center(12) + ' || ' + 'Credit'.center(10) + ' || ' +
      'Debit'.center(10) + ' || ' + 'Balance'.center(10) + "\n"
      specify do
        expect { Printer.print_header }.to output(expected_output).to_stdout
      end
    end
  end

end
