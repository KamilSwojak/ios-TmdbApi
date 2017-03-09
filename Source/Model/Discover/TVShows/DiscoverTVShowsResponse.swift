//
//  DiscoverTVShowsResponse.swift
//  MyFavoriteMovies
//
//  Created by Kamil Swojak on 14/01/2017.
//  Copyright © 2017 Kamil Swojak. All rights reserved.
//

import Foundation
import ObjectMapper

public class TmdbDiscoverTVShowsResponse: TmdbResponse{
    
    public var page: Int?
    public var total_pages: Int?
    public var total_results: Int?
    public var results: [TmdbTVShow]?
    
    override public func mapping(map: Map) {
        super.mapping(map: map)
        page <- map["page"]
        total_pages <- map["total_pages"]
        total_results <- map["total_results"]
        results <- map["results"]
    }
}
