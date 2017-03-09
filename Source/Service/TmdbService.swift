//
//  TmdbServiceType.swift
//  My Favorite Movies
//
//  Created by Kamil Swojak on 17/12/2016.
//  Copyright © 2016 Kamil Swojak. All rights reserved.
//

import Foundation
import RxSwift

/// Welcome to version 3 of The Movie Database (TMDb) API. Below you will find a current list of the available methods on our movie, tv, actor and image API. If you need help or support, please head over to our API support forum (https://www.themoviedb.org/talk/category/5047958519c29526b50017d6). To register for an API key, sign up and/or login to your account page on TMDb and click the "API" link in the left hand sidebar. Before being issued an API key you will have to agree to our terms of use. You can read it here https://www.themoviedb.org/documentation/api/terms-of-use.
public class TmdbService{
    
    static let shared = TmdbService()
    
    fileprivate init(){}
    
    let defaultLanguage = "en"
    
    /// Pass a ISO 639-1 value to display translated data for the fields that support it.
    ///     - minLength: 2
    ///     - pattern: ([a-z]{2})-([A-Z]{2})
    ///     - default: en-US
    var language: String = "en"
    
    
    private let auth = TmdbAuth.shared
    
    //MARK: Account
    
    /// Get your account details.
    public func getAccountDetails(completion: @escaping (_ data: TmdbGetAccountDetailsResponse?) -> Void){
        let path = "account"
        
        var queries: [String : Any] = [:]
        if let sessionId = Tmdb.shared.auth.sessionId.value { queries[TmdbKey.session_id] = sessionId }
        
        requestJson(path: path, queries: queries, completion: completion)
    }
    
    /// Get all of the lists created by an account. Will invlude private lists if you are the owner.
    public func getCreatedLists(accountId: Int, page: Int! = 1, completion: @escaping (_ data: TmdbGetCreatedListsResponse?) -> Void) {
        let path = "/account/\(accountId)/lists"
        
        var queries: [String : Any] = [:]
        queries[TmdbKey.language] = language
        if let sessionId = Tmdb.shared.auth.sessionId.value { queries[TmdbKey.session_id] = sessionId }
        queries[TmdbKey.page] = page
        
        requestJson(path: path, queries: queries, completion: completion)
    }
    
    /// Get the list of your favorite movies.
    public func getFavoriteMovies(accountId: Int, page: Int! = 1, sortBy: TmdbSort? = .CreatedAtAscending, completion: @escaping (_ data: TmdbGetFavoriteMoviesResponse?) -> Void){
        let path = "/account/\(accountId)/favorite/movies"
        
        var queries: [String : Any] = [:]
        queries[TmdbKey.language] = language
        if let sessionId = Tmdb.shared.auth.sessionId.value { queries[TmdbKey.session_id] = sessionId }
        queries[TmdbKey.page] = page
        queries[TmdbKey.sortBy] = sortBy!.rawValue
        
        requestJson(path: path, queries: queries, completion: completion)
    }
    
    /// Get the list of your favorite TV shows.
    public func getFavoriteTVShows(accountId: Int, page: Int! = 1, sortBy: TmdbSort? = .CreatedAtAscending, completion: @escaping (_ data: TmdbGetFavoriteTVShowsResponse?) -> Void){
        let path = "/account/\(accountId)/favorite/tv"
        
        var queries: [String : Any] = [:]
        queries[TmdbKey.language] = language
        if let sessionId = Tmdb.shared.auth.sessionId.value { queries[TmdbKey.session_id] = sessionId }
        queries[TmdbKey.page] = page
        queries[TmdbKey.sortBy] = sortBy!.rawValue
        
        requestJson(path: path, queries: queries, completion: completion)
    }
    
    /// This method allows you to mark a movie or TV show as a favorite item.
    public func markAsFavorite(mediaType: TmdbMediaType, mediaId: Int, favorite: Bool, accountId: Int, completion: @escaping (_ data: TmdbResponse?) -> Void){
        let path = "/account/\(accountId)/favorite"
        
        let body = MarkAsFavoriteBody(mediaType: mediaType.rawValue, mediaId: mediaId, favorite: favorite)
        
        var queries: [String : Any] = [:]
        if let sessionId = Tmdb.shared.auth.sessionId.value { queries[TmdbKey.session_id] = sessionId }
        
        postJson(path: path, queries: queries, body: body, completion: completion)
    }
    
    /// Get a list of all the movies you have rated.
    public func getRatedMovies(accountId: Int, page: Int! = 1, sortBy: TmdbSort? = .CreatedAtAscending, completion: @escaping (_ data: TmdbGetRatedMoviesResponse?) -> Void) {
        let path = "/account/\(accountId)/rated/movies"
        
        var queries: [String : Any] = [:]
        queries[TmdbKey.language] = language
        queries[TmdbKey.page] = page
        queries[TmdbKey.sortBy] = sortBy!.rawValue
        if let sessionId = Tmdb.shared.auth.sessionId.value { queries[TmdbKey.session_id] = sessionId }
        
        requestJson(path: path, queries: queries, completion: completion)
    }
    
    /// Get a list of all the TV shows you have rated.
    public func getRatedTVShows(accountId: Int, page: Int! = 1, sortBy: TmdbSort? = .CreatedAtAscending, completion: @escaping (_ data: TmdbGetRatedTVShowsResponse?) -> Void) {
        let path = "/account/\(accountId)/rated/tv"
        
        var queries: [String : Any] = [:]
        queries[TmdbKey.language] = language
        queries[TmdbKey.page] = page
        queries[TmdbKey.sortBy] = sortBy!.rawValue
        if let sessionId = Tmdb.shared.auth.sessionId.value { queries[TmdbKey.session_id] = sessionId }
        
        requestJson(path: path, queries: queries, completion: completion)
    }
    
    /// Get a list of all the TV episodes you have rated.
    public func getRatedTVEpisodes(accountId: Int, page: Int! = 1, sortBy: TmdbSort? = .CreatedAtAscending, completion: @escaping (_ data: TmdbGetRatedTVEpisodesResponse?) -> Void){
        let path = "/account/\(accountId)/rated/tv/episodes"
        
        var queries: [String : Any] = [:]
        queries[TmdbKey.language] = language
        queries[TmdbKey.page] = page
        queries[TmdbKey.sortBy] = sortBy!.rawValue
        if let sessionId = Tmdb.shared.auth.sessionId.value { queries[TmdbKey.session_id] = sessionId }
        
        requestJson(path: path, queries: queries, completion: completion)
    }
    
