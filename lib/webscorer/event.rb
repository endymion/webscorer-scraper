module Webscorer

  class Event
    attr_accessor :title, :date, :result_type, :url

    def initialize(
      title:nil,
      date:nil,
      result_type:nil,
      url:nil)
      @title = title
      @date = date
      @result_type = result_type
      @url = url
    end

    # How to tell if another Event object is equivalent?
    # For comparing events during testing.
    def ==(other)
      self.title  == other.title &&
      self.date == other.date &&
      self.result_type == other.result_type &&
      self.url == other.url
    end
  end

end
