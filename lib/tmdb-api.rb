require "httparty"
require "json"

require "tmdb-api/fetcher"
require "tmdb-api/searchable"
require "tmdb-api/movie"
require "tmdb-api/changes"
require "tmdb-api/version"

module TMDb
  class << self
    # Set the API Key that will be use to fetch the data.
    attr_accessor :api_key

    # Set the default language of the fetched data.
    attr_accessor :default_language
  end
end