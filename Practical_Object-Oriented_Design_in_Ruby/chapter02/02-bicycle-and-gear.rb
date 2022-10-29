class Gear
    attr_reader :chainring, :cog, :rim, :tire
    def initialize(chainring, cog, rim, tire)
        @chainring = chainring
        @cog = cog
        @rim = rim
        @tire = tire
    end

    def ratio
        # ギア比 = 歯数 / コグ数
        chainring / cog.to_f
    end

    def gear_inches
        # ギアインチ = 車輪の直径 * ギア比
        # 車輪の直径 = (リムの直径 + タイヤの厚み) * 2
        ratio * (rim + (tire * 2))
    end
end

puts Gear.new(52, 11, 26, 1.5).gear_inches
puts Gear.new(52, 11, 24, 1.25).gear_inches

# puts Gear.new(52, 11).ratio