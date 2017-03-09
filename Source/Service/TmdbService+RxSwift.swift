//
//  RxTmdbService.swift
//  MyFavoriteMovies
//
//  Created by Kamil Swojak on 18/01/2017.
//  Copyright © 2017 Kamil Swojak. All rights reserved.
//

import Foundation
import RxSwift

extension TmdbService{
    
    //MARK: Account
    
    /// Get your account details.
    public func getAccountDetails() -> Observable<TmdbGetAccountDetailsResponse>{
        let path = "account"
        
        var queries: [String : Any] = [:]
        if let sessionId = Tmdb.shared.auth.sessionId.value { queries[TmdbKey.session_id] = sessionId }
        
        return requestJson(path: path, queries: queries)
    }
    
    /// Get all of the lists created by an account. Will invlude private lists if you are the owner.
    public func getCreatedLists(accountId: Int, page: Int! = 1) -> Observable<TmdbGetCreatedListsResponse> {
        let path = "/account/\(accountId)/lists"
        
        var queries: [String : Any] = [:]
        queries[TmdbKey.language] = language
        if let sessionId = Tmdb.shared.auth.sessionId.value { queries[TmdbKey.session_id] = sessionId }
        queries[TmdbKey.page] = page
        
        return requestJson(path: path, queries: queries)
    }
    
    /// Get the list of your favorite movies.
    public func getFavoriteMovies(accountId: Int, page: Int! = 1, sortBy: TmdbSort? = .CreatedAtAscending) -> Observable<TmdbGetFavoriteMoviesResponse>{
        let path = "/account/\(accountId)/favorite/movies"
        
        var queries: [String : Any] = [:]
        queries[TmdbKey.language] = language
        if let sessionId = Tmdb.shared.auth.sessionId.value { queries[TmdbKey.session_id] = sessionId }
        queries[TmdbKey.page] = page
        queries[TmdbKey.sortBy] = sortBy!.rawValue
        
        return requestJson(path: path, queries: queries)
    }
    
    /// Get the list of your favorite TV shows.
    public func getFavoriteTVShows(accountId: Int, page: Int! = 1, sortBy: TmdbSort? = .CreatedAtAscending) -> Observable<TmdbGetFavoriteTVShowsResponse>{
        let path = "/account/\(accountId)/favorite/tv"
        
        var queries: [String : Any] = [:]
        queries[TmdbKey.language] = language
        if let sessionId = Tmdb.shared.auth.sessionId.value { queries[TmdbKey.session_id] = sessionId }
        queries[TmdbKey.page] = page
        queries[TmdbKey.sortBy] = sortBy!.rawValue
        
        return requestJson(path: path, queries: queries)
    }
    
    /// This method allows you to mark a movie or TV show as a favorite item.
    public func markAsFavorite(mediaType: TmdbMediaType, mediaId: Int, favorite: Bool, accountId: Int) -> Observable<TmdbResponse>{
        let path = "/account/\(accountId)/favorite"
        
        let body = MarkAsFavoriteBody(mediaType: mediaType.rawValue, mediaId: mediaId, favorite: favorite)
        
        var queries: [String : Any] = [:]
        if let sessionId = Tmdb.shared.auth.sessionId.value { queries[TmdbKey.session_id] = sessionId }
        
        return postJson(path: path, queries: queries, body: body)
    }
    
    /// Get a list of all the movies you have rated.
    public func getRatedMovies(accountId: Int, page: Int! = 1, sortBy: TmdbSort? = .CreatedAtAscending) -> Observable<TmdbGetRatedMoviesResponse> {
        let path = "/account/\(accountId)/rated/movies"
        
        var queries: [String : Any] = [:]
        queries[TmdbKey.language] = language
        queries[TmdbKey.page] = page
        queries[TmdbKey.sortBy] = sortBy!.rawValue
        if let sessionId = Tmdb.shared.auth.sessionId.value { queries[TmdbKey.session_id] = sessionId }
        
        return requestJson(path: path, queries: queries)
    }
    
    /// Get a list of all the TV shows you have rated.
    public func getRatedTVShows(accountId: Int, page: Int! = 1, sortBy: TmdbSort? = .CreatedAtAscending) -> Observable<TmdbGetRatedTVShowsResponse> {
        let path = "/account/\(accountId)/rated/tv"
        
        var queries: [String : Any] = [:]
        queries[TmdbKey.language] = language
        queries[TmdbKey.page] = page
        queries[TmdbKey.sortBy] = sortBy!.rawValue
        if let sessionId = Tmdb.shared.auth.sessionId.value { queries[TmdbKey.session_id] = sessionId }
        
        return requestJson(path: path, queries: queries)
    }
    
    /// Get a list of all the TV episodes you have rated.
    public func getRatedTVEpisodes(accountId: Int, page: Int! = 1, sortBy: TmdbSort? = .CreatedAtAscending) -> Observable<TmdbGetRatedTVEpisodesResponse>{
        let path = "/account/\(accountId)/rated/tv/episodes"
        
        var queries: [String : Any] = [:]
        queries[TmdbKey.language] = language
        queries[TmdbKey.page] = page
        queries[TmdbKey.sortBy] = sortBy!.rawValue
        if let sessionId = Tmdb.shared.auth.sessionId.value { queries[TmdbKey.session_id] = sessionId }
        
        return requestJson(path: path, queries: queries)
    }
    
    /// Get a list of all the movies you have added to your watchlist.
    public func getMovieWatchlist(accountId: Int, page: Int! = 1, sortBy: TmdbSort? = .CreatedAtAscending) -> Observable<TmdbGetMovieWatchlistResponse> {
        let path = "/account/\(accountId)/watchlist/movies"
        
        var queries: [String : Any] = [:]
        queries[TmdbKey.language] = language
        queries[TmdbKey.page] = page
        queries[TmdbKey.sortBy] = sortBy!.rawValue
        if let sessionId = Tmdb.shared.auth.sessionId.value { queries[TmdbKey.session_id] = sessionId }
        
        return requestJson(path: path, queries: queries)
    }
    
