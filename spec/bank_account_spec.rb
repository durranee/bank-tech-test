require './bank_account'

describe "#new" do
  it "expects balance to be 0 at the start" do
    account = BankAccount.new
    expect(account.balance).to eq(0)
  end
end
