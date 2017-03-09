//
//  GetTVEpisodeCredits.swift
//  MyFavoriteMovies
//
//  Created by Kamil Swojak on 13/01/2017.
//  Copyright © 2017 Kamil Swojak. All rights reserved.
//

import Foundation
import ObjectMapper

public class TmdbGetTVEpisodeCreditsResponse: TmdbResponse{
    
    public var cast: [TmdbTVShowCast]?
    public var crew: [TmdbTVShowCrew]?
    public var guest_stars: [TmdbTVShowCast]?
    public var id: Int?
    
    override public func mapping(map: Map) {
        super.mapping(map: map)
        cast <- map["cast"]
        crew <- map["crew"]
        guest_stars <- map["guest_stars"]
        id <- map["id"]
    }
}

