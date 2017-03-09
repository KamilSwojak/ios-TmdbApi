//
//  PostRateTvEpisode.swift
//  MyFavoriteMovies
//
//  Created by Kamil Swojak on 13/01/2017.
//  Copyright © 2017 Kamil Swojak. All rights reserved.
//

import Foundation
import ObjectMapper

public class TmdbPostRateTVEpisodeBody: Mappable{
    
    public var value: Float!
    
    required public init?(map: Map) {}
    
    init(value: TmdbRatingScale) {
        self.value = value.rawValue
    }
    
    public func mapping(map: Map) {
        value <- map["value"]
    }
}
