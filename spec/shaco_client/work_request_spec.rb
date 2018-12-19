require "spec_helper"
require "shaco_client"

include ShacoClient

RSpec.describe WorkRequest do

  it "inherits from Request" do
    expect(described_class.ancestors[1]).to eq(Request)
  end

end
