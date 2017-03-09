//
//  GetMovieAlternativeTitles.swift
//  MyFavoriteMovies
//
//  Created by Kamil Swojak on 14/01/2017.
//  Copyright © 2017 Kamil Swojak. All rights reserved.
//

import Foundation
import ObjectMapper

public class TmdbGetMovieAlternativeTitlesResponse: TmdbResponse{
    
    public var id: Int?
    public var titles: [TmdbAlternativeTitle]?
    
    override public func mapping(map: Map) {
        super.mapping(map: map)
        id <- map["id"]
        titles <- map["titles"]
    }
}
