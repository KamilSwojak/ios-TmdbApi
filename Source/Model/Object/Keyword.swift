//
//  Keywork.swift
//  MyFavoriteMovies
//
//  Created by Kamil Swojak on 14/01/2017.
//  Copyright © 2017 Kamil Swojak. All rights reserved.
//

import Foundation
import ObjectMapper

public class TmdbKeyword: TmdbResponse{
    
    public var id: Int?
    public var name: String?
    
    override public func mapping(map: Map) {
        id <- map["id"]
        name <- map["name"]
    }
}
