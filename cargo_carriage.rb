class CargoCarriage
  include ProduceCompany
  attr_reader :type
  
  def initialize 
  @type= :cargo
  end
end