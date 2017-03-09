//
//  TVEpisode.swift
//  MyFavoriteMovies
//
//  Created by Kamil Swojak on 13/01/2017.
//  Copyright © 2017 Kamil Swojak. All rights reserved.
//

import Foundation
import ObjectMapper

public class TmdbTVEpisode: TmdbResponse{
    
    public var air_date: String?
    public var crew: [TmdbTVShowCrew]?
    public var guest_stars: [TmdbTVShowCast]?
    public var episode_number: Int?
    public var name: String?
    public var overview: String?
    public var id: Int?
    public var production_code: String?
    public var season_number: Int?
    public var still_path: String?
    public var vote_average: Float?
    public var vote_count: Int?
    
    override public func mapping(map: Map) {
        super.mapping(map: map)
        air_date <- map["air_date"]
        crew <- map["crew"]
        guest_stars <- map["guest_stars"]
        episode_number <- map["episode_number"]
        name <- map["name"]
        overview <- map["overview"]
        id <- map["id"]
        production_code <- map["production_code"]
        season_number <- map["season_number"]
        still_path <- map["still_path"]
        vote_count <- map["vote_count"]
        vote_average <- map["vote_average"]
    }
}
