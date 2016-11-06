require "json"

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
        start_date: {type: Time, converter: Converters::Date},
        start_time: {type: Time, converter: Converters::Time},
        description: {type: String, default: ""},
        profile_content: {type: String, default: ""},
        project_type: {type: String, default: "shared"},
        public: {type: Bool, default: false},
        atom_enabled: {type: Bool, default: true},
        current_iteration_number: {type: Int16 | Int32, default: 1},
        account_id: {type: Int16 | Int32, default: -1},
        created_at: {type: Time, converter: Converters::Time},
        updated_at: {type: Time, converter: Converters::Time},
      )
    end
  end
end
