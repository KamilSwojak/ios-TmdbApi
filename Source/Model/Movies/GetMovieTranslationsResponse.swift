//
//  GetMovieTranslationsResponse.swift
//  MyFavoriteMovies
//
//  Created by Kamil Swojak on 15/01/2017.
//  Copyright © 2017 Kamil Swojak. All rights reserved.
//

import Foundation
import ObjectMapper

public class TmdbGetMovieTranslationsResponse: TmdbResponse{
    
    public var id: Int?
    public var translations: [TmdbMovieTranslation]?
    
    override public func mapping(map: Map) {
        super.mapping(map: map)
        
        id <- map["id"]
        translations <- map["translations"]
    }
}

public class TmdbMovieTranslation: TmdbResponse{
    
    public var iso_639_1: String?
    public var iso_3166_1: String?
    public var name: String?
    public var english_name: String?
    
    override public func mapping(map: Map) {
        super.mapping(map: map)
        
        iso_639_1 <- map["iso_639_1"]
        iso_3166_1 <- map["iso_3166_1"]
        name <- map["name"]
        english_name <- map["english_name"]
    }
}