    /// Get a list of all the TV shows you have added to your watchlist.
    public func getTVShowWatchlist(accountId: Int, page: Int! = 1, sortBy: TmdbSort? = .CreatedAtAscending) -> Observable<TmdbGetTVShowsWatchlistResponse> {
        let path = "/account/\(accountId)/watchlist/tv"
        
        var queries: [String : Any] = [:]
        queries[TmdbKey.language] = language
        queries[TmdbKey.page] = page
        queries[TmdbKey.sortBy] = sortBy!.rawValue
        if let sessionId = Tmdb.shared.auth.sessionId.value { queries[TmdbKey.session_id] = sessionId }
        
        return requestJson(path: path, queries: queries)
    }
    
    /// Add a movie or TV show to your watchlist.
    public func addToWatchlist(mediaType: TmdbMediaType, mediaId: Int, watchlist: Bool, accountId: Int) -> Observable<TmdbResponse> {
        let path = "/account/\(accountId)/watchlist"
        
        let body = AddToWatchlistBody(mediaType: mediaType.rawValue, mediaId: mediaId, watchlist: watchlist)
        
        var queries: [String : Any] = [:]
        if let sessionId = Tmdb.shared.auth.sessionId.value { queries[TmdbKey.session_id] = sessionId }
        
        return postJson(path: path, queries: queries, body: body)
    }
    
    
    //MARK: Authentication
    
    //    public func signIn(username: String, password: String) -> Observable<TmdbAuthState> {
    //        return createRequestToken()
    //                .validateRequestToken(username: username, password: password)
    //                .createSession()
    //            .map {
    //
    //        }
    //    }
    //
    /// Create a temporary request token that can be used to validate a TMDb user login. More details about how this works can be found https://developers.themoviedb.org/3/authentication/how-do-i-generate-a-session-id.
    public func createRequestToken() -> Observable<TmdbCreateRequestTokenResponse> {
        let path = "/authentication/token/new"
        return requestJson(path: path)
    }
    
    /// This method allows an application to validate a request token by entering a username and password.  More details about how this works can be found https://developers.themoviedb.org/3/authentication/how-do-i-generate-a-session-id.
    public func validateRequestToken(username: String, password: String, requestToken: String) -> Observable<TmdbValidateRequestTokenResponse> {
        let path = "/authentication/token/validate_with_login"
        
        var queries: [String : Any] = [:]
        queries[TmdbKey.username] = username
        queries[TmdbKey.password] = password
        queries[TmdbKey.request_token] = requestToken
        
        return requestJson(path: path, queries: queries)
    }
    
    /// You can use this method to create a fully valid session ID once a user has validated the request token. More information about how this works can be found here https://developers.themoviedb.org/3/authentication/how-do-i-generate-a-session-id.
    public func createSession(validatedRequestToken: String) -> Observable<TmdbCreateSessionResponse> {
        let path = "/authentication/session/new"
        
        var queries: [String : Any] = [:]
        queries[TmdbKey.request_token] = validatedRequestToken
        
        return requestJson(path: path, queries: queries)
    }
    
    
    //Mark: Companies
    
    /// Get a companies details by id.
    public func getCompanyDetails(companyId: Int) -> Observable<TmdbGetCompanyDetailsResponse> {
        let path = "/company/\(companyId)"
        return requestJson(path: path)
    }
    
    /// Get the movies of a company by id.
    public func getMoviesByCompany(companyId: Int, page: Int! = 1) -> Observable<TmdbGetMoviesByCompanyResponse> {
        let path = "/company/\(companyId)/movies"
        
        var queries: [String : Any] = [:]
        queries[TmdbKey.page] = page
        
        return requestJson(path: path, queries: queries)
    }
    
    
    //MARK: Certifications
    
    public func getMoviesCertifications() -> Observable<TmdbGetCertificationsResponse> {
        let path = "/certification/movie/list"
        return requestJson(path: path)
    }
    
    public func getTVShowsCertification() -> Observable<TmdbGetCertificationsResponse> {
        let path = "/certification/tv/list"
        return requestJson(path: path)
    }
    
    
    //MARK: Collections
    
    public func getCollectionDetails(collectionId: Int) -> Observable<TmdbCollection> {
        let path = "/collection/\(collectionId)"
        return requestJson(path: path)
    }
    
    
    //MARK: Configuration
    
    /// Get the system wide configuration information. Some elements of the API require some knowledge of this configuration data. The purpose of this is to try and keep the actual API responses as light as possible. It is recommended you cache this data within your application and check for updates every few days. This method currently holds the data relevant to building image URLs as well as the change key map. To build an image URL, you will need 3 pieces of data. The base_url, size and file_path. Simply combine them all and you will have a fully qualified URL. Here’s an example URL: https://image.tmdb.org/t/p/w500/8uO0gUM8aNqYLs1OsTBQiXu0fEv.jpg The configuration method also contains the list of change keys which can be useful if you are building an app that consumes data from the change feed.
    public func getConfiguration() -> Observable<TmdbGetConfigurationResponse> {
        let path = "configuration"
        return requestJson(path: path)
    }
    
    
    //MARK: Credits
    
    /// Get a movie or TV credit details by id.
    public func getCreditDetails(creditId: String) -> Observable<TmdbGetCreditDetailsResponse> {
        let path = "/credit/\(creditId)"
        return requestJson(path: path)
    }
    
    
    //MARK: Discover
    
    /// Discover movies by different types of data like average rating, number of votes, genres and certifications. You can get a valid list of certifications from the /certifications method. Discover also supports a nice list of sort options. See below for all of the available options. Please note, when using certification \ certification.lte you must also specify certification_country. These two parameters work together in order to filter the results. You can only filter results with the countries we have added to our certifications list. If you specify the region parameter, the regional release date will be used instead of the primary release date. The date returned will be the first date based on your query (ie. if a with_release_type is specified). It's important to note the order of the release types that are used. Specifying "2|3" would return the limited theatrical release date as opposed to "3|2" which would return the theatrical date.
    public func discoverMovies(queries: TmdbMovieDiscoverQueries?, page: Int! = 1) -> Observable<TmdbDiscoverMovieResponse>{
        let path = "/discover/movie"
        
        guard let queries = queries else {
            return requestJson(path: path)
        }
        queries.language = language
        
        return requestJson(path: path, queries: (queries as TmdbDiscoverQuery).mapQueries())
    }
    
