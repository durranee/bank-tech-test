require './transaction'

describe '#new' do
  it 'should create an object of date class with given parameters' do
    t = Transaction.new(Time.parse('20/02/2017'), 1000, nil, 1000)
    expect(t.date).to eq(Time.parse('20/02/2017'))
    expect(t.balance).to eq(1000)
    expect(t.credit).to eq(nil)
    expect(t.debit).to eq(1000)
  end
end
