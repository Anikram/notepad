require 'date'

class Task < Post
  def initialize
    super

    @due_date = Time.now
  end

  def read_from_console
    puts 'Что надо сделать?'
    @text = STDIN.gets.chomp

    puts 'К какому числу нужно выполнить? (в формате ДД.ММ.ГГГ)'
    input = STDIN.gets.chomp

    @due_date = Date.parse(input)
      #input.strftime("%d.%m.%Y")
  end

  def to_strings
    time_string = "Создано: #{@created_at.strftime("%Y.%m.%d, %H:%M:%S")} \n\r\n\r"

    deadline = "Крайний срок: #{@due_date}"

    [time_string, deadline, @text]
  end
end