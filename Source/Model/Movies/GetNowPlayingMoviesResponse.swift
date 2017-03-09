//
//  GetNowPlayingMoviesResponse.swift
//  MyFavoriteMovies
//
//  Created by Kamil Swojak on 13/01/2017.
//  Copyright © 2017 Kamil Swojak. All rights reserved.
//

import Foundation
import ObjectMapper

public class TmdbGetNowPlayingMoviesResponse: TmdbResponse{
    
    public var page: Int?
    public var total_pages: Int?
    public var total_results: Int?
    public var results: [TmdbMovie]?
    public var minimum_date: String?
    public var maximum_date: String?
    
    override public func mapping(map: Map) {
        super.mapping(map: map)
        page <- map["page"]
        total_pages <- map["total_pages"]
        total_results <- map["total_results"]
        results <- map["results"]
        minimum_date <- map["dates.minimum"]
        maximum_date <- map["dates.maximum"]
    }
}
