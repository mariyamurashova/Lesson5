class PassengerTrain < Train

PassengerTrain.set_instances
PassengerTrain.set_register_instances

  def initialize(name)
    super
    @train_type = :passenger
    puts "Количество пассажирских поездов #{ PassengerTrain.instances_add}"
    puts "Инстанс счетчик из примера #{register_instance_set1}"
  end
end