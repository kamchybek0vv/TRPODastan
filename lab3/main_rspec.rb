require 'rspec'
require '/home/andrei/RubymineProjects/rubylabs/lab3/main.rb'

RSpec.describe 'Main' do
  file_path = "line.txt"
  before {
    File.write(file_path, "AAA\nBBB")
    File.write("balance.txt", 100.0)
  }
  it '#index first_solution' do
    expect(index(file_path)).to eq(["AAA", "BBB"])
  end

  it '#find first_solution' do
    expect(find(file_path, 1)).to eq("AAA")
  end

  it '#where first_solution' do
    expect(where(file_path, "A")).to eq(["AAA"])
  end

  it '#update first_solution' do
    expect(update(file_path, 1, "CCC")).to eq(nil)
  end

  it '#delete first_solution' do
    expect(delete(file_path, 1)).to eq(nil)
  end

  it '#second_task first_solution' do
    allow_any_instance_of(Kernel).to receive(:gets).and_return(30, -1)
    expect(second_task).to eq(nil)
  end

  it '#second_task second_solution' do
    allow_any_instance_of(Kernel).to receive(:gets).and_return(60, -1)
    expect(second_task).to eq(nil)
  end

  it '#third_task deposit' do
    allow_any_instance_of(Kernel).to receive(:gets).and_return(40)
    third_task
    expect(deposit).to eq(140.0)
  end

  it '#third_task withdraw' do
    allow_any_instance_of(Kernel).to receive(:gets).and_return(40)
    third_task
    expect(withdraw).to eq(60.0)
  end

end
