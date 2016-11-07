require "http/client"
require "json"
require "./resource/*"
require "./errors"

module Pivotal
  class Client
    HOST = "www.pivotaltracker.com"
    API_PATH = "/services/v5/"

    @@token = ""
    def self.token=(value : String) : String
      @@token = value
    end

    def self.token : String
      @@token
    end

    def self.auth(username, password : String) : String
      auth_connection = connection.dup
      auth_connection.basic_auth(username, password)
      response = fail_loudly!(auth_connection.get(API_PATH + "me"))
      me = Resource::Me.from_json(response.body)
      self.token = me.api_token
    end

    def self.request(method, path, headers = nil, body = nil) : HTTP::Client::Response
      full_path = build_path(path)
      # full_headers = headers ? default_headers : default_headers.merge!(headers)
      request = HTTP::Request.new(
        method: method,
        resource: full_path,
        headers: default_headers,
        body: body,
      )
      fail_loudly!(connection.exec(request))
    end

    private def self.build_path(path : String)
      API_PATH + path
    end

    private def self.connection
      @@connection ||= HTTP::Client.new(host: HOST, tls: true)
    end

    private def self.default_headers
      HTTP::Headers{
        "Content-Type" => "application/json",
        "X-TrackerToken" => token,
        "Host" => HOST,
      }
    end

    private def self.fail_loudly!(response)
      raise HTTPError.new(response) if response.status_code > 299
      response
    end
  end
end
