__precompile__()

module NanoTimes

export TimeDate, TimeDateZone,
       fastpart, slowpart

import Base: promote_type, promote_rule, convert, string, show, showcompact,
             (==), (!=), (<=), (<), (>), (>=), isless, isequal,
             isempty, time, min, max, minmax

import Base: start, done, next, eltype, length, size

import Base.Math: (+), (-), (*), (/),
                  fld, cld, div, rem, mod, round

import Dates: Time, Date, DateTime,
              Year, Month, Day, Hour, Minute, Second,
              Millisecond, Microsecond, Nanosecond,
              year, month, day, hour, minute, second,
              millisecond, microsecond, nanosecond

using Dates: AbstractTime
using Dates
import Dates: CompoundPeriod

using CompoundPeriods
import CompoundPeriods: isolate_days, canonical

using TimeZones
import TimeZones: @tz_str, ZonedDateTime, TimeZone,
    localzone, astimezone, UTCOffset, FixedTimeZone, VariableTimeZone,
    all_timezones, timezone_names

import TimeZones.value # value(offset::UTCOffset) = value(offset.std + offset.dst)

const AkoTimeZone = Union{VariableTimeZone, FixedTimeZone}

const TIME0 = Time(0)

include("support/timeconst.jl")
include("types/TimeDate.jl")
include("types/TimeDateZone.jl")
include("support/periods.jl")
include("types/selectors.jl")
include("types/arith.jl")
include("types/strshow.jl")


end # NanoTimes
