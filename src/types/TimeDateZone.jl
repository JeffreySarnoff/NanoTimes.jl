struct TimeDateZone{T} <: AbstractTime
    timedate::TimeDate
    in_zone::T                # VariableTimeZone or FixedTimeZone
    at_zone::FixedTimeZone

    function TimeDateZone{VariableTimeZone}(timedate::TimeDate, in_zone::VariableTimeZone)
        at_zone = ZonedDateTime(DateTime(timedate), in_zone).zone
        new{VariableTimeZone}(timedate, in_zone, at_zone)
    end
    function TimeDateZone{FixedTimeZone}(timedate::TimeDate, in_zone::FixedTimeZone)
        at_zone = ZonedDateTime(DateTime(timedate), in_zone).zone
        new{FixedTimeZone}(timedate, in_zone, at_zone)
    end

end


TimeDateZone(timedate::TimeDate, in_zone::T) where {T<:VariableTimeZone} =
    TimeDateZone{VariableTimeZone}(timedate, in_zone)

TimeDateZone(timedate::TimeDate, in_zone::T) where {T<:FixedTimeZone} =
    TimeDateZone{FixedTimeZone}(timedate, in_zone)

function TimeDateZone(zdt::ZonedDateTime) where {T}
    datetime = DateTime(zdt)
    timedate = TimeDate(datetime)
    in_zone  = zdt.timezone
    TimeDateZone(timedate, in_zone)
end

TimeDateZone{VariableTimeZone}(timedate::TimeDate, in_zone::VariableTimeZone)
    TimeDateZone{VariableTimeZone}(timedate, in_zone
#=
function TimeDateZone{T}(zdt::ZonedDateTime) where {T<:FixedTimeZone}
    datetime = DateTime(zdt)
    in_zone  = zdt.timezone
    TimeDateZone{T}(datetime, in_zone)
end
=#
