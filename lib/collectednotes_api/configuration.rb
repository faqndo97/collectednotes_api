# frozen_string_literal: true

module CollectednotesApi
  class Configuration
    attr_accessor :email, :token
    attr_reader :api_base

    def initialize
      @api_base = 'https://collectednotes.com'
      @email    = nil
      @token    = nil
    end
  end
end
