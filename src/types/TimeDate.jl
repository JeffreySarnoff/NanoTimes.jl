struct TimeDate <: TimeType
    at_time::Time
    on_date::Date
    nanosec::Nanosecond     # Nanosecond( 1_000*microsecond(at_time) + nanosecond(at_time) )
    datetime::DateTime      # on_date + (at_time - nanosec)

    function TimeDate(time::Time, date::Date)
        nanosec = Nanosecond(MICROSECONDS_PER_NANOSECOND * microsecond(time)) + nanosecond(time))
        datetime = date + (time - nanosecond)
        new( time, date, nanosec, datetime )
    end
end

TimeDate(x::TimeDate) = x

TimeDate(datetime::DateTime) = TimeDate(Time(datetime), Date(datetime))
TimeDate(date::Date) = TimeDate(TIME0, date)
TimeDate(date::Date, time::Time) = TimeDate(time, date)

TimeDate(zdt::ZonedDateTime) = TimeDate( DateTime(zdt) )
