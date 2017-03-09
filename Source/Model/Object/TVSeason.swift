//
//  TVSeason.swift
//  MyFavoriteMovies
//
//  Created by Kamil Swojak on 13/01/2017.
//  Copyright © 2017 Kamil Swojak. All rights reserved.
//

import Foundation
import ObjectMapper

public class TmdbTVSeason: TmdbResponse{
    
    public var _id: String?
    public var air_date: String?
    public var episodes: [TmdbTVEpisode]?
    public var name: String?
    public var overview: String?
    public var id: Int?
    public var poster_path: String?
    public var season_number: Int?
    
    override public func mapping(map: Map) {
        super.mapping(map: map)
        id <- map["_id"]
        air_date <- map["air_date"]
        episodes <- map["episodes"]
        name <- map["name"]
        overview <- map["overview"]
        id <- map["id"]
        poster_path <- map["poster_path"]
        season_number <- map["season_number"]
    }
}
