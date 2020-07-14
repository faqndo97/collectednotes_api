# frozen_string_literal: true

require 'rest-client'
require 'base64'

module CollectednotesApi
  # A class that can be instantiated for access to all modules on CollectednotesApi Gem.
  #
  # Example of initialization:
  #
  #   CollectednotesApi::Client.new
  #
  # This will set up all necessary things like main_resource, that is the api base, with the general headers like
  # content_type and accept.
  #
  # After you have a Client instance, you can start to use the {} methods.
  class Client
    # Create a new instance of Client.
    def initialize
      @email          = CollectednotesApi.configuration.email
      @token          = CollectednotesApi.configuration.token
      @main_resource  = RestClient::Resource.new(CollectednotesApi.configuration.api_base,
                                                 headers: { content_type: :json, accept: :json })
    end

    # Execute RestClient get request to main resource (api_base configured on your repo) on path url.
    #
    # @param path [String] path on main resource to execute request
    # @param params [Symbol Hash] query params.
    #
    # @return [String Hash] response of get request execution.
    def get(path, params = {})
      parse_response(main_resource[path].get(params: params))
    end

    # Execute RestClient post request to main resource (api_base configured on your repo) on path url.
    #
    # @param path [String] path on main resource to execute get request
    # @param payload [Symbol Hash] request body to send.
    #
    # @return [String Hash] response of post request execution.
    def post(path, payload = {})
      parse_response(main_resource[path].post(payload.to_json))
    end

    # Execute RestClient put request to main resource (api_base configured on your repo) on path url.
    #
    # @param path [String] path on main resource to execute get request
    # @param payload [Symbol Hash] request body to send.
    #
    # @return [String Hash] response of post request execution.
    def put(path, payload = {})
      parse_response(main_resource[path].put(payload.to_json))
    end

    # Execute RestClient post request to main resource (api_base configured on your repo) on path url.
    #
    # @param path [String] path on main resource to execute get request
    #
    # @return [String Hash] response of post request execution.
    def delete(path)
      parse_response(main_resource[path].delete)
    end

    private

    attr_reader :client_id, :client_secret, :main_resource

    def parse_response(response = nil)
      return if response.nil?
      return {} if response.code == 204 # NO CONTENT CODE

      JSON.parse response
    end
  end
end
