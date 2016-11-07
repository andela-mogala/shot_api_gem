require 'rest-client'
require 'json'

module ShotApiGem
  class Consumer
    attr_reader :header, :base_url

    def initialize(api_key)
      @header = { authorization: api_key }
      @base_url = 'http://turbo-url.herokuapp.com/api/v1/links'
      @local_base_url = 'http://localhost:3000/api/v1/links'
    end

    def fetch_all
      response = RestClient.get( base_url, header)
      json_response(response.body)[:links].map do |link|
        Link.new(link)
      end
    end

    def fetch(id)
      response = RestClient.get(base_url << "/#{id}", header)
      Link.new(json_response(response.body))
    end

    def create(options)
      response = RestClient.post(
                   base_url,
                   { url: options[:url], slug: options[:slug] },
                   header
                 )
      Link.new(json_response(response.body))
    end

    def update(id, options)
      response = RestClent.patch(
          base_url << "/#{id}",
          { url: options[:url], slug: options[:slug], active: option[:active] },
          header
        )
      Link.new(json_response(response.body))
    end

    def delete(id)
      response = RestClient.delete(base_url << "/#{id}", header)
      response.code
    end

    private

    def json_response(body)
      JSON.parse(body, symbolize_names: true)
    end
  end
end