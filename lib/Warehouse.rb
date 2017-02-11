require 'pry'
class Warehouse
  attr_accessor :items, :name, :location

  @@all = []

  def initialize(name)
    @name = name
    @items = []
  end

  def self.create(name)
    self.new(name).tap{|warehouse| warehouse.save}
  end

  def self.all
    @@all
  end

  def save
    Warehouse.all.push(self)
  end

  def self.find(name)
    self.all.find{|warehouse| warehouse if warehouse.name == name}
  end

  def self.find_or_create_by(name)
    self.find(name) ? self.find(name) : self.create(name)
  end

  def addItem(item, quantity)
    item_hash = @items.find{|x| x if x.keys[0] == item.name}
    if !item_hash
      item_hash = {}
      item_hash[item.name] = quantity
      @items.push(item_hash)
  else
    puts "Item exist, update quantity amount? Currently #{item_hash.values[0]}"
    quantity = gets.strip.to_i
    item_hash[item_hash.keys[0]] = item_hash.values[0] + quantity
    @items.each do |hash|
      hash = item_hash if hash.keys[0] == item_hash.keys[0]
    end
  end
end
