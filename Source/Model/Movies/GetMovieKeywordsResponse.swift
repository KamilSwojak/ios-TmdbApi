//
//  GetMovieKeywords.swift
//  MyFavoriteMovies
//
//  Created by Kamil Swojak on 13/01/2017.
//  Copyright © 2017 Kamil Swojak. All rights reserved.
//

import Foundation
import ObjectMapper

public class TmdbGetMovieKeywordsResponse: TmdbResponse{
    
    public var id: Int?
    public var keywords: [TmdbKeyword]?
    
    override public func mapping(map: Map) {
        super.mapping(map: map)
        id <- map["id"]
        keywords <- map["keywords"]
    }
}
