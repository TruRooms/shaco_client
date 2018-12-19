module ShacoClient
  class WorkRequest < Request

    def list
      result = perform api_url("works")
    end

  end
end
