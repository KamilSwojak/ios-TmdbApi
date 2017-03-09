//
//  Movie.swift
//  MyFavoriteMovies
//
//  Created by Kamil Swojak on 13/01/2017.
//  Copyright © 2017 Kamil Swojak. All rights reserved.
//

import Foundation
import ObjectMapper

public class TmdbMovie : TmdbResponse{
    
    public var adult: Bool?
    public var backdrop_path: String?
    public var belongs_to_collection: Any?
    public var budget: Int?
    public var genres: [TmdbGenre]?
    public var homepage: String?
    public var id: Int?
    public var imdb_id: String?
    public var original_lanugage: String?
    public var original_title: String?
    public var title: String?
    public var overview: String?
    public var popularity: Float?
    public var poster_path: String?
    public var production_companies: [TmdbProductionCompany]?
    public var production_countries: [TmdbProductionCountry]?
    public var release_date: String?
    public var revenue: Int?
    public var runtime: Int?
    public var spoken_languages: [TmdbSpokenLanguage]?
    public var status: String?
    public var tagline: String?
    public var video: Bool?
    public var vote_average: Float?
    public var vote_count: Int?
    
    override public func mapping(map: Map) {
        adult <- map["adult"]
        backdrop_path <- map["backdrop_path"]
        belongs_to_collection <- map["belongs_to_collection"]
        budget <- map["budget"]
        genres <- map["genres"]
        homepage <- map["homepage"]
        id <- map["id"]
        imdb_id <- map["imdb_id"]
        original_lanugage <- map["original_lanugage"]
        original_title <- map["original_title"]
        overview <- map["overview"]
        popularity <- map["popularity"]
        poster_path <- map["poster_path"]
        production_companies <- map["production_companies"]
        production_countries <- map["production_countries"]
        release_date <- map["release_date"]
        revenue <- map["revenue"]
        runtime <- map["runtime"]
        spoken_languages <- map["spoken_languages"]
        status <- map["status"]
        tagline <- map["tagline"]
        video <- map["video"]
        vote_average <- map["vote_average"]
        vote_count <- map["vote_count"]
        title <- map["title"]
    }
}
