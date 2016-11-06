require "json"

module Pivotal
  module Resource
    class Project
      def initialize(@id, @name = nil, @description = nil)
      end

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

      def stories
        Story.all(project_id: id)
      end

      def get
        self.class.find(id)
      end

      JSON.mapping(
        id: {type: Int16 | Int32, default: -1, nilable: true},
        name: {type: String, nilable: true},
        version: {type: Int16 | Int32, default: 1, nilable: true},
        iteration_length: {type: Int16 | Int32, default: 1, nilable: true},
        week_start_day: {type: String, default: "Monday", nilable: true},
        point_scale: {type: String, default: "0,1,2,3", nilable: true},
        point_scale_is_custom: {type: Bool, default: false, nilable: true},
        bugs_and_chores_are_estimatable: {type: Bool, default: false, nilable: true},
        automatic_planning: {type: Bool, default: true, nilable: true},
        enable_tasks: {type: Bool, default: true, nilable: true},
        start_date: {type: Time, converter: Converters::Date, nilable: true},
        start_time: {type: Time, converter: Converters::Time, nilable: true},
        description: {type: String, default: "", nilable: true},
        profile_content: {type: String, default: "", nilable: true},
        project_type: {type: String, default: "shared", nilable: true},
        public: {type: Bool, default: false, nilable: true},
        atom_enabled: {type: Bool, default: true, nilable: true},
        current_iteration_number: {type: Int16 | Int32, default: 1, nilable: true},
        account_id: {type: Int16 | Int32, default: -1, nilable: true},
        created_at: {type: Time, converter: Converters::Time, nilable: true},
        updated_at: {type: Time, converter: Converters::Time, nilable: true},
      )
    end
  end
end
