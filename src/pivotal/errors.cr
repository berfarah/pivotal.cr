require "json"

module Pivotal
  class Error < ::Exception; end

  class HTTPError < Error
    def initialize(@response : HTTP::Client::Response); end

    getter! :response

    def message
      msg = Message.from_json(response.body).to_s
      "#{response.status_code} #{response.status_message}: #{msg}"
    end

    struct Message
      def to_s
        "#{error} #{general_problem}"
      end

      JSON.mapping(
        code: {type: String, nilable: true},
        error: {type: String, nilable: true},
        general_problem: {type: String, nilable: true, emit_null: true},
      )
    end
  end
end
