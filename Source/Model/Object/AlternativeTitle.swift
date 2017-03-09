//
//  AlternativeTitle.swift
//  MyFavoriteMovies
//
//  Created by Kamil Swojak on 17/01/2017.
//  Copyright © 2017 Kamil Swojak. All rights reserved.
//

import Foundation
import ObjectMapper

public class TmdbAlternativeTitle: TmdbResponse{
    
    public var title: String?
    public var iso_3166_1: String?
    
    override public func mapping(map: Map) {
        super.mapping(map: map)
        
        title <- map["title"]
        iso_3166_1 <- map["iso_3166_1"]
    }
}
