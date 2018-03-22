struct TimeDateZone{T} <: AbstractTime
    timedate::TimeDate
    in_zone::T                # VariableTimeZone or FixedTimeZone
    at_zone::FixedTimeZone
  
    function TimeDateZone{T}(timedate::TimeDate, in_zone::T, at_zone::FixedTimeZone) where {T<:FixedTimeZone}
        new{T}(timedate, in_zone, at_zone)
    end
  
    function TimeDateZone{T}(timedate::TimeDate, in_zone::T, at_zone::FixedTimeZone) where {T<:VariableTimeZone}
        new{T}(timedate, in_zone, at_zone)
    end
end

TimeDateZone{T}(timedate::TimeDate, in_zone::T) where {T<:VariableTimeZone} =
    TimeDateZone{VariableTimeZone}(timedate, in_zone)

TimeDateZone{T}(timedate::TimeDate, in_zone::T) where {T<:FixedTimeZone} =
    TimeDateZone{FixedTimeZone}(timedate, in_zone)

function TimeDateZone{T}(zdt::ZonedDateTime) where {T<:VariableTimeZone}
    datetime = DateTime(zdt)
    in_zone  = zdt.timezone
    TimeDateZone{T}(datetime, in_zone)
end

function TimeDateZone{T}(zdt::ZonedDateTime) where {T<:FixedTimeZone}
    datetime = DateTime(zdt)
    in_zone  = zdt.timezone
    TimeDateZone{T}(datetime, in_zone)
end
