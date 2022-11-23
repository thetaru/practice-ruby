class Bicycle
    attr_reader :size, :chain, :tire_size

    def initialize(args={})
        @size = args[:size]
        @chain = args[:chain] || default_chain
        @tire_size = args[:tire_size] || default_tire_size
        post_initialize(args)
    end

    # サブクラスが必要に応じてオーバーライドする
    def post_initialize(args)
        nil
    end

    def spares
        # local_sparesで得たハッシュを追加する
        {
            tire_size: tire_size,
            chain: chain
        }.merge(local_spares)
    end

    # サブクラスが必要に応じてオーバーライドする
    def local_spares
        {}
    end

    def default_chain
        '10-speed'
    end

    def default_tire_size
        raise NotImplementedError
    end
end

# フックを利用して結合度を低減する(superを使わなくした)
class RoadBike < Bicycle
    attr_reader :tape_color

    # インスタンス作成時にスーパークラス(Bicycle)のinitializeメソッドの中で呼び出される
    def post_initialize(args)
        @tape_color = args[:tape_color]
    end

    # RoadBikeインスタンスにsparesメソッドはないので、継承元(Bicycleクラス)のsparesメソッドが呼び出される
    # local_sparesメソッドはBicycleクラスのsparesメソッドの中で呼び出される
    def local_spares
        { tape_color: tape_color }
    end

    def default_tire_size
        '23'
    end
end

# フックを利用して結合度を低減する(superを使わなくした)
class MountainBike < Bicycle
    attr_reader :front_shock, :rear_shock

    # インスタンス作成時にスーパークラス(Bicycle)のinitializeメソッドの中で呼び出される
    def post_initialize(args)
        @front_shock = args[:front_shock]
        @rear_shock = args[:rear_shock]
    end

    # MountainBikeインスタンスにsparesメソッドはないので、継承元(Bicycleクラス)のsparesメソッドが呼び出される
    # local_sparesメソッドはBicycleクラスのsparesメソッドの中で呼び出される
    def local_spares
        { rear_shock: rear_shock, front_shock: front_shock }
    end

    def default_tire_size
        '2.1'
    end
end

class RecumbentBike < Bicycle
    attr_reader :flag

    def post_initialize(args)
        @flag = args[:flag]
    end

    def local_spares
        { flag: flag }
    end

    def default_chain
        '9-speed'
    end

    def default_tire_size
        '28'
    end
end

road_bike = RoadBike.new(
                    size: 'M',
                    tape_color: 'red')
puts road_bike.spares

mountain_bike = MountainBike.new(
                    size: 'S',
                    front_shock: 'Manitou',
                    rear_shock: 'Fox')
puts mountain_bike.spares

bent = RecumbentBike.new(flag: 'tall and orange')
puts bent.spares