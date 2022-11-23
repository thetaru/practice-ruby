class Bicycle
    # コードはRoadBikeに移した
end

class RoadBike < Bicycle
    # Bicycleクラスのコードを持つ
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

class MountainBike < Bicycle
    attr_reader :front_shock, :rear_shock

    def initialize(args)
        @front_shock = args[:front_shock]
        @rear_shock = args[:rear_shock]
        super(args)
    end

    def spares
        super.merge({ rear_shock: rear_shock, front_shock: front_shock })
    end
end

road_bike = RoadBike.new(
                    size: 'M',
                    tape_color: 'red')
puts road_bike.size

# sizeというメンバ変数はないので失敗する
mountain_bike = MountainBike.new(
                    size: 'S',
                    front_shock: 'Manitou',
                    rear_shock: 'Fox')
puts mountain_bike.size