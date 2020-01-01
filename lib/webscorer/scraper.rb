require 'nokogiri'
require 'uri'
require 'chronic'

module Webscorer
  class Scraper
    attr_accessor :organizer_name

    def initialize(organizer_name)
      @organizer_name = organizer_name
    end

    def organizer_URL
      'https://www.webscorer.com/' + @organizer_name
    end

    def organizer_page
      Net::HTTP.get(URI(organizer_URL))
    end

    def events
      doc = Nokogiri::HTML(organizer_page)

      events = []
      doc.css('#MyPostedRacesGrid tr').each do |event_row|
        next if event_row.css('td').count.zero? # The <th> row.

        events << Webscorer::Event.new(
          title: event_row.css('td:nth-child(2) a').text.strip,
          date: Chronic.parse(event_row.css('td:nth-child(3) span').text.strip),
          url: URI::join(
            'https://www.webscorer.com',
            event_row.css('td:nth-child(2) a')[0]['href'].strip),
          result_type: event_row.css('td:nth-child(2) span.racetype').text.strip)
      end

      events
    end
  end
end
