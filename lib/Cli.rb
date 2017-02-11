require 'pry'
class Cli
  def call
    system('clear')
    puts "loading Inventory Checker...."
    sleep(2)
    system('clear')
    puts "Inventory Checker loaded"
    sleep(2)
    system('clear')
    puts "You can now check your inventory."
    sleep(2)
    search_by
  end

  def search_by
    system('clear')
    puts "Would you like to search by items or warehouse? Type exit to exit program"
    input = gets.strip
    case input
      when 'items'
        puts "we are searching by items"
      when 'warehouse'
        puts 'we are searching by warehouse'
        Warehouse.all.each{|x| puts x.name}
      when 'exit'
        exit
      else
        puts 'incorrect input'
        sleep(1)
        search_by
    end
  end
end
