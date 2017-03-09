//
//  Person.swift
//  MyFavoriteMovies
//
//  Created by Kamil Swojak on 13/01/2017.
//  Copyright © 2017 Kamil Swojak. All rights reserved.
//

import Foundation
import ObjectMapper

public class TmdbPerson: TmdbResponse{
    
    public var adult: Bool?
    public var also_known_as: [String]?
    public var biography: String?
    public var birthday: String?
    public var deathday: String?
    public var gender: TmdbGender?
    public var homepage: String?
    public var id: Int?
    public var imdb_id: String?
    public var name: String?
    public var place_of_birth: String?
    public var popularity: String?
    public var profile_path: String?
    
    override public func mapping(map: Map) {
        super.mapping(map: map)
        adult <- map["adult"]
        also_known_as <- map["also_known_as"]
        biography <- map["biography"]
        birthday <- map["birthday"]
        deathday <- map["deathday"]
        
        var genderInt: Int?
        genderInt <- map["gender"]
        if let g = genderInt {
            gender = TmdbGender(rawValue: g)
        }
        
        homepage <- map["homepage"]
        id <- map["id"]
        imdb_id <- map["imdb_id"]
        name <- map["name"]
        place_of_birth <- map["place_of_birth"]
        popularity <- map["popularity"]
        profile_path <- map["profile_path"]
    }
}


