struct TimeDateZone{T} <: AbstractTime
    timedate::TimeDate
    in_zone::T                # VariableTimeZone or FixedTimeZone
    at_zone::FixedTimeZone
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

#=
function TimeDateZone{T}(zdt::ZonedDateTime) where {T<:FixedTimeZone}
    datetime = DateTime(zdt)
    in_zone  = zdt.timezone
    TimeDateZone{T}(datetime, in_zone)
end
=#