    /// Discover TV shows by different types of data like average rating, number of votes, genres, the network they aired on and air dates.
    public func discoverTVShows(queries: TmdbTvShowsDiscoverQueries?, page: Int! = 1) -> Observable<TmdbDiscoverTVShowsResponse> {
        let path = "/discover/tv"
        
        guard let queries = queries else {
            return requestJson(path: path)
        }
        queries.language = language
        
        return requestJson(path: path, queries: (queries as TmdbDiscoverQuery).mapQueries())
    }
    
    
    //MARK: Genres
    
    /// Get the list of official genres for movies.
    public func getMovieGenres() -> Observable<TmdbGetMovieGenresResponse> {
        let path = "/genre/movie/list"
        
        var queries: [String : Any] = [:]
        queries[TmdbKey.language] = language
        
        return requestJson(path: path, queries: queries)
    }
    
    /// Get the list of official genres for TV shows.
    public func getTVShowsGenres() -> Observable<TmdbGetTVGenresResponse> {
        let path = "/genre/tv/list"
        
        var queries: [String : Any] = [:]
        queries[TmdbKey.language] = language
        
        return requestJson(path: path, queries: queries)
    }
    
    /// Get a list of movies by genre id. We highly recommend using movie discover instead of this method as it is much more flexible.
    ///
    /// - Parameters:
    ///   - includeAdult: Choose whether to inlcude adult (pornography) content in the results.
    ///     - default: false
    ///   - sortBy: Sort the results.
    public func getMoviesByGenre(genreId: TmdbMovieGenre, page: Int! = 1, includeAdult: Bool! = false, sortBy: TmdbSort! = .CreatedAtAscending) -> Observable<TmdbGetMoviesByGenreResponse>{
        let path = "/genre/\(genreId.rawValue)/movies"
        
        var queries: [String : Any] = [:]
        queries[TmdbKey.language] = language
        queries[TmdbKey.sortBy] = sortBy.rawValue
        queries[TmdbKey.include_adult] = includeAdult
        queries[TmdbKey.page] = page
        
        return requestJson(path: path, queries: queries)
    }
    
    
    //MARK: Keywords
    
    public func getKeywordDetails(keywordId: Int) -> Observable<TmdbKeyword> {
        let path = "/keyword/\(keywordId)"
        return requestJson(path: path)
    }
    
    /// Get the movies that belong to a keyword.
    public func getMoviesByKeyword(keywordId: Int, page: Int! = 1, adult: Bool? = false) -> Observable<TmdbGetMoviesByKeywordResponse> {
        let path = "/keyword/\(keywordId)/movies"
        
        var queries: [String : Any] = [:]
        queries[TmdbKey.language] = language
        
        return requestJson(path: path, queries: queries)
    }
    
    
    //MARK: Movies
    
    /// Get the primary information about a movie.
    public func getMovieDetails(movieId: Int) -> Observable<TmdbMovie> {
        let path = "/movie/\(movieId)"
        
        var queries: [String : Any] = [:]
        queries[TmdbKey.language] = language
        
        return requestJson(path: path, queries: queries)
    }
    
    
    /// Grab the following account states for a session:
    /// - Movie rating
    /// - If it belongs to your watchlist
    /// - If it belongs to your favourite list
    public func getMovieAccountStates(movieId: Int) -> Observable<TmdbGetAccountStatesResponse> {
        let path = "/movie/\(movieId)/account_states"
        
        var queries: [String : Any] = [:]
        queries[TmdbKey.language] = language
        if let sessionId = Tmdb.shared.auth.sessionId.value { queries[TmdbKey.session_id] = sessionId }
        
        return requestJson(path: path, queries: queries)
    }
    
    /// Get all of the alternative titles for a movie.
    public func getMovieAlternativeTitles(movieId: Int, country: String?) -> Observable<TmdbGetMovieAlternativeTitlesResponse> {
        let path = "/movie/\(movieId)/alternative_titles"
        
        guard let country = country else {
            return requestJson(path: path)
        }
        
        var queries: [String : Any] = [:]
        queries[TmdbKey.country] = country
        
        return requestJson(path: path, queries: queries)
    }
    
    /// Get the cast and crew for a movie.
    public func getMovieCredits(movieId: Int) -> Observable<TmdbGetMovieCreditsResponse>{
        let path = "/movie/\(movieId)/credits"
        return requestJson(path: path)
    }
    
    /// Get the images that belong to a movie. Querying images with a language parameter will filter the results. If you want to include a fallback language (especially useful for backdrops) you can use the include_image_language parameter. This should be a comma seperated value like so: include_image_language=en,null.
    public func getMovieImages(movieId: Int, includeImageLanguage: String? = nil) -> Observable<TmdbGetMovieImagesResponse> {
        let path = "/movie/\(movieId)/images"
        
        var queries: [String : Any] = [:]
        queries[TmdbKey.language] = language
        if let includeImageLanguage = includeImageLanguage {
            queries[TmdbKey.include_image_language] = includeImageLanguage
        }
        
        return requestJson(path: path, queries: queries)
    }
    
    /// Get the keywords that have been added to a movie.
    public func getMovieKeywords(movieId: Int) -> Observable<TmdbGetMovieKeywordsResponse> {
        let path = "/movie/\(movieId)/keywords"
        return requestJson(path: path)
    }
    
    /// Get the release date along with the certification for a movie.
    public func getMovieReleaseDates(movieId: Int) -> Observable<TmdbGetMovieReleaseDatesResponse> {
        let path = "/movie/\(movieId)/release_dates"
        return requestJson(path: path)
    }
    
    /// Get the videos that have been added to a movie.
    public func getMovieVideos(movieId: Int) -> Observable<TmdbGetMovieVideosResponse> {
        let path = "/movie/\(movieId)/videos"
        
        var queries: [String : Any] = [:]
        queries[TmdbKey.language] = language
        
        return requestJson(path: path, queries: queries)
    }
    
    /// Get a list of translations that have been created for a movie.
    public func getMovieTranslations(movieId: Int) -> Observable<TmdbGetMovieTranslationsResponse> {
        let path = "/movie/\(movieId)/translations"
        return requestJson(path: path)
    }
    
