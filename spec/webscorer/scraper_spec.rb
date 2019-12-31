RSpec.describe Webscorer::Scraper do
  it "has a version number" do
    expect(Webscorer::VERSION).not_to be nil
  end

  describe Webscorer::Scraper do
    it "has an organizer_name context" do
      webscorer = Webscorer::Scraper.new('takethebridgerun')
      expect(webscorer.organizer_name).to eq('takethebridgerun')
    end
  end
end
