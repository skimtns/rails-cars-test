class Car < ApplicationRecord
  # validates_presence_of :make
  # validates_uniqueness_of :make

  validates :make, uniqueness: true, presence: true 

  def self.by_make
    #order the cars by make ascending order 
    # Car.order(:make)
    order(:make)
  end 

  def self.by_color
    #order the cars by color ascending order
    order(:color)
  end 

  def self.by_year(direction = :asc)
    #order the cars by year ascending order
    order(year: direction)
  end 

  def paint(color1)
    #changes the color
    self.update(color: color1)
  end 

  def info
    #returns all the info of a car
    self.attributes.except('id', 'created_at', 'updated_at')
  end 

  def honk
    #returns the car horn 
    'beep beep!'
  end
end
