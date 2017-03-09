//
//  GetMovieReleaseDatesResponse.swift
//  MyFavoriteMovies
//
//  Created by Kamil Swojak on 15/01/2017.
//  Copyright © 2017 Kamil Swojak. All rights reserved.
//

import Foundation
import ObjectMapper

public class TmdbGetMovieReleaseDatesResponse: TmdbResponse{
    
    public var id: Int?
    public var results: [TmdbMovieReleaseDateResults]?
    
    override public func mapping(map: Map) {
        super.mapping(map: map)
        id <- map["id"]
        results <- map["results"]
    }
}

public class TmdbMovieReleaseDateResults: TmdbResponse{
    
    public var iso_3166_1: String?
    public var release_dates: [TmdbMovieReleaseDates]?
    
    override public func mapping(map: Map) {
        super.mapping(map: map)
        iso_3166_1 <- map["iso_3166_1"]
        release_dates <- map["release_dates"]
    }
}

public class TmdbMovieReleaseDates: TmdbResponse{
    
    public var certification: String?
    public var iso_639_1: String?
    public var note: String?
    public var release_note: String?
    public var type: TmdbReleaseDateType?
    
    override public func mapping(map: Map) {
        super.mapping(map: map)
        
        certification <- map["certification"]
        iso_639_1 <- map["iso_639_1"]
        note <- map["note"]
        release_note <- map["release_note"]
        
        var intType: Int?
        intType <- map["type"]
        guard let iType = intType, (1...6).contains(iType) else { return }
        type = TmdbReleaseDateType(rawValue: iType)
        
    }
}

public enum TmdbReleaseDateType: Int{
    case Premiere = 1
    case Theatrical_Limited = 2
    case Theatrical = 3
    case Digital = 4
    case Physical = 5
    case TV = 6
}
