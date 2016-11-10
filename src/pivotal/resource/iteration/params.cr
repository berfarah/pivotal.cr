module Pivotal
  module Resource
    class Iteration
      struct Params
        def initialize(
          @limit : Int32? = nil,
          @offset : Int32? = nil,
          @label : String? = nil,
          @scope : State? = nil,
        )
        end

        def to_s
          build_query_string
        end

        private def build_query_string
          query_hash.reduce("?") do |query_string, (key, value)|
            next query_string if value.nil?
            "#{query_string}#{key}=#{value}&"
          end.chomp("&")
        end

        private def query_hash
          {
            "limit" => @limit,
            "offset" => @offset,
            "label" => @label,
            "scope" => @scope.to_s.underscore,
          }
        end
      end
    end
  end
end
