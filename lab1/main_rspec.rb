require 'rspec'
require '/home/andrei/rubylabs/lab1/main'

RSpec.describe 'Main' do
  it '#greetings' do
    allow_any_instance_of(Kernel).to receive(:gets).and_return('John', 'Snow', 17)
    expect(greetings).to eq('Привет, John Snow. Тебе меньше 18 лет, но начать учиться программировать никогда не рано')
  end
  it '#greetings' do
    allow_any_instance_of(Kernel).to receive(:gets).and_return('John', 'Snow', 22)
    expect(greetings).to eq('Привет, John Snow. Самое время заняться делом!')
  end
  it '#foobar' do
    expect(foobar(2, 2)).to eq(4)
  end
  it '#foobar' do
    expect(foobar(20, 2)).to eq(2)
  end
  it '#foobar' do
    expect(foobar(3, 20)).to eq(3)
  end
end
