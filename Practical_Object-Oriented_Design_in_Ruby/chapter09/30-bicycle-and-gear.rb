class Wheel
    attr_reader :rim, :tire
    def initialize(rim, tire)
        @rim = rim
        @tire = tire
    end

    def diameter
        rim + (tire * 2)
    end
end

class Gear
    attr_reader :chainring, :cog, :wheel
    def initialize(args)
        @chainring = args[:chainring]
        @cog = args[:cog]
        @wheel = args[:wheel]
    end

    def gear_inches
        ratio * wheel.diameter
    end

    def ratio
        chainring / cog.to_f
    end
end

class DiameterDouble
    def diameter
        10
    end
end

require 'minitest/autorun'
class GearTest < MiniTest::Unit::TestCase
    def test_calculates_gear_inches
        gear = Gear.new(chainring: 52, cog: 11, wheel: DiameterDouble.new)
        assert_in_delta(47.27, gear.gear_inches, 0.01)
    end
end