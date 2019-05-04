class Elevator
  attr_reader :number_of_floors
  attr_accessor :current_floor, :direction, :selected_floors

  def initialize(input_options)
    @number_of_floors = 25
    @direction = input_options[:direction]
    @selected_floors = input_options[:selected_floors]
    @current_floor = input_options[:current_floor]
    sort_floors
    movement
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
    selected_floors
  end

  def movement
    count = 0
    selected_floors.each do |floor|
      if floor > @number_of_floors || floor < 1
        count += 1
        puts "Floor #{floor} is not accessible, please select another floor."
      elsif direction == "up" && @current_floor >= floor
        count += 1
        puts "Floor #{floor} is not accessible, please select another floor."
      elsif direction == "down" && @current_floor <= floor
        count += 1
        puts "Floor #{floor} is not accessible, please select another floor."
      end
    end
    if count == 0
      puts "Going #{direction}."
      display_floor_number
    end
  end

  def display_floor_number
    if direction == "up"
      selected_floors.each do |floor|
        until @current_floor == floor
          puts "Current Floor: #{@current_floor}"
          sleep 1
          @current_floor += 1
        end
        puts "You have arrived at floor #{floor}."
      end
    end

    if direction == "down"
      selected_floors.each do |floor|
        until @current_floor == floor
          puts "Current Floor: #{@current_floor}"
          sleep 1
          @current_floor -= 1
        end
      puts "You have arrived at floor #{floor}"
      end
    end
  end

end

elevator = Elevator.new(
                        direction: "up", 
                        selected_floors: [12, 3, 10], 
                        current_floor: 1
                        )
elevator = Elevator.new(
                        direction: "down", 
                        selected_floors: [3, 8, 5], 
                        current_floor: 12
                        )
elevator = Elevator.new(
                        direction: "up", 
                        selected_floors: [30, 32], 
                        current_floor: 1
                        )
elevator = Elevator.new(
                        direction: "up", 
                        selected_floors: [7, 11], 
                        current_floor: 9
                        )




