require 'rails_helper'

RSpec.describe Car, type: :model do
  describe 'attributes of a car' do
    # it 'has a make' do
    #   testmake = 'Toyota'
    #   car = Car.create(make: testmake)
    #   expect(car.make).to eq(testmake)
    # end 

    # it 'has a color' do
    #   testcolor = 'aqua'
    #   car = Car.create(color: testcolor)
    #   expect(car.color).to eq(testcolor)
    # end 

    it { should respond_to :make }
    it { should respond_to :color }
    it { should respond_to :year }

    describe 'Validations' do 
      it { should validate_uniqueness_of :make}
      it { should validate_presence_of :make}
    end 
  end 

  describe 'Class Methods' do 

    before(:each) do
      @car1 = Car.create(make: 'Toyota', color: 'black', year: 2008)
      @car2 = Car.create(make: 'Hummer', color: 'silver', year: 2000)
      @car3 = Car.create(make: 'Ford', color: 'silver', year: 2015)
    end 

    it 'should sort make :asc' do
      # @car1 = Car.create(make: 'Toyota', color: 'black', year: 2008)
      # @car2 = Car.create(make: 'Toyota', color: 'silver', year: 2000)
      # @car3 = Car.create(make: 'Ford', color: 'silver', year: 2015)

      expect(Car.by_make).to eq([@car3, @car2, @car1])
    end 

    it 'should sort color :asc' do
      # @car1 = Car.create(make: 'Toyota', color: 'black', year: 2008)
      # @car2 = Car.create(make: 'Toyota', color: 'silver', year: 2000)
      # @car3 = Car.create(make: 'Ford', color: 'silver', year: 2015)

      expect.(Car.by_color).to eq([@car1, @car2, @car3])
    end 

    it 'should sort year :asc' do

      expect.(Car.by_year).to eq([@car2, @car1, @car3])

    end 
  end 

  describe 'Instance Methods' do
    before(:each) do
      @attr = {
        make: 'Toyota', 
        # model: 'prius',
        color: 'red',
        # mileage: 1000,
        year: 2012
      }
      
      @car = Car.create(@attr)
    end 

    it 'paints a car' do 
      @car.paint('pink')
      expect(@car.color).to eq('pink')
    end 

    it 'returns car info' do
      expect(@car.info).to eq(@attr.with_indifferent_access)
    end 
    
    it 'honk its horn' do
      expect(@car.honk).to eq("beep beep!")
    end 
  end 
end 

