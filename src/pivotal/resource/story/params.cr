require "./type"
require "./state"

module Pivotal
  module Resource
    class Story
      struct Params
        def initialize(
          @with_label : String? = nil,
          @with_story_type : Type? = nil,
          @with_state : State? = nil,
          @after_story_id : Int32? = nil,
          @before_story_id : Int32? = nil,
          @accepted_before : Time? = nil,
          @accepted_after : Time? = nil,
          @created_before : Time? = nil,
          @created_after : Time? = nil,
          @updated_before : Time? = nil,
          @updated_after : Time? = nil,
          @deadline_before : Time? = nil,
          @deadline_after : Time? = nil,
          @limit : Int32? = nil,
          @offset : Int32? = nil,
          @filter : String? = nil,
        )
        end

        def to_s
          return "?filter=#{filter}" if filter
          build_query_string
        end

        private def build_query_string
          query_hash.reduce("?") do |query_string, (key, value)|
            next query_string if value.nil? || value == ""
            value = isotime(value) if value.is_a?(Time)
            "#{query_string}#{key}=#{value}&"
          end.chomp("&")
        end

        private getter :filter

        private def query_hash
          {
            "with_label" => @with_label,
            "with_story_type" => @with_story_type.to_s.underscore,
            "with_state" => @with_state.to_s.underscore,
            "after_story_id" => @after_story_id,
            "before_story_id" => @before_story_id,
            "accepted_before" => @accepted_before,
            "accepted_after" => @accepted_after,
            "created_before" => @created_before,
            "created_after" => @created_after,
            "updated_before" => @updated_before,
            "updated_after" => @updated_after,
            "deadline_before" => @deadline_before,
            "deadline_after" => @deadline_after,
            "limit" => @limit,
            "offset" => @offset
          }
        end

        private def isotime(time)
          time.to_s("%Y-%m-%dT%TZ")
        end
      end
    end
  end
end
