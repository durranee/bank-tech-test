require 'time'
require './bank_account'

describe BankAccount do
  before(:each) do
    @account = BankAccount.new
    @credit_transaction = double(:credit_transaction, date: Time.parse('20/02/2017'), balance: 1000, credit: 1000, debit: nil)
    @debit_transaction = double(:debit_transaction, date: Time.parse('20/02/2017'), balance: 1000, credit: nil, debit: 1000)

  end

  # let(:transaction) {double :transaction}

  describe '#new' do
    it 'expects balance to be 0 at the start' do
      expect(@account.balance).to eq(0)
    end
  end

  describe '#credit' do
    it 'expects to add the amount given to balance' do
      @account.credit(Time.parse('20/02/2017'), 1000)
      expect(@account.balance).to eq(1000)
    end

    it 'expects to create a transaction history' do
      @account.credit(@credit_transaction.date, @credit_transaction.credit)
      expect(@account.statement.length).to eq(1)
    end
  end

  describe '#debit' do
    it 'expects to reduce the balance by ammount provided' do
      @account.credit(Time.parse('20/02/2017'), 1000)
      @account.debit(Time.parse('21/02/2017'), 100)
      expect(@account.balance).to eq(900)
    end

    it 'expects to create a transaction history' do
      @account.credit(Time.parse('20/02/2017'), 1001)
      @account.debit(Time.parse('20/02/2017'), 1000)
      expect(@account.statement.length).to eq(2)
    end


    it 'expects to raise error if withdrawing amount is more than balance' do
      expect { @account.debit(Time.parse('22/02/2017'), 100) }.to raise_error('Insufficient balance: Transaction declined.')
    end
  end

end
