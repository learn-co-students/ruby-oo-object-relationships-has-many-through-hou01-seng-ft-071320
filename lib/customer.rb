class Customer
  attr_accessor :name, :age
  @@all=[]
  def initialize(name,age)
    @name=name
    @age=age
    @@all<<self
  end
  def self.all
    @@all
  end
  
  def new_meal(waiter,total,tip)
    Meal.new(waiter,self,total,tip)
  end
  
  def meals
    Meal.all.find_all{|value|
    value.customer==self}
  end

  def waiters
    arr=Meal.all.find_all{|value|
    value.customer==self}
    arr.map{|ele|
    ele.waiter}
  end

end