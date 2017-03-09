//
//  CreatedList.swift
//  MyFavoriteMovies
//
//  Created by Kamil Swojak on 13/01/2017.
//  Copyright © 2017 Kamil Swojak. All rights reserved.
//

import Foundation
import ObjectMapper

public class TmdbUserCreatedList: TmdbResponse{
    
    public var description: String?
    public var favorite_count: Int?
    public var id: Int?
    public var item_count: Int?
    public var iso_639_1: String?
    public var list_type: String?
    public var name: String?
    public var poster_path: String?
    
    override public func mapping(map: Map) {
        description <- map["description"]
        favorite_count <- map["favorite_count"]
        id <- map["id"]
        item_count <- map["item_count"]
        iso_639_1 <- map["iso_639_1"]
        list_type <- map["list_type"]
        name <- map["name"]
        poster_path <- map["poster_path"]
    }
}