    /// Get a list of all the movies you have added to your watchlist.
    public func getMovieWatchlist(accountId: Int, page: Int! = 1, sortBy: TmdbSort? = .CreatedAtAscending, completion: @escaping (_ data: TmdbGetMovieWatchlistResponse?) -> Void) {
        let path = "/account/\(accountId)/watchlist/movies"
        
        var queries: [String : Any] = [:]
        queries[TmdbKey.language] = language
        queries[TmdbKey.page] = page
        queries[TmdbKey.sortBy] = sortBy!.rawValue
        if let sessionId = Tmdb.shared.auth.sessionId.value { queries[TmdbKey.session_id] = sessionId }
        
        requestJson(path: path, queries: queries, completion: completion)
    }
    
    /// Get a list of all the TV shows you have added to your watchlist.
    public func getTVShowWatchlist(accountId: Int, page: Int! = 1, sortBy: TmdbSort? = .CreatedAtAscending, completion: @escaping (_ data: TmdbGetTVShowsWatchlistResponse?) -> Void) {
        let path = "/account/\(accountId)/watchlist/tv"
        
        var queries: [String : Any] = [:]
        queries[TmdbKey.language] = language
        queries[TmdbKey.page] = page
        queries[TmdbKey.sortBy] = sortBy!.rawValue
        if let sessionId = Tmdb.shared.auth.sessionId.value { queries[TmdbKey.session_id] = sessionId }
        
        requestJson(path: path, queries: queries, completion: completion)
    }
    
    /// Add a movie or TV show to your watchlist.
    public func addToWatchlist(mediaType: TmdbMediaType, mediaId: Int, watchlist: Bool, accountId: Int, completion: @escaping (_ data: TmdbResponse?) -> Void) {
        let path = "/account/\(accountId)/watchlist"
        
        let body = AddToWatchlistBody(mediaType: mediaType.rawValue, mediaId: mediaId, watchlist: watchlist)
        
        var queries: [String : Any] = [:]
        if let sessionId = Tmdb.shared.auth.sessionId.value { queries[TmdbKey.session_id] = sessionId }
        
        postJson(path: path, queries: queries, body: body, completion: completion)
    }
    
    
    //MARK: Authentication
    
    //    public func signIn(username: String, password: String, completion: @escaping (_ data: TmdbAuthState?) -> Void) {
    //        createRequestToken()
    //                .validateRequestToken(username: username, password: password)
    //                .createSession()
    //            .map {
    //
    //        }
    //    }
    //
    /// Create a temporary request token that can be used to validate a TMDb user login. More details about how this works can be found https://developers.themoviedb.org/3/authentication/how-do-i-generate-a-session-id.
    public func createRequestToken(completion: @escaping (_ data: TmdbCreateRequestTokenResponse?) -> Void) {
        let path = "/authentication/token/new"
        requestJson(path: path, completion: completion)
    }
    
    /// This method allows an application to validate a request token by entering a username and password.  More details about how this works can be found https://developers.themoviedb.org/3/authentication/how-do-i-generate-a-session-id.
    public func validateRequestToken(username: String, password: String, requestToken: String, completion: @escaping (_ data: TmdbValidateRequestTokenResponse?) -> Void) {
        let path = "/authentication/token/validate_with_login"
        
        var queries: [String : Any] = [:]
        queries[TmdbKey.username] = username
        queries[TmdbKey.password] = password
        queries[TmdbKey.request_token] = requestToken
        
        requestJson(path: path, queries: queries, completion: completion)
    }
    
    /// You can use this method to create a fully valid session ID once a user has validated the request token. More information about how this works can be found here https://developers.themoviedb.org/3/authentication/how-do-i-generate-a-session-id.
    public func createSession(validatedRequestToken: String, completion: @escaping (_ data: TmdbCreateSessionResponse?) -> Void) {
        let path = "/authentication/session/new"
        
        var queries: [String : Any] = [:]
        queries[TmdbKey.request_token] = validatedRequestToken
        
        requestJson(path: path, queries: queries, completion: completion)
    }
    
    
    //Mark: Companies
    
    /// Get a companies details by id.
    public func getCompanyDetails(companyId: Int, completion: @escaping (_ data: TmdbGetCompanyDetailsResponse?) -> Void) {
        let path = "/company/\(companyId)"
        requestJson(path: path, completion: completion)
    }
    
    /// Get the movies of a company by id.
    public func getMoviesByCompany(companyId: Int, page: Int! = 1, completion: @escaping (_ data: TmdbGetMoviesByCompanyResponse?) -> Void) {
        let path = "/company/\(companyId)/movies"
        
        var queries: [String : Any] = [:]
        queries[TmdbKey.page] = page
        
        requestJson(path: path, queries: queries, completion: completion)
    }
    
    
    //MARK: Certifications
    
    public func getMoviesCertifications(completion: @escaping (_ data: TmdbGetCertificationsResponse?) -> Void) {
        let path = "/certification/movie/list"
        requestJson(path: path, completion: completion)
    }
    
    public func getTVShowsCertification(completion: @escaping (_ data: TmdbGetCertificationsResponse?) -> Void) {
        let path = "/certification/tv/list"
        requestJson(path: path, completion: completion)
    }
    
    
    //MARK: Collections
    
    public func getCollectionDetails(collectionId: Int, completion: @escaping (_ data: TmdbCollection?) -> Void) {
        let path = "/collection/\(collectionId)"
        requestJson(path: path, completion: completion)
    }
    
    
    //MARK: Configuration
    
    /// Get the system wide configuration information. Some elements of the API require some knowledge of this configuration data. The purpose of this is to try and keep the actual API responses as light as possible. It is recommended you cache this data within your application and check for updates every few days. This method currently holds the data relevant to building image URLs as well as the change key map. To build an image URL, you will need 3 pieces of data. The base_url, size and file_path. Simply combine them all and you will have a fully qualified URL. Here’s an example URL: https://image.tmdb.org/t/p/w500/8uO0gUM8aNqYLs1OsTBQiXu0fEv.jpg The configuration method also contains the list of change keys which can be useful if you are building an app that consumes data from the change feed.
    public func getConfiguration(completion: @escaping (_ data: TmdbGetConfigurationResponse?) -> Void) {
        let path = "configuration"
        requestJson(path: path, completion: completion)
    }
    
    
    //MARK: Credits
    
