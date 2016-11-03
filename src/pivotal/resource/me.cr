require "json"

module Pivotal
  module Resource
    class Me
      def self.get
        response = Client.request(
          method: "GET",
          path: "me",
        )
        self.from_json(response.body)
      end

      JSON.mapping(
        api_token: {type: String},
        email: {type: String},
        id: {type: Int16},
        initials: {type: String},
        name: {type: String, nilable: true},
        username: {type: String},
      )
    end
  end
end
