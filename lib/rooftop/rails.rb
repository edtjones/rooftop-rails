require 'rooftop'

require "rooftop/rails/engine"
require "rooftop/rails/development_constraint"
require "rooftop/rails/preview"

module Rooftop
  module Rails
    class << self
      attr_accessor :configuration
    end

    def self.configure
      self.configuration ||= Configuration.new
      yield(configuration)
    end

    class Configuration
      attr_accessor :api_token,
                    :site_name,
                    :advanced_options,
                    :url,
                    :api_path,
                    :extra_headers,
                    :authenticate_webhooks,
                    :webhooks_username,
                    :webhooks_password,
                    :perform_caching,
                    :preview_username,
                    :preview_password,
                    :preview_domain,
                    :enable_preview_domain

      def initialize
        @authenticate_webhooks = true
        @perform_caching = ::Rails.configuration.action_controller.perform_caching
      end
    end
  end
end