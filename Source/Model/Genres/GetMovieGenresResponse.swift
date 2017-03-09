//
//  GetMovieGenresResponse.swift
//  MyFavoriteMovies
//
//  Created by Kamil Swojak on 17/01/2017.
//  Copyright © 2017 Kamil Swojak. All rights reserved.
//

import Foundation
import ObjectMapper

public class TmdbGetMovieGenresResponse: TmdbResponse{
    
    public var genres: [TmdbGenre]?
    
    override public func mapping(map: Map) {
        super.mapping(map: map)
        genres <- map["genres"]
    }
}
