require 'rspec'
require '/home/andrei/RubymineProjects/rubylabs/lab2/main'

RSpec.describe 'Main' do
  it '#reverse_word' do
    expect(reverse_word(3, "hello")).to eq("olleh")
  end
  it '#reverse_word' do
    expect(reverse_word(3, "hellocs")).to eq(128)
  end
  it '#print_array_pokemons' do
    allow_any_instance_of(Kernel).to receive(:gets).and_return(1, "Pikachu", "Yellow")
    expect(print_array_pokemons).to eq([{ "Pikachu" => "Yellow"}])
  end
end
