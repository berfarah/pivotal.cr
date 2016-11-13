require "json"
require "./person"

module Pivotal
  module Resource
    class ProjectMembership
      def self.find(id : Int32?, project_id)
        response = Client.request(
          method: "GET",
          path: "projects/#{project_id}/memberships/#{id}",
        )
        self.from_json(response.body)
      end

      def self.all(project_id : Int32?)
        return Array(self).new if project_id.nil?

        response = Client.request(
          method: "GET",
          path: "projects/#{project_id}/memberships",
        )

        Array(self).from_json(response.body)
      end

      def get
        self.class.find(id)
      end

      JSON.mapping(
        id: {type: Int32, default: -1},
        person: {type: Person, default: Person.new},
        project_color: {type: String, nilable: true},
        project_id: {type: Int32, nilable: true},
        created_at: {type: Time, converter: Converters::Time},
        updated_at: {type: Time, converter: Converters::Time},
      )
    end
  end
end
