def index(file_path)
  file_line = File.open(file_path)
  lines = file_line.readlines.map(&:chomp)
  file_line.close
  lines
end

def find(file_path, id)
  elem = nil
  file_line = File.open(file_path)
  file_line.each_with_index do |line, index|
    elem = line if id == index+1
  end
  file_line.close
  elem.chomp
end

def where(file_path, pattern)
  lines = []
  file_line = File.open(file_path)
  file_line.readlines.each do |line|
    if line.include? pattern
      lines.push line.chomp
    end
  end
  file_line.close
  lines
end

def update(file_path, id, text)
  temp = File.open("temp.txt", 'w')
  file_line = File.open(file_path)
  file_line.each_with_index do |line, index|
    temp.puts(id == index+1 ? text : line)
  end
  temp.close
  File.write("line.txt", File.read("temp.txt"))
  File.delete("temp.txt")
  file_line.close
end

def delete(file_path, id)
  temp = File.open("temp.txt", 'w')
  file_line = File.open(file_path)
  file_line.each_with_index do |line, index|
    temp.puts line if id != index+1
  end
  temp.close
  File.write(file_path, File.read("temp.txt"))
  File.delete("temp.txt")
  file_line.close
end

INPUT_FILE_PATH = 'students.txt'
OUTPUT_FILE_PATH = 'results.txt'

def second_task
  input_file = File.open(INPUT_FILE_PATH)
  students = input_file.readlines.map(&:chomp)
  output_file = File.open(OUTPUT_FILE_PATH, "a")

  loop do
    break if students.size == 0
    puts 'Введите возраст. Для выхода введите -1'
    age = gets.to_i
    break if age == -1
    for stud in students
      File.write(OUTPUT_FILE_PATH, "#{stud}\n", mode:"a") if stud.include?("#{age}")
      students.delete(stud) if stud.include?("#{age}")
    end
  end

  output_file.close
  input_file.close

  File.foreach(OUTPUT_FILE_PATH){|student| puts student}
end

BALANCE_FILE_PATH = 'balance.txt'

def balance
  puts "Текущий баланс: #{@balance}"
end

def deposit
  puts "Введите сумму депозита:"
  amount = gets.to_f

  if amount < 0
    puts "Сумма должна быть > 0"
  else
    @balance += amount
  end
end

def withdraw
  print "Введите сумму вывода:"
  amount = gets.to_f

  if amount < 0 || amount > @balance
    puts "Сумма должна быть > 0 и < #{@balance}"
  else
    @balance -= amount
  end
end

def third_task
  if File.zero?(BALANCE_FILE_PATH)
    @balance = 100.0
  else
    @balance = File.readlines(BALANCE_FILE_PATH).first.chomp.to_f
  end

  loop do
    puts "Введите одну из команд: \nD - Депозит \nW - Вывод \nB - Баланс \nQ - Выход"
    input = gets

    case input
    when "q\n","Q\n"
      break
    when "b\n","B\n"
      balance
    when "w\n","W\n"
      withdraw
    when "d\n","D\n"
      deposit
    else
      break
    end
  end

  File.write(BALANCE_FILE_PATH, @balance)
end

third_task