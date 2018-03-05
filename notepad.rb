require_relative "lib/post"
require_relative "lib/memo"
require_relative "lib/link"
require_relative "lib/task"

puts 'Привет. Это блокнот.'
puts 'Что хочешь записать?'

choices = Post.post_types

choice = -1

until choice >=0 && choices.size
  choices.each_with_index do |type, index|
    puts "\t#{index}. #{type}"
  end

  choice = STDIN.gets.chomp.to_i
end

entry = Post.create(choice)

entry.read_from_console

entry.save

puts 'Запись сохранена успешно.'