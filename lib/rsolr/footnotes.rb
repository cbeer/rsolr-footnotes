require 'rsolr'
require 'rails-footnotes'
require 'rails-footnotes/abstract_note'
require 'active_support/notifications'

module Rsolr
  module Footnotes
    # Load the plugin and footnote pane
    def self.load!
      require 'footnotes/notes/rsolr_requests_note'
      setup_rsolr_notifications!
    end

    # Inject notifications into RSolr
    def self.setup_rsolr_notifications!
      require 'rsolr/footnotes/notifications'
      RSolr::Client.send(:include, Rsolr::Footnotes::Notifications)
      RSolr::Client.enable_notifications!
    end

    require 'rsolr/footnotes/railtie' if defined?(Rails)
  end
end
