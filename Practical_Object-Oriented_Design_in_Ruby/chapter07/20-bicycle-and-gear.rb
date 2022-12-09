class Schedule
    def scheduled?(schedulable, start_date, end_date)
        puts "This #{schedulable.class} " +
             "is not scheduled\n" +
             " between #{start_date} and #{end_date}"
        false
    end
end

# 簡単のため、スケジュール部分の実装のみとする
class Bicycle
    attr_writer :schedule

    def initialize(args={})
        @schedule = args[:schedule] || Schedule.new
    end

    def schedulable?(start_date, end_date)
        !scheduled?(start_date - lead_days, end_date)
    end

    def scheduled?(start_date, end_date)
        schedule.scheduled?(self, start_date, end_date)
    end

    def lead_days
        1
    end
end

require 'date'
starting = Date.parse("2015/09/04")
ending = Date.parse("2015/09/10")

b = Bicycle.new
puts b.schedulable?(starting, ending)