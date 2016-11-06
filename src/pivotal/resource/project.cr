require "json"

ISO8601_TIME = "%Y-%m-%dT%TZ"
struct TimeConverter
  def initialize(@time_format : String); end

  getter time_format
def from_json(pull : JSON::PullParser)
    time_string = pull.read_string_or_null
    return if time_string.nil?
    Time.parse(time_string, time_format)
  end

  def to_json(value, io)
    io << value.to_s(time_format)
  end
end

module Pivotal
  module Resource
    class Project
      def self.find(id)
        response = Client.request(
          method: "GET",
          path: "/projects/#{id}",
        )
        self.from_json(response.body)
      end

      def self.all
        response = Client.request(
          method: "GET",
          path: "/projects",
        )
        Array(Project).from_json(response.body)
      end

      def get
        self.class.find(id)
      end

      JSON.mapping(
        id: {type: Int16 | Int32, default: -1},
        name: String,
        version: {type: Int16 | Int32, default: 1},
        iteration_length: {type: Int16 | Int32, default: 1},
        week_start_day: {type: String, default: "Monday"},
        point_scale: {type: String, default: "0,1,2,3"},
        point_scale_is_custom: {type: Bool, default: false},
        bugs_and_chores_are_estimatable: {type: Bool, default: false},
        automatic_planning: {type: Bool, default: true},
        enable_tasks: {type: Bool, default: true},
        start_date: {type: Time, converter: TimeConverter.new("%F")},
        start_time: {type: Time, converter: TimeConverter.new(ISO8601_TIME)},
        description: {type: String, default: ""},
        profile_content: {type: String, default: ""},
        project_type: {type: String, default: "shared"},
        public: {type: Bool, default: false},
        atom_enabled: {type: Bool, default: true},
        current_iteration_number: {type: Int16 | Int32, default: 1},
        account_id: {type: Int16 | Int32, default: -1},
        created_at: {type: Time, converter: TimeConverter.new(ISO8601_TIME)},
        updated_at: {type: Time, converter: TimeConverter.new(ISO8601_TIME)},
      )
    end
  end
end
