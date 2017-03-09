//
//  GetCollectionImages.swift
//  MyFavoriteMovies
//
//  Created by Kamil Swojak on 17/01/2017.
//  Copyright © 2017 Kamil Swojak. All rights reserved.
//

import Foundation
import ObjectMapper

public class TmdbGetCollectionImagesResponse: TmdbResponse{
    
    public var id: Int?
    public var backdrops: [TmdbImage]?
    public var posters: [TmdbImage]?
    
    override public func mapping(map: Map) {
        super.mapping(map: map)
        id <- map["id"]
        backdrops <- map["backdrops"]
        posters <- map["posters"]
    }
}