    /// Get a list of recommended movies for a movie.
    public func getMovieRecomendations(movieId: Int, page: Int! = 1) -> Observable<TmdbGetMovieRecommendationsResponse> {
        let path = "/movie/\(movieId)/recommendations"
        
        var queries: [String : Any] = [:]
        queries[TmdbKey.language] = language
        queries[TmdbKey.page] = page
        
        return requestJson(path: path, queries: queries)
    }
    
    /// Get a list of similar movies. This is not the same as the "Recommendation" system you see on the website. These items are assembled by looking at keywords and genres.
    public func getSimilarMovies(movieId: Int, page: Int! = 1) -> Observable<TmdbGetSimilarMoviesResponse> {
        let path = "/movie/\(movieId)/similar"
        
        var queries: [String : Any] = [:]
        queries[TmdbKey.language] = language
        queries[TmdbKey.page] = page
        
        return requestJson(path: path, queries: queries)
    }
    
    /// Get the user reviews for a movie.
    public func getMovieReviews(movieId: Int, page: Int! = 1) -> Observable<TmdbGetMovieReviewsResponse> {
        let path = "/movie/\(movieId)/reviews"
        
        var queries: [String : Any] = [:]
        queries[TmdbKey.language] = language
        queries[TmdbKey.page] = page
        
        return requestJson(path: path, queries: queries)
    }
    
    /// Get a list of lists that this movie belongs to.
    public func getMovieLists(movieId: Int, page: Int! = 1) -> Observable<TmdbGetMovieListsResponse> {
        let path = "/movie/\(movieId)/lists"
        
        var queries: [String : Any] = [:]
        queries[TmdbKey.language] = language
        queries[TmdbKey.page] = page
        
        return requestJson(path: path, queries: queries)
    }
    
    /// Rate a movie.
    public func rateMovie(movieId: Int, value: TmdbRatingScale) -> Observable<TmdbResponse> {
        let body = PostRateMovieBody(value: value)
        let path = "/movie/\(movieId)/rating"
        
        var queries: [String : Any] = [:]
        if let sessionId = Tmdb.shared.auth.sessionId.value { queries[TmdbKey.session_id] = sessionId }
        
        return postJson(path: path, queries: queries, body: body)
    }
    
    /// Remove your rating for a movie.
    public func deleteRating(movieId: Int) -> Observable<TmdbResponse> {
        let path = "/movie/\(movieId)/rating"
        
        var queries: [String : Any] = [:]
        if let sessionId = Tmdb.shared.auth.sessionId.value { queries[TmdbKey.session_id] = sessionId }
        
        return delete(path: path, queries: queries)
    }
    
    /// Get a list of movies in theatres. This is a release type query that looks for all movies that have a release type of 2 or 3 within the specified date range. You can optionally specify a region prameter which will narrow the search to only look for theatrical release dates within the specified country.
    ///
    /// - Parameters:
    ///   - page: page Specify which page to query.
    ///        - minimum: 1
    ///        - maximum: 1000
    ///        - default: 1
    ///   - region: Specify a ISO 3166-1 code to filter release dates. pattern: ^[A-Z]{2}$
    public func getNowPlayingMovies(page: Int! = 1, region: String? = nil) -> Observable<TmdbGetNowPlayingMoviesResponse> {
        let path = "/movie/now_playing"
        
        var queries: [String : Any] = [:]
        queries[TmdbKey.language] = language
        queries[TmdbKey.page] = page
        if region != nil {
            queries[TmdbKey.region] = region
        }
        
        return requestJson(path: path, queries: queries)
    }
    
    /// Get a list of the current popular movies on TMDb. This list updates daily.
    ///
    /// - Parameters:
    ///   - page: page Specify which page to query.
    ///        - minimum: 1
    ///        - maximum: 1000
    ///        - default: 1
    ///   - region: Specify a ISO 3166-1 code to filter release dates. pattern: ^[A-Z]{2}$
    public func getPopularMovies(page: Int! = 1, region: String? = nil) -> Observable<TmdbGetPopularMoviesResponse> {
        let path = "/movie/popular"
        
        var queries: [String : Any] = [:]
        queries[TmdbKey.language] = language
        queries[TmdbKey.page] = page
        if region != nil {
            queries[TmdbKey.region] = region
        }
        
        return requestJson(path: path, queries: queries)
    }
    
    /// Get the top rated movies on TMDb.
    ///
    /// - Parameters:
    ///   - page: page Specify which page to query.
    ///        - minimum: 1
    ///        - maximum: 1000
    ///        - default: 1
    ///   - region: Specify a ISO 3166-1 code to filter release dates. pattern: ^[A-Z]{2}$
    public func getTopRatedMovies(page: Int! = 1, region: String? = nil) -> Observable<TmdbGetTopRatedMoviesResponse> {
        let path = "/movie/top_rated"
        
        var queries: [String : Any] = [:]
        queries[TmdbKey.language] = language
        queries[TmdbKey.page] = page
        if region != nil {
            queries[TmdbKey.region] = region
        }
        
        return requestJson(path: path, queries: queries)
    }
    
    /// Get a list of upcoming movies in theatres. This is a release type query that looks for all movies that have a release type of 2 or 3 within the specified date range.
    ///
    /// - Parameters:
    ///   - page: page Specify which page to query.
    ///        - minimum: 1
    ///        - maximum: 1000
    ///        - default: 1
    ///   - region: Specify a ISO 3166-1 code to filter release dates. pattern: ^[A-Z]{2}$
    public func getUpcomingMovies(page: Int! = 1, region: String? = nil) -> Observable<TmdbGetUpcomingMoviesResponse> {
        let path = "/movie/upcoming"
        
        var queries: [String : Any] = [:]
        queries[TmdbKey.language] = language
        queries[TmdbKey.page] = page
        if region != nil {
            queries[TmdbKey.region] = region
        }
        
        return requestJson(path: path, queries: queries)
    }
    
    
    //MARK: Networks
    
    /// Get the details of a network.
    public func getNetworkDetails(networkId: Int) -> Observable<TmdbNetwork> {
        let path = "/network/\(networkId)"
        return requestJson(path: path)
    }
    
    
    //MARK: People
    
