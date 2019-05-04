require 'rspec'

class Elevator
  attr_reader :number_of_floors
  attr_accessor :current_floor, :direction, :selected_floors

  def initialize(input_options)
    @number_of_floors = 25
    @direction = input_options[:direction]
    @selected_floors = input_options[:selected_floors]
    @current_floor = input_options[:current_floor]
  end

  def sort_floors
    if direction == "up"
      sorted = false
      number = selected_floors.length

      while sorted == false
       sorted = true 
        (number-1).times do |index|
          if selected_floors[index] > selected_floors[index + 1]
            selected_floors[index], selected_floors[index + 1] = selected_floors[index + 1], selected_floors[index]
            sorted = false
          end
        end
        if sorted == true
          break
        end
      end
    end

    if direction == "down"
      sorted = false
      number = selected_floors.length

      while sorted == false
       sorted = true 
        (number-1).times do |index|
          if selected_floors[index] < selected_floors[index + 1]
            selected_floors[index], selected_floors[index + 1] = selected_floors[index + 1], selected_floors[index]
            sorted = false
          end
        end
        if sorted == true
          break
        end
      end
    end
    return selected_floors
  end

  def movement
    count = 0
    selected_floors.each do |floor|
      if floor > @number_of_floors || floor < 1
        count += 1
        return "Floor is not accessible"
      elsif direction == "up" && @current_floor >= floor
        count += 1
        return "Floor is not accessible"
      elsif direction == "down" && @current_floor <= floor
        count += 1
        return "Floor is not accessible"
      end
    end
    if count == 0
      return "Floor is accessible"
    end
  end

  def display_floor_number
    if direction == "up"
      selected_floors.each do |floor|
        until @current_floor == floor
          @current_floor += 1
        end
        return "Floor numbers counting up"
      end
    end

    if direction == "down"
      selected_floors.each do |floor|
        until @current_floor == floor
          @current_floor -= 1
        end
      return "Floor numbers counting down"
      end
    end
  end

end

RSpec.describe Elevator do
  describe '#sort_floors' do
    it 'should return a sorted array of floors in ascending order' do
      elevator = Elevator.new(
                              direction: "up", 
                              selected_floors: [12, 3], 
                              )
      result = elevator.sort_floors
      expect(result).to eq([3, 12])
    end
  end

  describe '#sort_floors' do
    it 'should return a sorted array of floors in descending order' do 
      elevator = Elevator.new(
                              direction: "down", 
                              selected_floors: [2, 20, 13, 18], 
                              )
      result = elevator.sort_floors
      expect(result).to eq([20, 18, 13, 2])
    end
  end

  describe '#movement' do 
    it 'should return if the floor is accessible' do 
      elevator = Elevator.new(
                              direction: "up",
                              selected_floors: [6, 10, 22],
                              current_floor: 2
                              )
      result = elevator.movement
      expect(result).to eq("Floor is accessible")          
    end
  end

  describe '#movement' do 
    it 'should return if the floor is accessible' do 
      elevator = Elevator.new(
                              direction: "up",
                              selected_floors: [3, 30],
                              current_floor: 2
                              )
      result = elevator.movement
      expect(result).to eq("Floor is not accessible")          
    end
  end

  describe '#movement' do 
    it 'should return if the floor is accessible' do 
      elevator = Elevator.new(
                              direction: "down",
                              selected_floors: [-5],
                              current_floor: 2
                              )
      result = elevator.movement
      expect(result).to eq("Floor is not accessible")          
    end
  end

  describe '#movement' do 
    it 'should return if the floor is accessible' do 
      elevator = Elevator.new(
                              direction: "down",
                              selected_floors: [2],
                              current_floor: 2
                              )
      result = elevator.movement
      expect(result).to eq("Floor is not accessible")          
    end
  end

  describe '#movement' do 
    it 'should return if the floor is accessible' do 
      elevator = Elevator.new(
                              direction: "up",
                              selected_floors: [23, 12],
                              current_floor: 21
                              )
      result = elevator.movement
      expect(result).to eq("Floor is not accessible")          
    end
  end

  describe '#display_floor_number' do
    it 'should return the display of floor numbers' do 
      elevator = Elevator.new(
                              direction: "up", 
                              selected_floors: [2, 4], 
                              current_floor: 1
                              )
      result = elevator.display_floor_number
      expect(result).to eq("Floor numbers counting up")
    end
  end

  describe '#display_floor_number' do
    it 'should return the display of floor numbers' do 
      elevator = Elevator.new(
                              direction: "down", 
                              selected_floors: [14], 
                              current_floor: 18
                              )
      result = elevator.display_floor_number
      expect(result).to eq("Floor numbers counting down")
    end
  end
end




