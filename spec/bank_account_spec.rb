require 'time'
require './bank_account'

describe "BankAccount" do

  before(:each) do
    @account = BankAccount.new
  end

  describe "#new" do
    it "expects balance to be 0 at the start" do
      expect(@account.balance).to eq(0)
    end
  end

  describe "#credit" do

    it "expects to add the amount given to balance" do
      @account.credit("20/02/2017", 1000)
      expect(@account.balance).to eq(1000)
    end

    it "expects to create a transaction history" do
      @account.credit("20/02/2017", 1000)
      expect(@account.statement).to include([Time.parse("20/02/2017"), 1000, nil, 1000])
    end
  end

  describe "#debit" do
    it "expects to reduce the balance by ammount provided" do
      @account.credit("20/02/2017", 1000)
      @account.debit("21/02/2017", 100)
      expect(@account.balance).to eq(900)
    end

    it "expects to create a transaction history" do
      @account.credit("21/02/2017", 1000)
      @account.debit("22/02/2017", 100)
      expect(@account.statement).to include([Time.parse("22/02/2017"), nil, 100, 900])
    end

    it "expects to raise error if withdrawing amount is more than balance" do
      expect{@account.debit("22/02/2017", 100)}.to raise_error("Insufficient balance: Transaction declined.")
    end
  end

  describe "#print_statement" do
    context "should print transaction body" do
      specify {
        @account.credit("21/02/2017", 1000)
        @account.debit("22/02/2017", 100)
        expect { @account.print_statement }.to output(
          "#{"Date".center(10)}" + " || #{"Credit".center(10)} || " +
          "#{"Debit".center(10)} || " + "#{"Balance".center(10)}\n" +
          "#{"21/02/2017".center(10)} || #{"1000".rjust(10)} || #{"".rjust(10)} || #{"1000".rjust(10)}\n" +
          "#{"22/02/2017".center(10)} || #{"".rjust(10)} || #{"100".rjust(10)} || #{"900".rjust(10)}\n").to_stdout }
    end

  end
end
