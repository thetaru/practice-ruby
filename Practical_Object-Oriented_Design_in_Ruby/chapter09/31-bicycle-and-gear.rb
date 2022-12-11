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
    attr_reader :chainring, :cog, :wheel, :observer
    def initialize(args)
        @chainring = args[:chainring]
        @cog = args[:cog]
        @wheel = args[:wheel]
        @observer = args[:observer]
    end

    def gear_inches
        ratio * wheel.diameter
    end

    def ratio
        chainring / cog.to_f
    end

    def set_cog(new_cog)
        @cog = new_cog
        changed
    end

    def set_chainring(new_chainring)
        @chainring = new_chainring
        changed
    end

    def changed
        observer.changed(chainring, cog)
    end
end

require 'minitest/autorun'
class GearTest < MiniTest::Unit::TestCase
    def setup
        @observer = MiniTest::Mock.new
        @gear = Gear.new(chainring: 52, cog: 11, observer: @observer)
    end

    def test_notifies_observers_when_cogs_change
        @observer.expect(:changed, true, [52, 27])
        @gear.set_cog(27)
        @observer.verify
    end

    def test_notifies_observers_when_chainrings_change
        @observer.expect(:changed, true, [42, 11])
        @gear.set_chainring(42)
        @observer.verify
    end
end