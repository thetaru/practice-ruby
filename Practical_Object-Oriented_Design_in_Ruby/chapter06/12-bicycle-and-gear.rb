# RoadBikeの役割も持っている
class Bicycle
    attr_reader :size, :tape_color

    def initialize(args)
        @size = args[:size]
        @tape_color = args[:tape_color]
    end

    def spares
        {
            chain: '10-speed',
            tire_size: '23',
            tape_color: tape_color
        }
    end
end

# MountainBikeなのにRoadBikeの役割を継承している
class MountainBike < Bicycle
    attr_reader :front_shock, :rear_shock

    def initialize(args)
        @front_shock = args[:front_shock]
        @rear_shock = args[:rear_shock]
        super(args) # (Bicycle::initialize)(args)
    end

    def spares
        # (Bicycle::spares).mearge({ rear_shock: rear_shock, front_shock: front_shock })
        super.merge({ rear_shock: rear_shock, front_shock: front_shock })
    end
end

mountain_bike = MountainBike.new(
                    size: 'S',
                    front_shock: 'Manitou',
                    rear_shock: 'Fox')

puts mountain_bike.size
puts mountain_bike.spares