//
//  File.swift
//  MyFavoriteMovies
//
//  Created by Kamil Swojak on 13/01/2017.
//  Copyright © 2017 Kamil Swojak. All rights reserved.
//

import Foundation
import ObjectMapper

public class TmdbGetAccountStatesResponse: TmdbResponse{
    
    public var id: Int?
    public var favorite: Bool?
    public var rated: Float?
    public var watchlist: Bool?
    
    override public func mapping(map: Map) {
        super.mapping(map: map)
        id <- map["id"]
        favorite <- map["favorite"]
        rated <- map["rated.value"]
        watchlist <- map["watchlist"]
    }
}
