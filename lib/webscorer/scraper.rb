require "webscorer/version"

module Webscorer
  class Scraper
    attr_accessor :organizer_name

    def initialize(organizer_name)
      @organizer_name = organizer_name
    end
  end
end
