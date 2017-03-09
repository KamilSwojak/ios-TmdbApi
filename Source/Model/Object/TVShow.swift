//
//  TVShow.swift
//  MyFavoriteMovies
//
//  Created by Kamil Swojak on 13/01/2017.
//  Copyright © 2017 Kamil Swojak. All rights reserved.
//

import Foundation
import ObjectMapper

public class TmdbTVShow: TmdbResponse{
    
    public var backdrop_path: String?
    public var created_by: [TmdbPerson]?
    public var episode_run_time: [Int]?
    public var first_air_date: String?
    public var genres: [TmdbGenre]?
    public var homepage: String?
    public var id: Int?
    public var in_production: Bool?
    public var languages: [String]?
    public var last_air_date: String?
    public var name: String?
    public var networks: [TmdbNetwork]?
    public var number_of_episodes: Int?
    public var number_of_seasons: Int?
    public var origin_country: [String]?
    public var original_languages: String?
    public var original_name: String?
    public var overview: String?
    public var popularity: String?
    public var poster_path: String?
    public var production_companies: [TmdbProductionCompany]?
    public var seasons: [TmdbSeason]?
    public var status: String?
    public var type: String?
    public var vote_average: String?
    public var vote_count: Int?
    
    override public func mapping(map: Map) {
        super.mapping(map: map)
        backdrop_path <- map["backdrop_path"]
        created_by <- map["created_by"]
        episode_run_time <- map["episode_run_time"]
        first_air_date <- map["first_air_date"]
        genres <- map["genres"]
        homepage <- map["homepage"]
        id <- map["id"]
        in_production <- map["in_production"]
        languages <- map["languages"]
        last_air_date <- map["last_air_date"]
        name <- map["name"]
        networks <- map["networks"]
        number_of_episodes <- map["number_of_episodes"]
        number_of_seasons <- map["number_of_seasons"]
        origin_country <- map["origin_country"]
        original_languages <- map["original_languages"]
        original_name <- map["original_name"]
        overview <- map["overview"]
        popularity <- map["popularity"]
        poster_path <- map["poster_path"]
        production_companies <- map["production_companies"]
        seasons <- map["seasons"]
        status <- map["status"]
        type <- map["type"]
        vote_average <- map["vote_average"]
        vote_count <- map["vote_count"]
    }
}
