//
//  Review.swift
//  MyFavoriteMovies
//
//  Created by Kamil Swojak on 13/01/2017.
//  Copyright © 2017 Kamil Swojak. All rights reserved.
//

import Foundation
import ObjectMapper

public class TmdbReview: TmdbResponse{
    
    public var id: String?
    public var author: String?
    public var content: String?
    public var iso_639_1: String?
    public var media_id: Int?
    public var media_title: String?
    public var media_type: String?
    public var url: String?
    
    override public func mapping(map: Map) {
        super.mapping(map: map)
        id <- map["id"]
        author <- map["author"]
        content <- map["content"]
        iso_639_1 <- map["iso_639_1"]
        media_id <- map["media_id"]
        media_title <- map["media_title"]
        media_type <- map["media_type"]
        url <- map["url"]
    }
}
