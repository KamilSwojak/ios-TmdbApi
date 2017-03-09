//
//  CollectionPart.swift
//  MyFavoriteMovies
//
//  Created by Kamil Swojak on 17/01/2017.
//  Copyright © 2017 Kamil Swojak. All rights reserved.
//

import Foundation
import ObjectMapper

public class TmdbCollectionPart: TmdbResponse{
    
    public var adult: Bool?
    public var backdrop_path: String?
    public var genre_ids: [Int]?
    public var id: Int?
    public var original_language: String?
    public var original_title: String?
    public var overview: String?
    public var release_date: String?
    public var poster_path: String?
    public var popularity: Float?
    public var title: String?
    public var video: Bool?
    public var vote_average: Float?
    public var vote_count: Int?
    
    override public func mapping(map: Map) {
        super.mapping(map: map)
        adult <- map["adult"]
        backdrop_path <- map["backdrop_path"]
        genre_ids <- map["genre_ids"]
        id <- map["id"]
        original_language <- map["original_language"]
        original_title <- map["original_title"]
        overview <- map["overview"]
        release_date <- map["release_date"]
        poster_path <- map["poster_path"]
        popularity <- map["popularity"]
        title <- map["title"]
        video <- map["video"]
        vote_average <- map["vote_average"]
        vote_count <- map["vote_count"]
    }
}
