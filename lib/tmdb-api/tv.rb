module TMDb
  class Tv < Base
    extend Searchable

    ATTRIBUTES = :id, :backdrop_path, :name, :number_of_episodes, :number_of_seasons,
      :genres, :homepage, :imdb_id, :original_name, :overview, :popularity, :in_production,
      :poster_path, :production_companies, :seasons, :first_air_date, :last_air_date, :original_language, 
      :status, :type, :vote_average, :vote_count

    attr_reader *ATTRIBUTES

    # Public: Get the basic tv information for a specific tv ID.
    #
    # id      - The ID of the tv.
    # options - The hash options used to filter the search (default: {}):
    #           :language - Language of the result data (ISO 639-1 codes)
    #                       (default: en).
    #
    # Examples
    #
    #   TMDb::TV.find(68721)
    #   TMDb::TV.find(68721, language: 'pt')
    def self.find(id, options = {})
      res = get("/tv/#{id}", query: options)
      res.success? ? TV.new(res) : bad_response(res)
    end

    # Public: Get the alternative titles for a specific movie ID.
    #
    # options - The hash options used to filter the search (default: {}):
    #           :country - Titles for a specific country (ISO 3166-1 code).
    #
    # Examples
    #
    #   TMDb::TV.alternative_titles(68721, country: 'br')
    def self.alternative_titles(id, options = {})
      res = get("/tv/#{id}/alternative_titles", query: options)
      res.success? ? res['titles'] : bad_response(res)
    end

    # Public: Get the cast for a specific movie ID.
    #
    # options - The hash options used to filter the search (default: {}):
    #           :language - Images of a specific language (ISO 639-1 code).
    #
    # Examples
    #
    #   TMDb::TV.cast(68721, language: pt)
    def self.cast(id, options = {})
      res = get("/tv/#{id}/credits", query: options)
      res.success? ? res['cast'] : bad_response(res)
    end

    # Public: Get the crew for a specific movie ID.
    #
    # options - The hash options used to filter the search (default: {}):
    #           :language - Images of a specific language (ISO 639-1 code).
    #
    # Examples
    #
    #   TMDb::TV.crew(68721, language: pt)
    def self.crew(id, options = {})
      res = get("/movie/#{id}/credits", query: options)
      res.success? ? res['crew'] : bad_response(res)
    end

    # Public: Get the images (posters and backdrops) for a specific movie ID.
    #
    # options - The hash options used to filter the search (default: {}):
    #           :language - Images of a specific language (ISO 639-1 code).
    #
    # Examples
    #
    #   TMDb::TV.find(68721).images
    #   TMDb::TV.images(68721, language: 'pt')
    def self.images(id, options = {})
      res = get("/tv/#{id}/images", query: options)
      res.success? ? res : bad_response(res)
    end

    # Public: Get the plot keywords for a specific tv ID.
    #
    # options - The hash options used to filter the search (default: {}):
    #           :language - Images of a specific language (ISO 639-1 code).
    #
    # Examples
    #
    #   TMDb::TV.keywords(68721, language: pt)
    def self.keywords(id, options = {})
      res = get("/tv/#{id}/keywords", query: options)
      res.success? ? res['keywords'] : bad_response(res)
    end

  end
end
