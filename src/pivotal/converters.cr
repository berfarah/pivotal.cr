module Converters
  ISO8601_TIME = "%Y-%m-%dT%TZ"

  struct TimeFormat
    def initialize(@time_format : String); end

    getter :time_format

    def from_json(pull : JSON::PullParser)
      time_string = pull.read_string_or_null
      return if time_string.nil?
      ::Time.parse(time_string, time_format)
    end

    def to_json(value, io)
      io << value.to_s(time_format)
    end
  end

  Time = Converters::TimeFormat.new(ISO8601_TIME)
  Date = Converters::TimeFormat.new("%F")
end
