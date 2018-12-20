module ShacoClient
  class WorkRequest < Request

    def list
      result = perform api_url("works")
    end

    def find id
      result = perform api_url("works/#{id}")
    end

    def claim id
      result = perform api_url("works/#{id}"), :patch, {id: id}
    end

  end
end
