//
//  GetPersonsExternalIds.swift
//  MyFavoriteMovies
//
//  Created by Kamil Swojak on 13/01/2017.
//  Copyright © 2017 Kamil Swojak. All rights reserved.
//

import Foundation
import ObjectMapper

public class TmdbGetPersonsExternalIdsResponse: TmdbResponse{
    
    public var imdb_id: String?
    public var facebook_id: String?
    public var freebase_mid: String?
    public var freebase_id: String?
    public var tvrage_id: Int?
    public var twitter_id: String?
    public var id: Int?
    
    override public func mapping(map: Map) {
        super.mapping(map: map)
        imdb_id <- map["imdb_id"]
        facebook_id <- map["facebook_id"]
        freebase_mid <- map["freebase_mid"]
        freebase_id <- map["freebase_id"]
        tvrage_id <- map["tvrage_id"]
        twitter_id <- map["twitter_id"]
        id <- map["id"]
    }
}
