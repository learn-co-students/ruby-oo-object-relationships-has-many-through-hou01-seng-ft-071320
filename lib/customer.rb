require 'pry'

class Customer
    attr_reader :name, :age
    @@all = []

    def initialize(name, age)
        @name = name
        @age = age
        @@all << self
    end

    def self.all
        @@all
    end

    def new_meal(waiter_name, total, tip)
        new_meal = Meal.new(waiter_name, self, total, tip)
        new_meal
    end

    def meals
        Meal.all.find_all {|meals| meals.customer == self}
    end

    def waiters
        array= []
        self.meals.find_all do |meal|
            array << meal.waiter
        end
        array
    end
end