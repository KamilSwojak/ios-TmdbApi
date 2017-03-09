//
//  TVShowCredit.swift
//  MyFavoriteMovies
//
//  Created by Kamil Swojak on 13/01/2017.
//  Copyright © 2017 Kamil Swojak. All rights reserved.
//

import Foundation
import ObjectMapper

public class TmdbTVShowCast: TmdbResponse{
    
    public var character: String?
    public var credit_id: String?
    public var id: Int?
    public var name: String?
    public var profile_path: String?
    public var order: Int?
    
    override public func mapping(map: Map) {
        super.mapping(map: map)
        character <- map["character"]
        credit_id <- map["credit_id"]
        id <- map["id"]
        name <- map["name"]
        profile_path <- map["profile_path"]
        order <- map["order"]
    }
}

public class TmdbTVShowCrew: TmdbResponse{
    
    public var credit_id: String?
    public var department: String?
    public var id: Int?
    public var name: String?
    public var job: String?
    public var profile_path: String?
    
    override public func mapping(map: Map) {
        super.mapping(map: map)
        credit_id <- map["credit_id"]
        department <- map["department"]
        id <- map["id"]
        name <- map["name"]
        job <- map["job"]
        profile_path <- map["profile_path"]
    }
}

public class TmdbPersonsTvCrew: TmdbResponse{
    
    public var character: String?
    public var credit_id: String?
    public var episode_count: Int?
    public var first_air_date: String?
    public var id: Int?
    public var name: String?
    public var original_name: String?
    public var poster_path: String?
    
    override public func mapping(map: Map) {
        super.mapping(map: map)
        character <- map["character"]
        credit_id <- map["credit_id"]
        episode_count <- map["episode_count"]
        first_air_date <- map["first_air_date"]
        id <- map["id"]
        name <- map["name"]
        original_name <- map["original_name"]
        poster_path <- map["poster_path"]
    }
}

public class TmdbPersonsTvCast: TmdbResponse{
    
    public var credit_id: String?
    public var department: String?
    public var episode_count: Int?
    public var first_air_date: String?
    public var id: Int?
    public var job: Int?
    public var name: String?
    public var original_name: String?
    public var poster_path: String?
    
    override public func mapping(map: Map) {
        super.mapping(map: map)
        credit_id <- map["credit_id"]
        department <- map["department"]
        episode_count <- map["episode_count"]
        first_air_date <- map["first_air_date"]
        id <- map["id"]
        job <- map["job"]
        name <- map["name"]
        original_name <- map["original_name"]
        poster_path <- map["poster_path"]
    }
}
