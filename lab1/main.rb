def greetings
  name = gets.chomp
  surname = gets.chomp
  age = gets.to_i
  if age < 18
    "Привет, #{name} #{surname}. Тебе меньше 18 лет, но начать учиться программировать никогда не рано"
  else
    "Привет, #{name} #{surname}. Самое время заняться делом!"
  end
end

def foobar(number1, number2)
  return number2 if number1 == 20
  return number1 if number2 == 20

  number1 + number2
end
