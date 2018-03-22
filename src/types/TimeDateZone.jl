const AkoTimeZone = Union{VariableTimeZone, FixedTimeZone}

struct TimeDateZone <: AbstractTime
    timedate::TimeDate
    in_zone::AkoTimeZone
    at_zone::FixedTimeZone
    
    function TimeDateZone(timedate::TimeDate, in_zone::AkoTimeZone)
        zdt = ZonedDateTime(DateTime(timedate), in_zone)
        new(timedate, zdt.timezone, zdt.zone)
    end
end

TimeDateZone(time::Time, date::Date, in_zone::T) where {T<:AkoTimeZone} =
    TimeDateZone(TimeDate(time,date), in_zone)
TimeDateZone(datetime::DateTime, in_zone::T) where {T<:AkoTimeZone} =
    TimeDateZone(Time(datetime), Date(datetime), in_zone)
TimeDateZone(date::Date, in_zone::T) where {T<:AkoTimeZone} =
    TimeDateZone(TIME0, date, in_zone)

TimeDateZone(zdt::ZonedDateTime)
   datetime = DateTime(zdt)
   timedate = TimeDate(datetime)
   in_zone = zdt.timezone
   at_zone = zdt.zone
   TimeDateZone(timedate, in_zone, at_zone)
end

