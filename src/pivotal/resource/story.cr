require "json"

module Pivotal
  module Resource
    class Story
      enum Type
        Feature
        Bug
        Chore
        Release
      end

      enum State
        Planned
        Unscheduled
        Unstarted
        Started
        Finished
        Rejected
        Delivered
        Accepted
      end

      def self.find(id : Int16, project_id)
        response = Client.request(
          method: "GET", path: "projects/#{project_id}/stories/#{id}",
        )
        self.from_json(response.body)
      end

      def self.all(project_id : Int16)
        response = Client.request(
          method: "GET",
          path: "/projects/#{project_id}/stories",)
        Array(self).from_json(response.body)
      end

      def get
        self.class.find(id)
      end

      def comments
      end

      def followers
      end

      def tasks
      end

      JSON.mapping(
        id: {type: Int16 | Int32, default: -1},
        name: {type: String, nilable: true},
        description: {type: String, nilable: true},
        story_type: {type: Type, default: Type::Feature},
        current_state: {type: State, default: State::Unstarted},
        estimate: {type: Int16 | Int32, nilable: true},
        accepted_at: {type: Time, converter: Converters::Time, nilable: true, emit_null: true},
        deadline: {type: Time, converter: Converters::Time, nilable: true},
        requested_by_id: {type: Int16 | Int32, nilable: true},
        owner_ids: {type: Array(Int16 | Int32), default: Array(Int16 | Int32).new},
        # label_ids: {type: Array(Int16 | Int32), default: Array(Int16 | Int32).new},
        created_at: {type: Time, converter: Converters::Time},
        updated_at: {type: Time, converter: Converters::Time},
        url: {type: String, nilablue: true},
      )
    end
  end
end
