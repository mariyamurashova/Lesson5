class Station

  include InstanceCounter
  include InstanceCounter

  attr_accessor :name
  Station.set_instances
  Station.set_register_instances
  @@stations = []

  def self.all_st 
    @@stations.each_with_index {|station, index| puts "#{index} - #{station.name}, #{station}"}
  end

  def initialize(name)
    @name = name
    @trains_on_station = []  
    @@stations << self
    puts "Всего создано #{Station.instances_add} станции"
    puts "Счетчик инстанс = #{register_instance_set}"
  end
   
  def come_in_trains(train)
    @trains_on_station << train
  end
  
  def show_train_list
    total_trains_number
  end

  def leave_station(train)
    @trains_on_station.delete(train)
  end

  protected

  def total_trains_number
    puts "Сейчас на станции находятся следующие поезда:"
    @trains_on_station.each  do |train|  puts "Поезд #{train.name} - #{train.train_type} "
    end
    puts "Всего: #{@trains_on_station.length} поезда"
  end
end