require "bundler/setup"
require "shaco_client"
require 'webmock/rspec'

SPEC_ROOT = __dir__

Dir[File.expand_path(File.join(File.dirname(__FILE__),'support','**','*.rb'))].each {|f| require f}

RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = ".rspec_status"

  # Disable RSpec exposing methods globally on `Module` and `main`
  config.disable_monkey_patching!

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end

  config.before(:each) do
    stub_request(:any, /shaco/).to_rack(FakeShaco)
  end
end

WebMock.disable_net_connect!(allow_localhost: true)