    /// Get the primary person details by id.
    public func getPersonDetails(personId: Int) -> Observable<TmdbPerson> {
        let path = "/person/\(personId)"
        
        var queries: [String : Any] = [:]
        queries[TmdbKey.language] = language
        
        return requestJson(path: path, queries: queries)
    }
    
    /// Get the movie credits for a person.
    public func getPersonsMovieCredits(personId: Int) -> Observable<TmdbGetPersonsMovieCreditsResponse> {
        let path = "/person/\(personId)/movie_credits"
        
        var queries: [String : Any] = [:]
        queries[TmdbKey.language] = language
        
        return requestJson(path: path, queries: queries)
    }
    
    /// Get the TV show credits for a person.
    public func getPersonsTVCredits(personId: Int) -> Observable<TmdbGetPersonsTVCreditsResponse> {
        let path = "/person/\(personId)/tv_credits"
        
        var queries: [String : Any] = [:]
        queries[TmdbKey.language] = language
        
        return requestJson(path: path, queries: queries)
    }
    
    /// Get the external ids for a person. We currently support the following external sources.
    /// - IMDB ID
    /// - Facebook
    /// - Freebase MID
    /// - Freebase ID
    /// - Instagram
    /// - TVRage ID
    /// - Twitter
    public func getPersonsExternalIds(personId: Int) -> Observable<TmdbGetPersonsExternalIdsResponse> {
        let path = "/person/\(personId)/external_ids"
        
        var queries: [String : Any] = [:]
        queries[TmdbKey.language] = language
        
        return requestJson(path: path, queries: queries)
    }
    
    
    /// Get the images for a person.
    public func getPersonsImages(personId: Int) -> Observable<TmdbGetPersonsImagesResponse> {
        let path = "/person/\(personId)/images"
        return requestJson(path: path)
    }
    
    /// Get the images that this person has been tagged in.
    public func getPersonsTaggedImages(personId: Int, page: Int! = 1) -> Observable<TmdbGetPersonsTaggedImagesResponse> {
        let path = "/person/\(personId)/tagged_images"
        
        var queries: [String : Any] = [:]
        queries[TmdbKey.language] = language
        queries[TmdbKey.page] = page
        
        return requestJson(path: path, queries: queries)
    }
    
    /// Get the list of popular people on TMDb. This list updates daily.
    public func getPopularPeople(page: Int! = 1) -> Observable<TmdbGetPopularPeopleResponse> {
        let path = "/person/popular"
        
        var queries: [String : Any] = [:]
        queries[TmdbKey.language] = language
        
        return requestJson(path: path, queries: queries)
    }
    
    
    //MARK: Reviews
    
    public func getReviewDetails(reviewId: String) -> Observable<TmdbReview> {
        let path = "/review/\(reviewId)"
        return requestJson(path: path)
    }
    
    
    //MARK: Search
    
    /// Search for companies.
    ///
    /// - Parameters:
    ///   - query: Pass a text query to search. This value should be URI encoded. minLength: 1
    public func searchForCompanies(query: String, page: Int! = 1) -> Observable<TmdbSearchForCompaniesResponse> {
        let path = "/search/company"
        
        var queries: [String : Any] = [:]
        queries[TmdbKey.page] = page
        if query.characters.count > 0 {
            queries[TmdbKey.query] = query
        }
        
        return requestJson(path: path, queries: queries)
    }
    
    /// Search for keywords.
    ///
    /// - Parameters:
    ///   - query: Pass a text query to search. This value should be URI encoded.
    ///     - minLength: 1
    public func searchForKeywords(query: String, page: Int! = 1) -> Observable<TmdbSearchForKeywordsResponse>{
        let path = "/search/keyword"
        
        var queries: [String : Any] = [:]
        queries[TmdbKey.page] = page
        if query.characters.count > 0 {
            queries[TmdbKey.query] = query
        }
        return requestJson(path: path, queries: queries)
    }
    
    /// Search for movies.
    ///
    /// - Parameters:
    ///   - query: Pass a text query to search. This value should be URI encoded.
    ///     - minLength: 1
    ///   - page: Specify which page to query.
    ///     - minimum: 1
    ///     - maximum: 1000
    ///     - default: 1
    ///   - language: Pass a ISO 639-1 value to display translated data for the fields that support it.
    ///     - minLength: 2
    ///     - pattern: ([a-z]{2})-([A-Z]{2})
    ///     - default: en-US
    ///   - includeAdult: Choose whether to inlcude adult (pornography) content in the results.
    ///   - region: Specify a ISO 3166-1 code to filter release dates.
    ///     - pattern: ^[A-Z]{2}$
    public func searchForMovies(query: String, page: Int! = 1, includeAdult: Bool! = false, region: String? = nil, year: Int? = nil, primaryReleaseYear: Int? = nil) -> Observable<TmdbSearchForMoviesResponse> {
        let path = "/search/movie"
        
        var queries: [String : Any] = [:]
        queries[TmdbKey.language] = language
        queries[TmdbKey.include_adult] = includeAdult
        queries[TmdbKey.page] = page
        
        if query.characters.count > 0 {
            queries[TmdbKey.query] = query
        }
        
        if region != nil {
            queries[TmdbKey.region] = region!
        }
        
        if year != nil {
            queries[TmdbKey.year] = year!
        }
        
        if primaryReleaseYear != nil {
            queries[TmdbKey.primary_release_year] = primaryReleaseYear!
        }
        
        return requestJson(path: path, queries: queries)
    }
    
