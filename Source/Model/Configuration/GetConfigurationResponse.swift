//
//  GetConfigurationResponse.swift
//  MyFavoriteMovies
//
//  Created by Kamil Swojak on 14/01/2017.
//  Copyright © 2017 Kamil Swojak. All rights reserved.
//

import Foundation
import ObjectMapper

public class TmdbGetConfigurationResponse: TmdbResponse{
    
    public var change_keys: [String]?
    public var images: TmdbImageConfiguration?
    
    override public func mapping(map: Map) {
        super.mapping(map: map)
        change_keys <- map["change_keys"]
        images <- map["images"]
    }
}

public class TmdbImageConfiguration: TmdbResponse{
    
    public var base_url: String?
    public var secure_base_url: String?
    public var backdrop_sizes: [String]?
    public var logo_sizes: [String]?
    public var poster_sizes: [String]?
    public var profile_sizes: [String]?
    public var still_sizes: [String]?
    
    override public func mapping(map: Map) {
        super.mapping(map: map)
        base_url <- map["base_url"]
        secure_base_url <- map["secure_base_url"]
        backdrop_sizes <- map["backdrop_sizes"]
        logo_sizes <- map["logo_sizes"]
        poster_sizes <- map["poster_sizes"]
        profile_sizes <- map["profile_sizes"]
        still_sizes <- map["still_sizes"]
    }
}
