require 'pry'

class Waiter
    attr_reader :waiter, :exp
    @@all = []

    def initialize(waiter_name, exp)
        @waiter = waiter_name
        @exp = exp
        @@all << self
    end

    def self.all
        @@all
    end

    def new_meal(customer_name, total, tip)
        new_meal = Meal.new(self, customer_name, total, tip)
        new_meal
    end

    def meals
        Meal.all.find_all {|meals| meals.waiter == self}
    end

    def best_tipper
        array = []
        self.meals.select {|i| array << i.tip}
        self.meals.find do |i|
            if array.max{|a,b| a<=>b} == i.tip
                return i.customer
            end
        end
    end
end