    /// Search multiple models in a single request. Multi search currently supports searching for movies, tv shows and people in a single request.
    ///
    /// - Parameters:
    ///   - query: Pass a text query to search. This value should be URI encoded.
    ///     - minLength: 1
    ///   - page: Specify which page to query.
    ///     - minimum: 1
    ///     - maximum: 1000
    ///     - default: 1
    ///   - language: Pass a ISO 639-1 value to display translated data for the fields that support it.
    ///     - minLength: 2
    ///     - pattern: ([a-z]{2})-([A-Z]{2})
    ///     - default: en-US
    ///   - includeAdult: Choose whether to inlcude adult (pornography) content in the results.
    ///   - region: Specify a ISO 3166-1 code to filter release dates.
    ///     - pattern: ^[A-Z]{2}$
    public func multiSearch(query: String, page: Int! = 1, includeAdult: Bool! = false, region: String? = nil) -> Observable<TmdbMultiSearchResponse> {
        let path = "/search/multi"
        
        var queries: [String : Any] = [:]
        
        queries[TmdbKey.language] = language
        queries[TmdbKey.include_adult] = includeAdult
        queries[TmdbKey.page] = page
        
        if query.characters.count > 0 {
            queries[TmdbKey.query] = query
        }
        
        if region != nil{
            queries[TmdbKey.region] = region!
        }
        
        return requestJson(path: path, queries: queries)
    }
    
    /// Search multiple models in a single request. Multi search currently supports searching for movies, tv shows and people in a single request.
    ///
    /// - Parameters:
    ///   - query: Pass a text query to search. This value should be URI encoded.
    ///     - minLength: 1
    ///   - page: Specify which page to query.
    ///     - minimum: 1
    ///     - maximum: 1000
    ///     - default: 1
    ///   - language: Pass a ISO 639-1 value to display translated data for the fields that support it.
    ///     - minLength: 2
    ///     - pattern: ([a-z]{2})-([A-Z]{2})
    ///     - default: en-US
    ///   - includeAdult: Choose whether to inlcude adult (pornography) content in the results.
    ///   - region: Specify a ISO 3166-1 code to filter release dates.
    ///     - pattern: ^[A-Z]{2}$
    public func searchForPeople(query: String, page: Int! = 1, includeAdult: Bool? = false, region: String? = nil) -> Observable<TmdbSearchForPeopleResponse> {
        let path = "/search/person"
        
        var queries: [String : Any] = [:]
        queries[TmdbKey.language] = language
        queries[TmdbKey.page] = page
        queries[TmdbKey.include_adult] = includeAdult
        
        if query.characters.count > 0 {
            queries[TmdbKey.query] = query
        }
        
        if region != nil{
            queries[TmdbKey.region] = region!
        }
        
        return requestJson(path: path, queries: queries)
    }
    
    /// Search for a TV show.
    ///
    /// - Parameters:
    ///   - query: Pass a text query to search. This value should be URI encoded.
    ///     - minLength: 1
    ///   - page: Specify which page to query.
    ///     - minimum: 1
    ///     - maximum: 1000
    ///     - default: 1
    ///   - language: Pass a ISO 639-1 value to display translated data for the fields that support it.
    ///     - minLength: 2
    ///     - pattern: ([a-z]{2})-([A-Z]{2})
    ///     - default: en-US
    ///   -
    public func searchForTVShows(query: String, page: Int! = 1, firstAirDate: Int? = nil) -> Observable<TmdbSearchForTVShowsResponse> {
        let path = "/search/tv"
        
        var queries: [String : Any] = [:]
        queries[TmdbKey.language] = language
        queries[TmdbKey.page] = page
        
        if query.characters.count > 0 {
            queries[TmdbKey.query] = query
        }
        
        if firstAirDate != nil{
            queries[TmdbKey.first_air_date] = firstAirDate!
        }
        
        return requestJson(path: path, queries: queries)
    }
    
    
    //MARK: TVShows
    
    /// Get the primary TV show details by id.
    public func getTVShowDetails(tvId: Int) -> Observable<TmdbTVShow> {
        let path = "/tv/\(tvId)"
        
        var queries: [String : Any] = [:]
        queries[TmdbKey.language] = language
        
        return requestJson(path: path, queries: queries)
    }
    
    
    /// Grab the following account states for a session:
    /// - TV show rating
    /// - If it belongs to your watchlist
    /// - If it belongs to your favourite list
    public func getTvShowAccountStates(tvId: Int) -> Observable<TmdbGetAccountStatesResponse> {
        let path = "/tv/\(tvId)/account_states"
        
        var queries: [String : Any] = [:]
        queries[TmdbKey.language] = language
        if let sessionId = Tmdb.shared.auth.sessionId.value { queries[TmdbKey.session_id] = sessionId }
        return requestJson(path: path, queries: queries)
    }
    
    /// Returns all of the alternative titles for a TV show.
    public func getTVShowAlternativeTitles(tvId: Int) -> Observable<TmdbGetTVShowsAlternativeTitlesResponse> {
        let path = "/tv/\(tvId)/alternative_titles"
        
        var queries: [String : Any] = [:]
        queries[TmdbKey.language] = language
        
        return requestJson(path: path, queries: queries)
    }
    
    /// Get the list of content ratings (certifications) that have been added to a TV show.
    public func getTVShowContentRatings(tvId: Int) -> Observable<TmdbGetTVShowsContentRatingsResponse> {
        let path = "/tv/\(tvId)/content_ratings"
        
        var queries: [String : Any] = [:]
        queries[TmdbKey.language] = language
        
        return requestJson(path: path, queries: queries)
    }
    
    /// Get the credits (cast and crew) that have been added to a TV show.
    public func getTVShowCredits(tvId: Int) -> Observable<TmdbGetTVShowsCreditsResponse> {
        let path = "/tv/\(tvId)/credits"
        
        var queries: [String : Any] = [:]
        queries[TmdbKey.language] = language
        
        return requestJson(path: path, queries: queries)
    }
    
    /// Get the external ids for a TV show. We currently support the following external sources.
    /// - IMDB ID
    /// - Freebase MID
    /// - Freebase ID
    /// - TVDB ID
    /// - TVRage ID
    public func getTVShowExternalIds(tvId: Int) -> Observable<TmdbGetTVShowsExternalIdsResponse> {
        let path = "/tv/\(tvId)/external_ids"
        
        var queries: [String : Any] = [:]
        queries[TmdbKey.language] = language
        
        return requestJson(path: path, queries: queries)
    }
    
    /// Get the images that belong to a TV show. Querying images with a language parameter will filter the results. If you want to include a fallback language (especially useful for backdrops) you can use the include_image_language parameter. This should be a comma seperated value like so: include_image_language=en,null.
    public func getTVShowImages(tvId: Int, includeImageLanguage: String? = nil) -> Observable<TmdbGetTVShowsImagesResponse> {
        let path = "/tv/\(tvId)/images"
        
        var queries: [String : Any] = [:]
        queries[TmdbKey.language] = language
        
        if let includeImageLanguage = includeImageLanguage {
            queries[TmdbKey.include_image_language] = includeImageLanguage
        }
        
        return requestJson(path: path, queries: queries)
    }
    
