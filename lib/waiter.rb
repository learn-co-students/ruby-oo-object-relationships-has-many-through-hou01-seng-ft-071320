require "pry"
class Waiter
    attr_accessor :name, :year
    @@all=[]
    def initialize(name,year)
      @name=name
      @year=year
      @@all<<self
    end
    def self.all
        @@all
    end

    def new_meal(customer,total,tip)
        Meal.new(self,customer,total,tip)
    end

    def meals
        Meal.all.find_all{|value|
        value.waiter==self}
      end
    
      def best_tipper
        arr=Meal.all.find_all{|value|
        value.waiter==self}
        tips=[]
        arr.each{|ele|
        tips.push(ele.tip)}
        id=tips.index(tips.max)
        arr[id].customer
      end
end
#binding.pry