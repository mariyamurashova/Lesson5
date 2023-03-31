class CargoTrain < Train

  CargoTrain.set_instances
  CargoTrain.set_register_instances
  
  def initialize(number)
    super
    @train_type= :cargo 
    puts "Количество грузовых поездов #{ CargoTrain.instances_add}"
    puts "Инстанс счетчик из примера #{register_instance_set1}"
  end
end