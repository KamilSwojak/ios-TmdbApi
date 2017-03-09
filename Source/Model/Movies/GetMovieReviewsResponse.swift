//
//  GetMovieReviewsResponse.swift
//  MyFavoriteMovies
//
//  Created by Kamil Swojak on 13/01/2017.
//  Copyright © 2017 Kamil Swojak. All rights reserved.
//

import Foundation
import ObjectMapper

public class TmdbGetMovieReviewsResponse: TmdbResponse{
    
    public var id: Int?
    public var page: Int?
    public var total_pages: Int?
    public var total_results: Int?
    
    public var results: [TmdbReview]?
    
    override public func mapping(map: Map) {
        super.mapping(map: map)
        id <- map["id"]
        page <- map["page"]
        total_pages <- map["total_pages"]
        total_results <- map["total_results"]
        results <- map["results"]
    }

}
