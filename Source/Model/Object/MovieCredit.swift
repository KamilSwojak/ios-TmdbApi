//
//  MovieCredit.swift
//  MyFavoriteMovies
//
//  Created by Kamil Swojak on 13/01/2017.
//  Copyright © 2017 Kamil Swojak. All rights reserved.
//

import Foundation
import ObjectMapper

public class TmdbMovieCast: TmdbResponse{
    
    public var cast_id: Int?
    public var character: String?
    public var credit_id: String?
    public var id: Int?
    public var name: String?
    public var order: Int?
    public var profile_path: String?
    
    override public func mapping(map: Map) {
        super.mapping(map: map)
        cast_id <- map["cast_id"]
        character <- map["character"]
        credit_id <- map["credit_id"]
        id <- map["id"]
        name <- map["name"]
        order <- map["order"]
        profile_path <- map["profile_path"]
    }
}

public class TmdbPersonsMovieCast: TmdbResponse{
    
    public var adult: Bool?
    public var character: String?
    public var credit_id: String?
    public var id: Int?
    public var original_title: String?
    public var poster_path: String?
    public var release_date: String?
    public var title: String?
    
    override public func mapping(map: Map) {
        super.mapping(map: map)
        adult <- map["adult"]
        character <- map["character"]
        credit_id <- map["credit_id"]
        id <- map["id"]
        original_title <- map["original_title"]
        poster_path <- map["poster_path"]
        release_date <- map["release_date"]
        title <- map["title"]
    }
}

public class TmdbMovieCrew: TmdbResponse{
    
    public var credit_id: Int?
    public var department: String?
    public var id: Int?
    public var job: String?
    public var name: String?
    public var profile_path: String?
    
    override public func mapping(map: Map) {
        super.mapping(map: map)
        credit_id <- map["credit_id"]
        department <- map["department"]
        credit_id <- map["credit_id"]
        id <- map["id"]
        job <- map["job"]
        name <- map["name"]
        profile_path <- map["profile_path"]
    }
}

public class TmdbPersonsMovieCrew: TmdbResponse{
    
    public var adult: Bool?
    public var credit_id: Int?
    public var department: String?
    public var id: Int?
    public var job: String?
    public var original_title: String?
    public var poster_path: String?
    public var release_date: String?
    public var title: String?
    
    override public func mapping(map: Map) {
        super.mapping(map: map)
        adult <- map["adult"]
        credit_id <- map["credit_id"]
        department <- map["department"]
        id <- map["id"]
        job <- map["job"]
        original_title <- map["original_title"]
        poster_path <- map["poster_path"]
        release_date <- map["release_date"]
        title <- map["title"]
    }
}