    /// Get a movie or TV credit details by id.
    public func getCreditDetails(creditId: String, completion: @escaping (_ data: TmdbGetCreditDetailsResponse?) -> Void) {
        let path = "/credit/\(creditId)"
        requestJson(path: path, completion: completion)
    }
    
    
    //MARK: Discover
    
    /// Discover movies by different types of data like average rating, number of votes, genres and certifications. You can get a valid list of certifications from the /certifications method. Discover also supports a nice list of sort options. See below for all of the available options. Please note, when using certification \ certification.lte you must also specify certification_country. These two parameters work together in order to filter the results. You can only filter results with the countries we have added to our certifications list. If you specify the region parameter, the regional release date will be used instead of the primary release date. The date returned will be the first date based on your query (ie. if a with_release_type is specified). It's important to note the order of the release types that are used. Specifying "2|3" would the limited theatrical release date as opposed to "3|2" which would the theatrical date.
    public func discoverMovies(queries: TmdbMovieDiscoverQueries?, page: Int! = 1, completion: @escaping (_ data: TmdbDiscoverMovieResponse?) -> Void){
        let path = "/discover/movie"
        
        guard let queries = queries else {
            requestJson(path: path, completion: completion)
            return
        }
        queries.language = language
        
        requestJson(path: path, queries: (queries as TmdbDiscoverQuery).mapQueries(), completion: completion)
    }
    
    /// Discover TV shows by different types of data like average rating, number of votes, genres, the network they aired on and air dates.
    public func discoverTVShows(queries: TmdbTvShowsDiscoverQueries?, page: Int! = 1, completion: @escaping (_ data: TmdbDiscoverTVShowsResponse?) -> Void) {
        let path = "/discover/tv"
        
        guard let queries = queries else {
            requestJson(path: path, completion: completion)
            return
        }
        queries.language = language
        
        requestJson(path: path, queries: (queries as TmdbDiscoverQuery).mapQueries(), completion: completion)
    }
    
    
    //MARK: Genres
    
    /// Get the list of official genres for movies.
    public func getMovieGenres(completion: @escaping (_ data: TmdbGetMovieGenresResponse?) -> Void) {
        let path = "/genre/movie/list"
        
        var queries: [String : Any] = [:]
        queries[TmdbKey.language] = language
        
        requestJson(path: path, queries: queries, completion: completion)
    }
    
    /// Get the list of official genres for TV shows.
    public func getTVShowsGenres(completion: @escaping (_ data: TmdbGetTVGenresResponse?) -> Void) {
        let path = "/genre/tv/list"
        
        var queries: [String : Any] = [:]
        queries[TmdbKey.language] = language
        
        requestJson(path: path, queries: queries, completion: completion)
    }
    
    /// Get a list of movies by genre id. We highly recommend using movie discover instead of this method as it is much more flexible.
    ///
    /// - Parameters:
    ///   - includeAdult: Choose whether to inlcude adult (pornography) content in the results.
    ///     - default: false
    ///   - sortBy: Sort the results.
    public func getMoviesByGenre(genreId: TmdbMovieGenre, page: Int! = 1, includeAdult: Bool! = false, sortBy: TmdbSort! = .CreatedAtAscending, completion: @escaping (_ data: TmdbGetMoviesByGenreResponse?) -> Void){
        let path = "/genre/\(genreId.rawValue)/movies"
        
        var queries: [String : Any] = [:]
        queries[TmdbKey.language] = language
        queries[TmdbKey.sortBy] = sortBy.rawValue
        queries[TmdbKey.include_adult] = includeAdult
        queries[TmdbKey.page] = page
        
        requestJson(path: path, queries: queries, completion: completion)
    }
    
    
    //MARK: Keywords
    
    public func getKeywordDetails(keywordId: Int, completion: @escaping (_ data: TmdbKeyword?) -> Void) {
        let path = "/keyword/\(keywordId)"
        requestJson(path: path, completion: completion)
    }
    
    /// Get the movies that belong to a keyword.
    public func getMoviesByKeyword(keywordId: Int, page: Int! = 1, adult: Bool? = false, completion: @escaping (_ data: TmdbGetMoviesByKeywordResponse?) -> Void) {
        let path = "/keyword/\(keywordId)/movies"
        
        var queries: [String : Any] = [:]
        queries[TmdbKey.language] = language
        
        requestJson(path: path, queries: queries, completion: completion)
    }
    
    
    //MARK: Movies
    
    /// Get the primary information about a movie.
    public func getMovieDetails(movieId: Int, completion: @escaping (_ data: TmdbMovie?) -> Void) {
        let path = "/movie/\(movieId)"
        
        var queries: [String : Any] = [:]
        queries[TmdbKey.language] = language
        
        requestJson(path: path, queries: queries, completion: completion)
    }
    
    
    /// Grab the following account states for a session:
    /// - Movie rating
    /// - If it belongs to your watchlist
    /// - If it belongs to your favourite list
    public func getMovieAccountStates(movieId: Int, completion: @escaping (_ data: TmdbGetAccountStatesResponse?) -> Void) {
        let path = "/movie/\(movieId)/account_states"
        
        var queries: [String : Any] = [:]
        queries[TmdbKey.language] = language
        if let sessionId = Tmdb.shared.auth.sessionId.value { queries[TmdbKey.session_id] = sessionId }
        
        requestJson(path: path, queries: queries, completion: completion)
    }
    
    /// Get all of the alternative titles for a movie.
    public func getMovieAlternativeTitles(movieId: Int, country: String?, completion: @escaping (_ data: TmdbGetMovieAlternativeTitlesResponse?) -> Void) {
        let path = "/movie/\(movieId)/alternative_titles"
        
        guard let country = country else {
            requestJson(path: path, completion: completion)
            return
        }
        
        var queries: [String : Any] = [:]
        queries[TmdbKey.country] = country
        
        requestJson(path: path, queries: queries, completion: completion)
    }
    