    /// Get the keywords that have been added to a TV show.
    public func getTVShowKeywords(tvId: Int) -> Observable<TmdbGetTVShowsKeywordsResponse> {
        let path = "/tv/\(tvId)/keywords"
        return requestJson(path: path)
    }
    
    /// Get the list of TV show recommendations for this item.
    public func getRecommendedTVShows(tvId: Int, page: Int! = 1) -> Observable<TmdbGetTVShowsRecommendationsResponse> {
        let path = "/tv/\(tvId)/recommendations"
        return requestJson(path: path)
    }
    
    /// Get a list of similar TV shows. These items are assembled by looking at keywords and genres.
    public func getSimilarTVShows(tvId: Int, page: Int! = 1) -> Observable<TmdbGetTVShowsSimilarResponse> {
        let path = "/tv/\(tvId)/similar"
        return requestJson(path: path)
    }
    
    /// Get a list of the translations that exist for a TV show.
    public func getTVShowTranslations(tvId: Int) -> Observable<TmdbGetTVShowsTranslationsResponse> {
        let path = "/tv/\(tvId)/translations"
        
        var queries: [String : Any] = [:]
        queries[TmdbKey.language] = language
        
        return requestJson(path: path, queries: queries)
    }
    
    /// Get the videos that have been added to a TV show.
    public func getTVShowsVideos(tvId: Int) -> Observable<TmdbGetTVShowsVideosResponse> {
        let path = "/tv/\(tvId)/videos"
        
        var queries: [String : Any] = [:]
        queries[TmdbKey.language] = language
        
        return requestJson(path: path, queries: queries)
    }
    
    /// Rate a TV show.
    public func rateTVShow(tvId: Int, value: TmdbRatingScale) -> Observable<TmdbResponse> {
        let path = "/tv/\(tvId)/rating"
        
        let body = TmdbPostRateTVShowBody(value: value)
        
        var queries: [String : Any] = [:]
        if let sessionId = Tmdb.shared.auth.sessionId.value { queries[TmdbKey.session_id] = sessionId }
        
        return postJson(path: path, queries: queries, body: body)
    }
    
    /// Remove your rating for a TV show.
    public func deleteTVShowRating(tvId: Int) -> Observable<TmdbResponse>  {
        let path = "/tv/\(tvId)/rating"
        
        var queries: [String : Any] = [:]
        if let sessionId = Tmdb.shared.auth.sessionId.value { queries[TmdbKey.session_id] = sessionId }
        
        return delete(path: path, queries: queries)
    }
    
    /// Get a list of TV shows that are airing today. This query is purely day based as we do not currently support airing times. You can specify a timezone to offset the day calculation. Without a specified timezone, this query defaults to EST (Eastern Time UTC-05:00).
    public func getAiringTodayTVShows(page: Int! = 1, timezone: String? = nil) -> Observable<TmdbGetTVShowsAiringTodayResponse> {
        let path = "/tv/airing_today"
        
        var queries: [String : Any] = [:]
        queries[TmdbKey.language] = language
        queries[TmdbKey.page] = page
        
        if let timezone = timezone {
            queries[TmdbKey.timezone] = timezone
        }
        
        return requestJson(path: path, queries: queries)
    }
    
    /// Get a list of shows that are currently on the air. This query looks for any TV show that has an episode with an air date in the next 7 days.
    public func getOnTheAirTVShows(page: Int! = 1) -> Observable<TmdbGetTVShowsOnTheAirResponse> {
        let path = "/tv/on_the_air"
        
        var queries: [String : Any] = [:]
        queries[TmdbKey.language] = language
        queries[TmdbKey.page] = page
        
        return requestJson(path: path, queries: queries)
    }
    
    /// Get a list of the current popular TV shows on TMDb. This list updates daily.
    public func getPopularTVShows(page: Int! = 1) -> Observable<TmdbGetPopularTVShowsResponse> {
        let path = "/tv/popular"
        
        var queries: [String : Any] = [:]
        queries[TmdbKey.language] = language
        queries[TmdbKey.page] = page
        
        return requestJson(path: path, queries: queries)
    }
    
    /// Get a list of the top rated TV shows on TMDb.
    public func getTopRatedTVShows(page: Int! = 1) -> Observable<TmdbGetTopRatedTVShowsResponse> {
        let path = "/tv/top_rated"
        
        var queries: [String : Any] = [:]
        queries[TmdbKey.language] = language
        queries[TmdbKey.page] = page
        
        return requestJson(path: path, queries: queries)
    }
    
    
    //MARK: TV Seasons
    
    /// Get the TV season details by id.
    public func getTVSeasonDetails(tvId: Int, seasonNumber: Int) -> Observable<TmdbTVSeason> {
        let path = "/tv/\(tvId)/season/\(seasonNumber)"
        
        var queries: [String : Any] = [:]
        queries[TmdbKey.language] = language
        
        return requestJson(path: path, queries: queries)
    }
    
    /// Returns all of the user ratings for the season's episodes.
    public func getTVSeasonAccountStates(tvId: Int, seasonNumber: Int) -> Observable<TmdbGetAccountStatesResponse> {
        let path = "/tv/\(tvId)/season/\(seasonNumber)/account_states"
        
        var queries: [String : Any] = [:]
        queries[TmdbKey.language] = language
        if let sessionId = Tmdb.shared.auth.sessionId.value { queries[TmdbKey.session_id] = sessionId }
        
        return requestJson(path: path, queries: queries)
    }
    
    /// Get the credits for TV season.
    public func getTVSeasonsCredits(tvId: Int, seasonNumber: Int) -> Observable<TmdbGetTVSeasonCreditsResponse> {
        let path = "/tv/\(tvId)/season/\(seasonNumber)/credits"
        
        var queries: [String : Any] = [:]
        queries[TmdbKey.language] = language
        
        return requestJson(path: path, queries: queries)
    }
    
