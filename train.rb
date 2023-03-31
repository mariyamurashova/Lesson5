class Train

  include ProduceCompany
  include InstanceCounter

  attr_accessor :train_speed
  attr_reader :number, :train_type, :stations_on_route, :trains
   
  @@trains = [ ]  
  Train.set_instances
  Train.set_register_instances
  def self.find_train (number)
  return @@trains.find {|train| train.number == number}
  end

  def initialize(number)
    @speed = 0
    @number = number.to_s
    @@trains << self
    @train_carriage = []
    puts "Количество  поездов #{Train.instances_add}"
  end
    
  def train_speed_up
    @speed += 50
  end

  def stop_train
    @speed = 0
  end

  def carriage_number
    puts "Количество вагонов в поезде: #{@train_carriage.length}"
  end

  def add_carriage(train, carriage)
    if train_stopped?
      @train_carriage << carriage
    else
       puts ("Поезд движется")
    end
  end

  def remove_carriage(train)
    if train_stopped?
      @train_carriage.pop()
    else
        puts ("Поезд движется")
    end
  end

  def train_route(route)
    set_train_to_begining(route)    
    move_to_first_station
  end

  def moving_forward
    if not_last_station?
      leave_current_station
      @current_station += 1
      move_next_station  
    else puts "Это последняя станция"
    end
  end

  def moving_back
    if not_first_station?
      leave_current_station
      @current_station-=1
      move_next_station
    else puts "Это первая станция"
    end
  end

  def current_train_position
    if not_first_station?        
      print_station  
    else
      puts "Поезд находится на 1-ой станции маршрута"
    end 
    if not_last_station?
      print_next_station
    else
        puts "Это последняя станция маршрута"
    end
  end

  protected

  def train_stopped?
    @speed == 0
  end

  def set_train_to_begining(route)
    @stations_on_route =[]
    @current_station = 0
    @stations_on_route = route.stations 
  end

  def print_station
    puts "Поезд находится на станции: #{@stations_on_route[@current_station].name}"
    puts "Предыдущая станция: #{@stations_on_route[@current_station-1].name}"
  end

  def print_next_station
    puts "Следующая станция: #{@stations_on_route[@current_station+1].name}"
  end

  def move_to_first_station
    @stations_on_route[0].come_in_trains(self)
  end
    
  def leave_current_station 
    @stations_on_route[@current_station].leave_station(self)  
  end

  def not_last_station?
    @current_station < @stations_on_route.length-1
  end

  def not_first_station?
    @current_station >= 1
  end

  def move_next_station
    @stations_on_route[@current_station].come_in_trains(self)
  end
end
