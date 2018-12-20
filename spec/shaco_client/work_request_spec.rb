require "spec_helper"
require "shaco_client"

include ShacoClient

RSpec.describe WorkRequest do

  it "inherits from Request" do
    expect(described_class.ancestors[1]).to eq(Request)
  end

  context "Requests via API" do
    subject { WorkRequest.new('123', 'https://shaco.trurooms.com') }

    it "all the currently available work" do
      response = subject.list
      expect(response.first['id']).to eq 2674
    end

    it "a single work" do
      response = subject.find(2674)
      expect(response['id']).to eq 2674
    end

    it "claims a work" do
      response = subject.claim(2674)
      expect(response['id']).to eq 2674
    end

    it "submits a work" do
    end
    
  end

end