    /// Get the cast and crew for a movie.
    public func getMovieCredits(movieId: Int, completion: @escaping (_ data: TmdbGetMovieCreditsResponse?) -> Void){
        let path = "/movie/\(movieId)/credits"
        requestJson(path: path, completion: completion)
    }
    
    /// Get the images that belong to a movie. Querying images with a language parameter will filter the results. If you want to include a fallback language (especially useful for backdrops) you can use the include_image_language parameter. This should be a comma seperated value like so: include_image_language=en,null.
    public func getMovieImages(movieId: Int, includeImageLanguage: String? = nil, completion: @escaping (_ data: TmdbGetMovieImagesResponse?) -> Void) {
        let path = "/movie/\(movieId)/images"
        
        var queries: [String : Any] = [:]
        queries[TmdbKey.language] = language
        if let includeImageLanguage = includeImageLanguage {
            queries[TmdbKey.include_image_language] = includeImageLanguage
        }
        
        requestJson(path: path, queries: queries, completion: completion)
    }
    
    /// Get the keywords that have been added to a movie.
    public func getMovieKeywords(movieId: Int, completion: @escaping (_ data: TmdbGetMovieKeywordsResponse?) -> Void) {
        let path = "/movie/\(movieId)/keywords"
        requestJson(path: path, completion: completion)
    }
    
    /// Get the release date along with the certification for a movie.
    public func getMovieReleaseDates(movieId: Int, completion: @escaping (_ data: TmdbGetMovieReleaseDatesResponse?) -> Void) {
        let path = "/movie/\(movieId)/release_dates"
        requestJson(path: path, completion: completion)
    }
    
    /// Get the videos that have been added to a movie.
    public func getMovieVideos(movieId: Int, completion: @escaping (_ data: TmdbGetMovieVideosResponse?) -> Void) {
        let path = "/movie/\(movieId)/videos"
        
        var queries: [String : Any] = [:]
        queries[TmdbKey.language] = language
        
        requestJson(path: path, queries: queries, completion: completion)
    }
    
    /// Get a list of translations that have been created for a movie.
    public func getMovieTranslations(movieId: Int, completion: @escaping (_ data: TmdbGetMovieTranslationsResponse?) -> Void) {
        let path = "/movie/\(movieId)/translations"
        requestJson(path: path, completion: completion)
    }
    
    /// Get a list of recommended movies for a movie.
    public func getMovieRecomendations(movieId: Int, page: Int! = 1, completion: @escaping (_ data: TmdbGetMovieRecommendationsResponse?) -> Void) {
        let path = "/movie/\(movieId)/recommendations"
        
        var queries: [String : Any] = [:]
        queries[TmdbKey.language] = language
        queries[TmdbKey.page] = page
        
        requestJson(path: path, queries: queries, completion: completion)
    }
    
    /// Get a list of similar movies. This is not the same as the "Recommendation" system you see on the website. These items are assembled by looking at keywords and genres.
    public func getSimilarMovies(movieId: Int, page: Int! = 1, completion: @escaping (_ data: TmdbGetSimilarMoviesResponse?) -> Void) {
        let path = "/movie/\(movieId)/similar"
        
        var queries: [String : Any] = [:]
        queries[TmdbKey.language] = language
        queries[TmdbKey.page] = page
        
        requestJson(path: path, queries: queries, completion: completion)
    }
    
    /// Get the user reviews for a movie.
    public func getMovieReviews(movieId: Int, page: Int! = 1, completion: @escaping (_ data: TmdbGetMovieReviewsResponse?) -> Void) {
        let path = "/movie/\(movieId)/reviews"
        
        var queries: [String : Any] = [:]
        queries[TmdbKey.language] = language
        queries[TmdbKey.page] = page
        
        requestJson(path: path, queries: queries, completion: completion)
    }
    
    /// Get a list of lists that this movie belongs to.
    public func getMovieLists(movieId: Int, page: Int! = 1, completion: @escaping (_ data: TmdbGetMovieListsResponse?) -> Void) {
        let path = "/movie/\(movieId)/lists"
        
        var queries: [String : Any] = [:]
        queries[TmdbKey.language] = language
        queries[TmdbKey.page] = page
        
        requestJson(path: path, queries: queries, completion: completion)
    }
    
    /// Rate a movie.
    public func rateMovie(movieId: Int, value: TmdbRatingScale, completion: @escaping (_ data: TmdbResponse?) -> Void) {
        let body = PostRateMovieBody(value: value)
        let path = "/movie/\(movieId)/rating"
        
        var queries: [String : Any] = [:]
        if let sessionId = Tmdb.shared.auth.sessionId.value { queries[TmdbKey.session_id] = sessionId }
        
        postJson(path: path, queries: queries, body: body, completion: completion)
    }
    
    /// Remove your rating for a movie.
    public func deleteRating(movieId: Int, completion: @escaping (_ data: TmdbResponse?) -> Void) {
        let path = "/movie/\(movieId)/rating"
        
        var queries: [String : Any] = [:]
        if let sessionId = Tmdb.shared.auth.sessionId.value { queries[TmdbKey.session_id] = sessionId }
        

        delete(path: path, queries: queries, completion: completion)
    }
    
    /// Get a list of movies in theatres. This is a release type query that looks for all movies that have a release type of 2 or 3 within the specified date range. You can optionally specify a region prameter which will narrow the search to only look for theatrical release dates within the specified country.
    ///
    /// - Parameters:
    ///   - page: page Specify which page to query.
    ///        - minimum: 1
    ///        - maximum: 1000
    ///        - default: 1
    ///   - region: Specify a ISO 3166-1 code to filter release dates. pattern: ^[A-Z]{2}$
    public func getNowPlayingMovies(page: Int! = 1, region: String? = nil, completion: @escaping (_ data: TmdbGetNowPlayingMoviesResponse?) -> Void) {
        let path = "/movie/now_playing"
        
        var queries: [String : Any] = [:]
        queries[TmdbKey.language] = language
        queries[TmdbKey.page] = page
        if region != nil {
            queries[TmdbKey.region] = region
        }
        
        requestJson(path: path, queries: queries, completion: completion)
    }
    