    /// Get the external ids for a TV season. We currently support the following external sources.
    /// - Freebase MID
    /// - Freebase ID
    /// - TVDB ID
    /// - TVRage ID
    public func getTVSeasonsExternalIds(tvId: Int, seasonNumber: Int) -> Observable<TmdbGetTVSeasonExternalIdsResponse> {
        let path = "/tv/\(tvId)/season/\(seasonNumber)/external_ids"
        
        var queries: [String : Any] = [:]
        queries[TmdbKey.language] = language
        
        return requestJson(path: path, queries: queries)
    }
    
    ///Querying images with a language parameter will filter the results. If you want to include a fallback language (especially useful for backdrops) you can use the include_image_language parameter. This should be a comma seperated value like so: include_image_language=en,null.
    public func getTVSeasonsImages(tvId: Int, seasonNumber: Int, includeImageLanguage: String? = nil) -> Observable<TmdbGetTVSeasonImagesResponse> {
        let path = "/tv/\(tvId)/season/\(seasonNumber)/images"
        
        var queries: [String : Any] = [:]
        queries[TmdbKey.language] = language
        
        if let includeImageLanguage = includeImageLanguage{
            queries[TmdbKey.include_image_language] = includeImageLanguage
        }
        
        return requestJson(path: path, queries: queries)
    }
    
    /// Get the videos that have been added to a TV season.
    public func getTVSeasonsVideos(tvId: Int, seasonNumber: Int) -> Observable<TmdbGetTVSeasonVideosResponse> {
        let path = "/tv/\(tvId)/season/\(seasonNumber)/videos"
        
        var queries: [String : Any] = [:]
        queries[TmdbKey.language] = language
        
        return requestJson(path: path, queries: queries)
    }
    
    
    //MARK: TV Episodes
    
    /// Get the TV episode details by id.
    public func getTVEpisodeDetails(tvId: Int, seasonNumber: Int, episodeNumber: Int) -> Observable<TmdbTVEpisode> {
        let path = "/tv/\(tvId)/season/\(seasonNumber)/episode/\(episodeNumber)"
        
        var queries: [String : Any] = [:]
        queries[TmdbKey.language] = language
        
        return requestJson(path: path, queries: queries)
    }
    
    /// Get your rating for a episode.
    public func getTVEpisodeAccountStates(tvId: Int, seasonNumber: Int, episodeNumber: Int) -> Observable<TmdbGetAccountStatesResponse> {
        let path = "/tv/\(tvId)/season/\(seasonNumber)/episode/\(episodeNumber)/account_states"
        
        var queries: [String : Any] = [:]
        if let sessionId = Tmdb.shared.auth.sessionId.value { queries[TmdbKey.session_id] = sessionId }
        
        return requestJson(path: path, queries: queries)
    }
    
    /// Get the credits (cast, crew and guest stars) for a TV episode.
    public func getTVEpisodeCredits(tvId: Int, seasonNumber: Int, episodeNumber: Int) -> Observable<TmdbGetTVEpisodeCreditsResponse> {
        let path = "/tv/\(tvId)/season/\(seasonNumber)/episode/\(episodeNumber)/credits"
        return requestJson(path: path)
    }
    
    /// Get the external ids for a TV episode. We currently support the following external sources.
    /// - IMDB ID
    /// - Freebase MID
    /// - Freebase ID
    /// - TVDB ID
    /// - TVRage ID
    public func getTVEpisodeExternalIds(tvId: Int, seasonNumber: Int, episodeNumber: Int) -> Observable<TmdbGetTVEpisodeExternalIDsResponse> {
        let path = "/tv/\(tvId)/season/\(seasonNumber)/episode/\(episodeNumber)/external_ids"
        return requestJson(path: path)
    }
    
    /// Get the images that belong to a TV episode. Querying images with a language parameter will filter the results. If you want to include a fallback language (especially useful for backdrops) you can use the include_image_language parameter. This should be a comma seperated value like so: include_image_language=en,null.
    public func getTVEpisodeImages(tvId: Int, seasonNumber: Int, episodeNumber: Int, includeImageLanguage: String? = nil) -> Observable<TmdbGetTVEpisodeImagesResponse> {
        let path = "/tv/\(tvId)/season/\(seasonNumber)/episode/\(episodeNumber)/images"
        
        guard let includeImageLanguage = includeImageLanguage else {
            return requestJson(path: path)
        }
        
        var queries: [String : Any] = [:]
        queries[TmdbKey.include_image_language] = includeImageLanguage
        
        return requestJson(path: path, queries: queries)
    }
    
    /// Rate a TV episode.
    public func rateTVEpisode(tvId: Int, seasonNumber: Int, episodeNumber: Int, value: TmdbRatingScale) -> Observable<TmdbResponse> {
        let path = "/tv/\(tvId)/season/\(seasonNumber)/episode/\(episodeNumber)/rating"
        
        let body = TmdbPostRateTVEpisodeBody(value: value)
        
        var queries: [String : Any] = [:]
        if let sessionId = Tmdb.shared.auth.sessionId.value { queries[TmdbKey.session_id] = sessionId }
        
        return postJson(path: path, queries: queries, body: body)
    }
    
    /// Remove your rating for a TV episode.
    public func deleteTVEpisodeRating(tvId: Int, seasonNumber: Int, episodeNumber: Int) -> Observable<TmdbResponse> {
        let path = "/tv/\(tvId)/season/\(seasonNumber)/episode/\(episodeNumber)/rating"
        
        var queries: [String : Any] = [:]
        if let sessionId = Tmdb.shared.auth.sessionId.value { queries[TmdbKey.session_id] = sessionId }
        
        return delete(path: path, queries: queries)
    }
    
    /// Get the videos that have been added to a TV episode.
    public func getTVEpisodeVideos(tvId: Int, seasonNumber: Int, episodeNumber: Int) -> Observable<TmdbGetTVEpisodeVideosResponse>{
        let path = "/tv/\(tvId)/season/\(seasonNumber)/episode/\(episodeNumber)/videos"
        
        var queries: [String : Any] = [:]
        queries[TmdbKey.language] = language
        
        return requestJson(path: path, queries: queries)
    }
}
