require "json"
require "./story"
require "./iteration/*"

module Pivotal
  module Resource
    class Iteration
      def self.find(number : Int32?, project_id)
        response = Client.request(
          method: "GET",
          path: "projects/#{project_id}/iterations/#{number}",
        )
        self.from_json(response.body)
      end

      def self.all(project_id : Int32?, **params)
        return Array(self).new if project_id.nil?

        query_string = Params.new(**params).to_s

        response = Client.request(
          method: "GET",
          path: "projects/#{project_id}/iterations#{query_string}",
        )
        Array(self).from_json(response.body)
      end

      JSON.mapping(
        number: {type: Int32, nilable: true},
        project_id: {type: Int32, nilable: true},
        length: {type: Int32, nilable: true},
        team_strength: {type: Float32, nilable: true},
        stories: {type: Array(Story), default: Array(Story).new},
        start: {type: Time, converter: Converters::Time},
        finish: {type: Time, converter: Converters::Time},
      )
    end
  end
end
