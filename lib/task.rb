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
    time_string = "Создано: #{@created_at.strftime("%Y.%m.%d, %H:%M:%S").enconde("UTF-8")} \n\r\n\r"

    deadline = "Крайний срок: #{@due_date}"

    [time_string, deadline, @text]
  end

  def to_db_hash
    return super.merge(
      {
        'text' => @text,
        'due_date' => @due_date.to_s
      }
    )
  end

  def load_data(data_hash)
    super(data_hash)

    @due_date = Date.parse(data_hash['due_date'])
  end
end