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

  describe "#deposit" do

    it "expects to add the amount given to balance" do
      @account.deposit("20/02/2017", 1000)
      expect(@account.balance).to eq(1000)
    end

    it "expects to create a transaction history" do
      @account.deposit("20/02/2017", 1000)
      expect(@account.statement).to include(["20/02/2017", 1000, nil, 1000])
    end
  end
end
