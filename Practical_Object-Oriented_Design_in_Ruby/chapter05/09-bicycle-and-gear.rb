class Trip
    attr_reader :bicycles, :customers, :vehicle

    # ダックタイピング
    def prepare(preparers)
        prepares.each { |preparer| preparer.prepare_trip(self) }
    end
end

class Mechanic
    def prepare_bicycles(bicycles)
        bicycles.each { |bicycle| prepare_bicycle(bicycle) }
    end

    def prepare_bicycle(bicycle)
        #
    end

    def prepare_trip(trip)
        trip.bicycles.each { |bicycle| prepare_bicycle(bicycle) }
    end
end

class TripCoordinator
    def buy_food(customers)
        #
    end

    def prepare_trip(trip)
        buy_food(trip.customers)
    end
end

class Driver
    def gas_up(vehicle)
        #
    end

    def fill_water_tank(vehicle)
        #
    end

    def prepare_trip(trip)
        vehicle = trip.vehicle
        gas_up(vehicle)
        fill_water_tank(vehicle)
    end
end
