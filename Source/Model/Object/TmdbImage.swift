//
//  TmdbImage.swift
//  MyFavoriteMovies
//
//  Created by Kamil Swojak on 13/01/2017.
//  Copyright © 2017 Kamil Swojak. All rights reserved.
//

import Foundation
import ObjectMapper

public class TmdbImage: TmdbResponse{
    
    public var aspect_ratio: String?
    public var file_path: String?
    public var height: Int?
    public var iso_539_1: String?
    public var vote_average: Int?
    public var vote_count: Int?
    public var width: Int?
    
    override public func mapping(map: Map) {
        super.mapping(map: map)
        aspect_ratio <- map["aspect_ratio"]
        file_path <- map["file_path"]
        height <- map["height"]
        iso_539_1 <- map["iso_539_1"]
        vote_average <- map["vote_average"]
        vote_count <- map["vote_count"]
        width <- map["width"]
    }
}
