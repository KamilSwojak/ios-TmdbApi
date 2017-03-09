//
//  Collection.swift
//  MyFavoriteMovies
//
//  Created by Kamil Swojak on 17/01/2017.
//  Copyright © 2017 Kamil Swojak. All rights reserved.
//

import Foundation
import ObjectMapper

public class TmdbCollection: TmdbResponse{
    
    public var id: Int?
    public var name: String?
    public var overview: String?
    public var poster_path: String?
    public var backdrop_path: String?
    public var parts: [TmdbCollectionPart]?
    
    override public func mapping(map: Map) {
        super.mapping(map: map)
        id <- map["id"]
        name <- map["name"]
        overview <- map["overview"]
        poster_path <- map["poster_path"]
        backdrop_path <- map["backdrop_path"]
        parts <- map["parts"]
    }
}

