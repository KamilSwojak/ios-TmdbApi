//
//  GetCreditDetailsResponse.swift
//  MyFavoriteMovies
//
//  Created by Kamil Swojak on 14/01/2017.
//  Copyright © 2017 Kamil Swojak. All rights reserved.
//

import Foundation
import ObjectMapper

public class TmdbGetCreditDetailsResponse: TmdbResponse{
    public var credit_type: String?
    public var department: String?
    public var job: String?
    public var media: TmdbCreditMedia?
    public var media_type: String?
    public var id: String?
    public var person: TmdbPerson?
    
    
    override public func mapping(map: Map) {
        super.mapping(map: map)
        
        credit_type <- map["credit_type"]
        department <- map["department"]
        job <- map["job"]
        media <- map["media"]
        media_type <- map["media_type"]
        id <- map["id"]
        person <- map["person"]
    }
}

public class TmdbCreditMedia: Mappable{
    
    public var id: Int?
    public var name: String?
    public var original_name: String?
    public var character: String?
    public var seasons: [TmdbSeason]?
    
    required public init?(map: Map) {}
    
    public func mapping(map: Map) {
        id <- map["id"]
        name <- map["name"]
        original_name <- map["original_name"]
        character <- map["character"]
        seasons <- map["seasons"]
    }
}
