module ShacoClient
  class Request
    include HTTParty

    # @!attribute [r] api_key
    # @return [String] api_key
    attr_reader :api_key

    # @!attribute [r] base_url
    # @return [String] base_url
    attr_reader :base_url

    # Initializes a new Request
    # @param api_key [String] the Riot Games API key
    # @return [Request]
    def initialize api_key, base_url
      @api_key = api_key
      @base_url = base_url
    end

    def api_url path, params={}
      url = File.join File.join(@base_url, api_base_path), path
      "#{url}?#{api_query_string params}"
    end

    def api_query_string params = {}
      URI.encode_www_form params.merge api_key: api_key
    end

    def api_base_path
      "/api/v1"
    end


    # Calls the API via HTTParty and handles errors
    # @param url [String] the url to call
    # @param verb [Symbol] HTTP verb to use. Defaults to :get
    # @param body [Hash] Body for POST request
    # @param options [Hash] Options passed to HTTParty
    # @return [String] raw response of the call
    def perform url, verb = :get, body = nil, options = {}
      options[:headers] ||= {}
      options[:headers].merge!({
        "Content-Type" => "application/json",
        "Accept"       => "application/json"
      })
      if [:post, :put].include?(verb)
        options[:body] = body.to_json if body
      end
      response = self.class.send(verb, url, options)
      if response.respond_to?(:code) && !(200...300).include?(response.code)
        raise NotFound.new("404 Not Found") if response.not_found?
        raise TooManyRequests.new('429 Rate limit exceeded') if response.code == 429
        raise InvalidAPIResponse.new(url, response)
      end

      if response.respond_to?(:parsed_response)
        response.parsed_response
      else
        response
      end
    end

  end
end
