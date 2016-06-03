require 'rsolr/footnotes'
require 'rails'

module RsolrFootnotes
  class Railtie < Rails::Railtie
    Rsolr::Footnotes.load!
    Footnotes::Filter.notes += [:rsolr_requests]
  end
end
