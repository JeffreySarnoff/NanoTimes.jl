struct TimeDate <: TimeType
    at_time::Time
    on_date::Date
end

@inline at_time(x::TimeDate) = x.at_time
@inline on_date(x::TimeDate) = x.on_date
@inline nanomicro(x::TimeDate) =
    Nanosecond(MICROSECONDS_PER_NANOSECOND * microsecond(at_time(x)) + nanosecond(at_time(x))) 
@inline datetime(x::TimeDate) = on_date(x) + (at_time(x) - nanomicro(x))

TimeDate(x::TimeDate) = x

TimeDate(datetime::DateTime) = TimeDate(Time(datetime), Date(datetime))
TimeDate(date::Date) = TimeDate(TIME0, date)
TimeDate(date::Date, time::Time) = TimeDate(time, date)

TimeDate(zdt::ZonedDateTime) = TimeDate( DateTime(zdt) )

DateTime(x::TimeDate) = datetime(x)
Date(x::TimeDate) = Date(datetime(x))
