RSpec.describe Webscorer::Scraper do
  it "has a version number" do
    expect(Webscorer::VERSION).not_to be nil
  end

  describe Webscorer::Scraper do
    before(:each) do
      @webscorer = Webscorer::Scraper.new('takethebridgerun')
    end

    it "has an organizer_name context" do
      expect(@webscorer.organizer_name).to eq('takethebridgerun')
    end

    it "can generate a URL for the organizer's page" do
      webscorer = Webscorer::Scraper.new('takethebridgerun')
      expect(@webscorer.organizer_URL).to eq('https://www.webscorer.com/takethebridgerun')
    end

    it "can itemize the list of events for the current organizer" do
      stub_request(:get, "https://www.webscorer.com/takethebridgerun").
        to_return(body: File.new('spec/http_responses/organizer_page.txt'), status: 200)

        expect(@webscorer.organizer_page).to include('Take The Bridge')
    end
  end
end
