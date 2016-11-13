require "json"

module Pivotal
  module Resource
    class Person
      def initialize
      end

      JSON.mapping(
        id: {type: Int32, nilable: true, default: -1},
        name: {type: String, nilable: true},
        email: {type: String, nilable: true},
        initials: {type: String, nilable: true},
        username: {type: String, nilable: true},
      )
    end
  end
end
