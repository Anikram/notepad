require 'date'

class Link < Post
  def initialize
  super

    @url = ''
  end

  def read_from_console
    puts 'Адрес ссылки:'
    @url = STDIN.gets.chomp

    puts 'Комментарий к ссылке:'
    @text = STDIN.gets.chomp
  end

  def to_strings
    time_string = "Создано: #{@created_at.strftime("%Y.%m.%d, %H:%M:%S").encode("UTF-8")} \n\r\n\r"

    [time_string, @url, @text]
  end

  def to_db_hash
    return super.merge(
      {
        'text' => @text,
        'url' => @url
      }
    )
  end

  def load_data(data_hash)
    super(data_hash)

    @text = data_hash['url']
  end
end