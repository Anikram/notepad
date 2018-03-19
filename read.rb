require_relative 'lib/post.rb'
require_relative 'lib/memo.rb'
require_relative 'lib/link.rb'
require_relative 'lib/task.rb'

# id, limit, type

require 'optparse'

options = {}

OptionParser.new do |opt|
  opt.banner = "Useage: read.rb (options)"

  opt.on('-h', 'Prints this help') do
    puts opt
    exit
  end

  opt.on('--type POST_TYPE', 'Какой тип постов показывать (по умолчанию любой)') { |o| options[:type] = o } #
  opt.on('--id POST_ID', 'Если задан id - показывается только пост с таким id') { |o| options[:id] = o } #
  opt.on('--limit NUMBER', 'Сколько последних постов показывать (по умолчанию все)') { |o| options[:limit] = o } #

end.parse!

result = Post.find(options[:limit], options[:type], options[:id])

if result.is_a? Post
  puts "Запись #{result.class.name}, id = #{options[:id]}"

  result.to_strings.each do |line|
    puts line
  end
else # показ таблицы результатов
  print "| id\t|  @type\t|  @created_at\t\t\t|  @text\t\t\t| @url\t\t| @due_date \t"

  result.each do |row|
    puts

    row.each do |element|

      item = element.to_s.gsub("\n\r", "")

      print"| #{item[0..40]}\t"
    end
  end
end

puts
