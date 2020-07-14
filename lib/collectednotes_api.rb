# frozen_string_literal: true

require_relative 'collectednotes_api/configuration'
require_relative 'collectednotes_api/version'

module CollectednotesApi
  class << self
    def configuration
      @configuration ||= Configuration.new
    end

    def configure
      yield(configuration)
    end
  end
end
