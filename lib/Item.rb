class Item
  attr_accessor :name, :type, :warehouse
  attr_reader :serial_number
  @@all = []
  def initialize(name, type, warehouse, serial_number)
    @name, @type, @warehouse, @serial_number = name, type, warehouse, serial_number
  end

  def self.create(name, type, warehouse, serial_number)
    self.new(name, type, warehouse, serial_number).tap{|x| x.save}
  end

  def save
    @@all.push(self)
  end

  def self.find_by(name = nil, serial_number = nil)
    self.all.find{|x| x if x.name == name} if name
    self.all.find{|x| x if x.serial_number == serial_number} if serial_number
  end

  def self.find_by_or_create_by(name=nil, serial_number=nil)
    if name && self.find_by(name)
      self.find_by(name)
    elsif serial_number && self.find_by(serial_number)
      self.find_by(serial_number)
    else
      self.item_creator
    end
  end

  def self.item_creator
    puts "Item not located: "
    puts "What item are you looking for?"
    name = gets.strip
    puts "Create a serial number"
    serial_number = gets.strip
    puts "Which warehouse?"
    warehouse = Warehouse.find_or_create_by(gets.strip)
    puts "Which type of item is this?"
    type = gets.strip
    self.create(name, type, warehouse, serial_number)
  end
end
