//
//  ContentRating.swift
//  MyFavoriteMovies
//
//  Created by Kamil Swojak on 06/02/2017.
//  Copyright © 2017 Kamil Swojak. All rights reserved.
//

import Foundation
import ObjectMapper

public struct TmdbContentRating: Mappable{
    
    public var iso_3166_1: String?
    public var rating: String?
    public init?(map: Map) {}
    
    mutating public func mapping(map: Map) {
        iso_3166_1 <- map["iso_3166_1"]
        rating <- map["rating"]
    }
}
