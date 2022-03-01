def reverse_word(number, word)
  if word.reverse[0,2] == "sc"
    2**word.length
  else
    word.reverse
  end
end

def print_array_pokemons()
  pokemons = []
  puts "Сколько покемонов добавить?"
  number_of_pokemon = gets.to_i
  number_of_pokemon.times do
    puts "Укажите имя и цвет покемона"
    name = gets.chomp
    color = gets.chomp
    pokemons << { name => color }
  end
  pokemons
end