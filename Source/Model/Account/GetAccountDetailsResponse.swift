//
//  GetAccountResponse.swift
//  MyFavoriteMovies
//
//  Created by Kamil Swojak on 12/01/2017.
//  Copyright © 2017 Kamil Swojak. All rights reserved.
//

import Foundation
import ObjectMapper

public class TmdbGetAccountDetailsResponse: TmdbResponse {
    
    public var id: Int?
    public var iso_639_1: String?
    public var iso_3166_1: String?
    public var name: String?
    public var include_adult: Bool?
    public var username: String?
    public var gravatar_hash: String?
    
    override public func mapping(map: Map) {
        super.mapping(map: map)
        id <- map["id"]
        iso_639_1 <- map["iso_639_1"]
        iso_3166_1 <- map["iso_3166_1"]
        name <- map["name"]
        include_adult <- map["include_adult"]
        username <- map["username"]
        gravatar_hash <- map["avatar.gravatar.hash"]
    }
}
