module ShacoClient

  class Client

    # @!attribute [rw] api_key
    # @return [String] api key currently in use.
    attr_accessor :api_key

    # @!attribute [rw] base_url
    # @return [Boolean] Base URL of the server to use for requests
    attr_accessor :base_url

    # Initializes a ShacoClient::Client
    # @param options [Hash]
    # @option options [String] :base_url ("https://shaco.trurooms.com") Base URL for API requests
    def initialize api_key, options = {}
      @api_key = api_key
      @development = options.delete(:base_url) || "https://shaco.trurooms.com"
    end

    def work
      @work_request ||= WorkRequest.new(api_key, base_url)
    end

  end

end