    /// Get a list of the current popular movies on TMDb. This list updates daily.
    ///
    /// - Parameters:
    ///   - page: page Specify which page to query.
    ///        - minimum: 1
    ///        - maximum: 1000
    ///        - default: 1
    ///   - region: Specify a ISO 3166-1 code to filter release dates. pattern: ^[A-Z]{2}$
    public func getPopularMovies(page: Int! = 1, region: String? = nil, completion: @escaping (_ data: TmdbGetPopularMoviesResponse?) -> Void) {
        let path = "/movie/popular"
        
        var queries: [String : Any] = [:]
        queries[TmdbKey.language] = language
        queries[TmdbKey.page] = page
        if region != nil {
            queries[TmdbKey.region] = region
        }
        
        requestJson(path: path, queries: queries, completion: completion)
    }
    
    /// Get the top rated movies on TMDb.
    ///
    /// - Parameters:
    ///   - page: page Specify which page to query.
    ///        - minimum: 1
    ///        - maximum: 1000
    ///        - default: 1
    ///   - region: Specify a ISO 3166-1 code to filter release dates. pattern: ^[A-Z]{2}$
    public func getTopRatedMovies(page: Int! = 1, region: String? = nil, completion: @escaping (_ data: TmdbGetTopRatedMoviesResponse?) -> Void) {
        let path = "/movie/top_rated"
        
        var queries: [String : Any] = [:]
        queries[TmdbKey.language] = language
        queries[TmdbKey.page] = page
        if region != nil {
            queries[TmdbKey.region] = region
        }
        
        requestJson(path: path, queries: queries, completion: completion)
    }
    
    /// Get a list of upcoming movies in theatres. This is a release type query that looks for all movies that have a release type of 2 or 3 within the specified date range.
    ///
    /// - Parameters:
    ///   - page: page Specify which page to query.
    ///        - minimum: 1
    ///        - maximum: 1000
    ///        - default: 1
    ///   - region: Specify a ISO 3166-1 code to filter release dates. pattern: ^[A-Z]{2}$
    public func getUpcomingMovies(page: Int! = 1, region: String? = nil, completion: @escaping (_ data: TmdbGetUpcomingMoviesResponse?) -> Void) {
        let path = "/movie/upcoming"
        
        var queries: [String : Any] = [:]
        queries[TmdbKey.language] = language
        queries[TmdbKey.page] = page
        if region != nil {
            queries[TmdbKey.region] = region
        }
        
        requestJson(path: path, queries: queries, completion: completion)
    }
    
    
    //MARK: Networks
    
    /// Get the details of a network.
    public func getNetworkDetails(networkId: Int, completion: @escaping (_ data: TmdbNetwork?) -> Void) {
        let path = "/network/\(networkId)"
        requestJson(path: path, completion: completion)
    }
    
    
    //MARK: People
    
    /// Get the primary person details by id.
    public func getPersonDetails(personId: Int, completion: @escaping (_ data: TmdbPerson?) -> Void) {
        let path = "/person/\(personId)"
        
        var queries: [String : Any] = [:]
        queries[TmdbKey.language] = language
        
        requestJson(path: path, queries: queries, completion: completion)
    }
    
    /// Get the movie credits for a person.
    public func getPersonsMovieCredits(personId: Int, completion: @escaping (_ data: TmdbGetPersonsMovieCreditsResponse?) -> Void) {
        let path = "/person/\(personId)/movie_credits"
        
        var queries: [String : Any] = [:]
        queries[TmdbKey.language] = language
        
        requestJson(path: path, queries: queries, completion: completion)
    }
    
    /// Get the TV show credits for a person.
    public func getPersonsTVCredits(personId: Int, completion: @escaping (_ data: TmdbGetPersonsTVCreditsResponse?) -> Void) {
        let path = "/person/\(personId)/tv_credits"
        
        var queries: [String : Any] = [:]
        queries[TmdbKey.language] = language
        
        requestJson(path: path, queries: queries, completion: completion)
    }
    
    /// Get the external ids for a person. We currently support the following external sources.
    /// - IMDB ID
    /// - Facebook
    /// - Freebase MID
    /// - Freebase ID
    /// - Instagram
    /// - TVRage ID
    /// - Twitter
    public func getPersonsExternalIds(personId: Int, completion: @escaping (_ data: TmdbGetPersonsExternalIdsResponse?) -> Void) {
        let path = "/person/\(personId)/external_ids"
        
        var queries: [String : Any] = [:]
        queries[TmdbKey.language] = language
        
        requestJson(path: path, queries: queries, completion: completion)
    }
    
    
    /// Get the images for a person.
    public func getPersonsImages(personId: Int, completion: @escaping (_ data: TmdbGetPersonsImagesResponse?) -> Void) {
        let path = "/person/\(personId)/images"
        requestJson(path: path, completion: completion)
    }
    
    /// Get the images that this person has been tagged in.
    public func getPersonsTaggedImages(personId: Int, page: Int! = 1, completion: @escaping (_ data: TmdbGetPersonsTaggedImagesResponse?) -> Void) {
        let path = "/person/\(personId)/tagged_images"
        
        var queries: [String : Any] = [:]
        queries[TmdbKey.language] = language
        queries[TmdbKey.page] = page
        
        requestJson(path: path, queries: queries, completion: completion)
    }
    
    /// Get the list of popular people on TMDb. This list updates daily.
    public func getPopularPeople(page: Int! = 1, completion: @escaping (_ data: TmdbGetPopularPeopleResponse?) -> Void) {
        let path = "/person/popular"
        
        var queries: [String : Any] = [:]
        queries[TmdbKey.language] = language
        
        requestJson(path: path, queries: queries, completion: completion)
    }
    
    
    //MARK: Reviews
    
    public func getReviewDetails(reviewId: String, completion: @escaping (_ data: TmdbReview?) -> Void) {
        let path = "/review/\(reviewId)"
        requestJson(path: path, completion: completion)
    }
    
    
    //MARK: Search
    
    /// Search for companies.
    ///
    /// - Parameters:
    ///   - query: Pass a text query to search. This value should be URI encoded. minLength: 1
    public func searchForCompanies(query: String, page: Int! = 1, completion: @escaping (_ data: TmdbSearchForCompaniesResponse?) -> Void) {
        let path = "/search/company"
        
        var queries: [String : Any] = [:]
        queries[TmdbKey.page] = page
        if query.characters.count > 0 {
            queries[TmdbKey.query] = query
        }
        
        requestJson(path: path, queries: queries, completion: completion)
    }
    
