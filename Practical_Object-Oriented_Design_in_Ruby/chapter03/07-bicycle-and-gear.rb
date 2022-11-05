class Gear
    attr_reader :chainring, :cog
    def initialize(chainring, cog)
        @chainring = chainring
        @cog = cog
    end

    def ratio
        chainring / cog.to_f
    end

    def gear_inches(diameter)
        ratio * diameter
    end
end

# WheelがGearに依存するように修正
class Wheel
    attr_reader :rim, :tire, :gear
    def initialize(rim, tire, gear)
        @rim = rim
        @tire = tire
        @gear = gear
    end

    def diameter
        rim + (tire * 2)
    end

    def gear_inches
        gear.gear_inches(diameter)
    end
end

puts Wheel.new(26, 1.5, Gear.new(52, 11)).gear_inches