    /// Search for keywords.
    ///
    /// - Parameters:
    ///   - query: Pass a text query to search. This value should be URI encoded.
    ///     - minLength: 1
    public func searchForKeywords(query: String, page: Int! = 1, completion: @escaping (_ data: TmdbSearchForKeywordsResponse?) -> Void){
        let path = "/search/keyword"
        
        var queries: [String : Any] = [:]
        queries[TmdbKey.page] = page
        if query.characters.count > 0 {
            queries[TmdbKey.query] = query
        }
        requestJson(path: path, queries: queries, completion: completion)
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
    public func searchForMovies(query: String, page: Int! = 1, includeAdult: Bool! = false, region: String? = nil, year: Int? = nil, primaryReleaseYear: Int? = nil, completion: @escaping (_ data: TmdbSearchForMoviesResponse?) -> Void) {
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
        
        requestJson(path: path, queries: queries, completion: completion)
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
    public func multiSearch(query: String, page: Int! = 1, includeAdult: Bool! = false, region: String? = nil, completion: @escaping (_ data: TmdbMultiSearchResponse?) -> Void) {
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
        
        requestJson(path: path, queries: queries, completion: completion)
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
    public func searchForPeople(query: String, page: Int! = 1, includeAdult: Bool? = false, region: String? = nil, completion: @escaping (_ data: TmdbSearchForPeopleResponse?) -> Void) {
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
        
        requestJson(path: path, queries: queries, completion: completion)
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
    public func searchForTVShows(query: String, page: Int! = 1, firstAirDate: Int? = nil, completion: @escaping (_ data: TmdbSearchForTVShowsResponse?) -> Void) {
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
        
        requestJson(path: path, queries: queries, completion: completion)
    }
    
    
    //MARK: TVShows
    
    /// Get the primary TV show details by id.
    public func getTVShowDetails(tvId: Int, completion: @escaping (_ data: TmdbTVShow?) -> Void) {
        let path = "/tv/\(tvId)"
        
        var queries: [String : Any] = [:]
        queries[TmdbKey.language] = language
        
        requestJson(path: path, queries: queries, completion: completion)
    }
    
    
    /// Grab the following account states for a session:
    /// - TV show rating
    /// - If it belongs to your watchlist
    /// - If it belongs to your favourite list
    public func getTvShowAccountStates(tvId: Int, completion: @escaping (_ data: TmdbGetAccountStatesResponse?) -> Void) {
        let path = "/tv/\(tvId)/account_states"
        
        var queries: [String : Any] = [:]
        queries[TmdbKey.language] = language
        if let sessionId = Tmdb.shared.auth.sessionId.value { queries[TmdbKey.session_id] = sessionId }
        requestJson(path: path, queries: queries, completion: completion)
    }
    
    /// Returns all of the alternative titles for a TV show.
    public func getTVShowAlternativeTitles(tvId: Int, completion: @escaping (_ data: TmdbGetTVShowsAlternativeTitlesResponse?) -> Void) {
        let path = "/tv/\(tvId)/alternative_titles"
        
        var queries: [String : Any] = [:]
        queries[TmdbKey.language] = language
        
        requestJson(path: path, queries: queries, completion: completion)
    }
    
    /// Get the list of content ratings (certifications) that have been added to a TV show.
    public func getTVShowContentRatings(tvId: Int, completion: @escaping (_ data: TmdbGetTVShowsContentRatingsResponse?) -> Void) {
        let path = "/tv/\(tvId)/content_ratings"
        
        var queries: [String : Any] = [:]
        queries[TmdbKey.language] = language
        
        requestJson(path: path, queries: queries, completion: completion)
    }
    
    /// Get the credits (cast and crew) that have been added to a TV show.
    public func getTVShowCredits(tvId: Int, completion: @escaping (_ data: TmdbGetTVShowsCreditsResponse?) -> Void) {
        let path = "/tv/\(tvId)/credits"
        
        var queries: [String : Any] = [:]
        queries[TmdbKey.language] = language
        
        requestJson(path: path, queries: queries, completion: completion)
    }
    
    /// Get the external ids for a TV show. We currently support the following external sources.
    /// - IMDB ID
    /// - Freebase MID
    /// - Freebase ID
    /// - TVDB ID
    /// - TVRage ID
    public func getTVShowExternalIds(tvId: Int, completion: @escaping (_ data: TmdbGetTVShowsExternalIdsResponse?) -> Void) {
        let path = "/tv/\(tvId)/external_ids"
        
        var queries: [String : Any] = [:]
        queries[TmdbKey.language] = language
        
        requestJson(path: path, queries: queries, completion: completion)
    }
    
    /// Get the images that belong to a TV show. Querying images with a language parameter will filter the results. If you want to include a fallback language (especially useful for backdrops) you can use the include_image_language parameter. This should be a comma seperated value like so: include_image_language=en,null.
    public func getTVShowImages(tvId: Int, includeImageLanguage: String? = nil, completion: @escaping (_ data: TmdbGetTVShowsImagesResponse?) -> Void) {
        let path = "/tv/\(tvId)/images"
        
        var queries: [String : Any] = [:]
        queries[TmdbKey.language] = language
        
        if let includeImageLanguage = includeImageLanguage {
            queries[TmdbKey.include_image_language] = includeImageLanguage
        }
        
        requestJson(path: path, queries: queries, completion: completion)
    }
    
    /// Get the keywords that have been added to a TV show.
    public func getTVShowKeywords(tvId: Int, completion: @escaping (_ data: TmdbGetTVShowsKeywordsResponse?) -> Void) {
        let path = "/tv/\(tvId)/keywords"
        requestJson(path: path, completion: completion)
    }
    
    /// Get the list of TV show recommendations for this item.
    public func getRecommendedTVShows(tvId: Int, page: Int! = 1, completion: @escaping (_ data: TmdbGetTVShowsRecommendationsResponse?) -> Void) {
        let path = "/tv/\(tvId)/recommendations"
        requestJson(path: path, completion: completion)
    }
    
    /// Get a list of similar TV shows. These items are assembled by looking at keywords and genres.
    public func getSimilarTVShows(tvId: Int, page: Int! = 1, completion: @escaping (_ data: TmdbGetTVShowsSimilarResponse?) -> Void) {
        let path = "/tv/\(tvId)/similar"
        requestJson(path: path, completion: completion)
    }
    
    /// Get a list of the translations that exist for a TV show.
    public func getTVShowTranslations(tvId: Int, completion: @escaping (_ data: TmdbGetTVShowsTranslationsResponse?) -> Void) {
        let path = "/tv/\(tvId)/translations"
        
        var queries: [String : Any] = [:]
        queries[TmdbKey.language] = language
        
        requestJson(path: path, queries: queries, completion: completion)
    }
    
    /// Get the videos that have been added to a TV show.
    public func getTVShowsVideos(tvId: Int, completion: @escaping (_ data: TmdbGetTVShowsVideosResponse?) -> Void) {
        let path = "/tv/\(tvId)/videos"
        
        var queries: [String : Any] = [:]
        queries[TmdbKey.language] = language
        
        requestJson(path: path, queries: queries, completion: completion)
    }
    
    /// Rate a TV show.
    public func rateTVShow(tvId: Int, value: TmdbRatingScale, completion: @escaping (_ data: TmdbResponse?) -> Void) {
        let path = "/tv/\(tvId)/rating"
        
        let body = TmdbPostRateTVShowBody(value: value)
        
        var queries: [String : Any] = [:]
        if let sessionId = Tmdb.shared.auth.sessionId.value { queries[TmdbKey.session_id] = sessionId }
        
        postJson(path: path, queries: queries, body: body, completion: completion)
    }
    
    /// Remove your rating for a TV show.
    public func deleteTVShowRating(tvId: Int, completion: @escaping (_ data: TmdbResponse?) -> Void)  {
        let path = "/tv/\(tvId)/rating"
        
        var queries: [String : Any] = [:]
        if let sessionId = Tmdb.shared.auth.sessionId.value { queries[TmdbKey.session_id] = sessionId }
        
        delete(path: path, queries: queries, completion: completion)
    }
    
    /// Get a list of TV shows that are airing today. This query is purely day based as we do not currently support airing times. You can specify a timezone to offset the day calculation. Without a specified timezone, this query defaults to EST (Eastern Time UTC-05:00).
    public func getAiringTodayTVShows(page: Int! = 1, timezone: String? = nil, completion: @escaping (_ data: TmdbGetTVShowsAiringTodayResponse?) -> Void) {
        let path = "/tv/airing_today"
        
        var queries: [String : Any] = [:]
        queries[TmdbKey.language] = language
        queries[TmdbKey.page] = page
        
        if let timezone = timezone {
            queries[TmdbKey.timezone] = timezone
        }
        
        requestJson(path: path, queries: queries, completion: completion)
    }
    
    /// Get a list of shows that are currently on the air. This query looks for any TV show that has an episode with an air date in the next 7 days.
    public func getOnTheAirTVShows(page: Int! = 1, completion: @escaping (_ data: TmdbGetTVShowsOnTheAirResponse?) -> Void) {
        let path = "/tv/on_the_air"
        
        var queries: [String : Any] = [:]
        queries[TmdbKey.language] = language
        queries[TmdbKey.page] = page
        
        requestJson(path: path, queries: queries, completion: completion)
    }
    
    /// Get a list of the current popular TV shows on TMDb. This list updates daily.
    public func getPopularTVShows(page: Int! = 1, completion: @escaping (_ data: TmdbGetPopularTVShowsResponse?) -> Void) {
        let path = "/tv/popular"
        
        var queries: [String : Any] = [:]
        queries[TmdbKey.language] = language
        queries[TmdbKey.page] = page
        
        requestJson(path: path, queries: queries, completion: completion)
    }
    
    /// Get a list of the top rated TV shows on TMDb.
    public func getTopRatedTVShows(page: Int! = 1, completion: @escaping (_ data: TmdbGetTopRatedTVShowsResponse?) -> Void) {
        let path = "/tv/top_rated"
        
        var queries: [String : Any] = [:]
        queries[TmdbKey.language] = language
        queries[TmdbKey.page] = page
        
        requestJson(path: path, queries: queries, completion: completion)
    }
    
    
    //MARK: TV Seasons
    
    /// Get the TV season details by id.
    public func getTVSeasonDetails(tvId: Int, seasonNumber: Int, completion: @escaping (_ data: TmdbTVSeason?) -> Void) {
        let path = "/tv/\(tvId)/season/\(seasonNumber)"
        
        var queries: [String : Any] = [:]
        queries[TmdbKey.language] = language
        
        requestJson(path: path, queries: queries, completion: completion)
    }
    
    /// Returns all of the user ratings for the season's episodes.
    public func getTVSeasonAccountStates(tvId: Int, seasonNumber: Int, completion: @escaping (_ data: TmdbGetAccountStatesResponse?) -> Void) {
        let path = "/tv/\(tvId)/season/\(seasonNumber)/account_states"
        
        var queries: [String : Any] = [:]
        queries[TmdbKey.language] = language
        if let sessionId = Tmdb.shared.auth.sessionId.value { queries[TmdbKey.session_id] = sessionId }
        
        requestJson(path: path, queries: queries, completion: completion)
    }
    
    /// Get the credits for TV season.
    public func getTVSeasonsCredits(tvId: Int, seasonNumber: Int, completion: @escaping (_ data: TmdbGetTVSeasonCreditsResponse?) -> Void) {
        let path = "/tv/\(tvId)/season/\(seasonNumber)/credits"
        
        var queries: [String : Any] = [:]
        queries[TmdbKey.language] = language
        
        requestJson(path: path, queries: queries, completion: completion)
    }
    
    /// Get the external ids for a TV season. We currently support the following external sources.
    /// - Freebase MID
    /// - Freebase ID
    /// - TVDB ID
    /// - TVRage ID
    public func getTVSeasonsExternalIds(tvId: Int, seasonNumber: Int, completion: @escaping (_ data: TmdbGetTVSeasonExternalIdsResponse?) -> Void) {
        let path = "/tv/\(tvId)/season/\(seasonNumber)/external_ids"
        
        var queries: [String : Any] = [:]
        queries[TmdbKey.language] = language
        
        requestJson(path: path, queries: queries, completion: completion)
    }
    
    ///Querying images with a language parameter will filter the results. If you want to include a fallback language (especially useful for backdrops) you can use the include_image_language parameter. This should be a comma seperated value like so: include_image_language=en,null.
    public func getTVSeasonsImages(tvId: Int, seasonNumber: Int, includeImageLanguage: String? = nil, completion: @escaping (_ data: TmdbGetTVSeasonImagesResponse?) -> Void) {
        let path = "/tv/\(tvId)/season/\(seasonNumber)/images"
        
        var queries: [String : Any] = [:]
        queries[TmdbKey.language] = language
        
        if let includeImageLanguage = includeImageLanguage{
            queries[TmdbKey.include_image_language] = includeImageLanguage
        }
        
        requestJson(path: path, queries: queries, completion: completion)
    }
    
    /// Get the videos that have been added to a TV season.
    public func getTVSeasonsVideos(tvId: Int, seasonNumber: Int, completion: @escaping (_ data: TmdbGetTVSeasonVideosResponse?) -> Void) {
        let path = "/tv/\(tvId)/season/\(seasonNumber)/videos"
        
        var queries: [String : Any] = [:]
        queries[TmdbKey.language] = language
        
        requestJson(path: path, queries: queries, completion: completion)
    }
    
    
    //MARK: TV Episodes
    
    /// Get the TV episode details by id.
    public func getTVEpisodeDetails(tvId: Int, seasonNumber: Int, episodeNumber: Int, completion: @escaping (_ data: TmdbTVEpisode?) -> Void) {
        let path = "/tv/\(tvId)/season/\(seasonNumber)/episode/\(episodeNumber)"
        
        var queries: [String : Any] = [:]
        queries[TmdbKey.language] = language
        
        requestJson(path: path, queries: queries, completion: completion)
    }
    
    /// Get your rating for a episode.
    public func getTVEpisodeAccountStates(tvId: Int, seasonNumber: Int, episodeNumber: Int, completion: @escaping (_ data: TmdbGetAccountStatesResponse?) -> Void) {
        let path = "/tv/\(tvId)/season/\(seasonNumber)/episode/\(episodeNumber)/account_states"
        
        var queries: [String : Any] = [:]
        if let sessionId = Tmdb.shared.auth.sessionId.value { queries[TmdbKey.session_id] = sessionId }
        
        requestJson(path: path, queries: queries, completion: completion)
    }
    
    /// Get the credits (cast, crew and guest stars) for a TV episode.
    public func getTVEpisodeCredits(tvId: Int, seasonNumber: Int, episodeNumber: Int, completion: @escaping (_ data: TmdbGetTVEpisodeCreditsResponse?) -> Void) {
        let path = "/tv/\(tvId)/season/\(seasonNumber)/episode/\(episodeNumber)/credits"
        requestJson(path: path, completion: completion)
    }
    
    /// Get the external ids for a TV episode. We currently support the following external sources.
    /// - IMDB ID
    /// - Freebase MID
    /// - Freebase ID
    /// - TVDB ID
    /// - TVRage ID
    public func getTVEpisodeExternalIds(tvId: Int, seasonNumber: Int, episodeNumber: Int, completion: @escaping (_ data: TmdbGetTVEpisodeExternalIDsResponse?) -> Void) {
        let path = "/tv/\(tvId)/season/\(seasonNumber)/episode/\(episodeNumber)/external_ids"
        requestJson(path: path, completion: completion)
    }
    
    /// Get the images that belong to a TV episode. Querying images with a language parameter will filter the results. If you want to include a fallback language (especially useful for backdrops) you can use the include_image_language parameter. This should be a comma seperated value like so: include_image_language=en,null.
    public func getTVEpisodeImages(tvId: Int, seasonNumber: Int, episodeNumber: Int, includeImageLanguage: String? = nil, completion: @escaping (_ data: TmdbGetTVEpisodeImagesResponse?) -> Void) {
        let path = "/tv/\(tvId)/season/\(seasonNumber)/episode/\(episodeNumber)/images"
        
        guard let includeImageLanguage = includeImageLanguage else {
            requestJson(path: path, completion: completion)
            return
        }
        
        var queries: [String : Any] = [:]
        queries[TmdbKey.include_image_language] = includeImageLanguage
        
        requestJson(path: path, queries: queries, completion: completion)
    }
    
    /// Rate a TV episode.
    public func rateTVEpisode(tvId: Int, seasonNumber: Int, episodeNumber: Int, value: TmdbRatingScale, completion: @escaping (_ data: TmdbResponse?) -> Void) {
        let path = "/tv/\(tvId)/season/\(seasonNumber)/episode/\(episodeNumber)/rating"
        
        let body = TmdbPostRateTVEpisodeBody(value: value)
        
        var queries: [String : Any] = [:]
        if let sessionId = Tmdb.shared.auth.sessionId.value { queries[TmdbKey.session_id] = sessionId }
        
        postJson(path: path, queries: queries, body: body, completion: completion)
    }
    
    /// Remove your rating for a TV episode.
    public func deleteTVEpisodeRating(tvId: Int, seasonNumber: Int, episodeNumber: Int, completion: @escaping (_ data: TmdbResponse?) -> Void) {
        let path = "/tv/\(tvId)/season/\(seasonNumber)/episode/\(episodeNumber)/rating"
        
        var queries: [String : Any] = [:]
        if let sessionId = Tmdb.shared.auth.sessionId.value { queries[TmdbKey.session_id] = sessionId }
        
        delete(path: path, queries: queries, completion: completion)
    }
    
    /// Get the videos that have been added to a TV episode.
    public func getTVEpisodeVideos(tvId: Int, seasonNumber: Int, episodeNumber: Int, completion: @escaping (_ data: TmdbGetTVEpisodeVideosResponse?) -> Void){
        let path = "/tv/\(tvId)/season/\(seasonNumber)/episode/\(episodeNumber)/videos"
        
        var queries: [String : Any] = [:]
        queries[TmdbKey.language] = language
        
        requestJson(path: path, queries: queries, completion: completion)
    }
}
