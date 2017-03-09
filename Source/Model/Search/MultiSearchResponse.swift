//
//  MultiSearchResponse.swift
//  MyFavoriteMovies
//
//  Created by Kamil Swojak on 13/01/2017.
//  Copyright © 2017 Kamil Swojak. All rights reserved.
//

import Foundation
import ObjectMapper

public class TmdbMultiSearchResponse: TmdbResponse{
    
    public var movies = [TmdbMovie]()
    public var tv_shows = [TmdbTVShow]()
    public var people = [TmdbPopularPerson]()
    
    override public func mapping(map: Map) {
        super.mapping(map: map)
        
        //results contains Movie, TVShow and PopularPerson
        var results: [Any]?
        results <- map["results"]
        if let results = results{
            
            // iterate over elements,
            // if element has 'release_date' it's movie
            // if element has 'first_air_date' it's tv
            // if element has 'profile_path' it's a person
            for i in 0..<results.endIndex {
                if let element = (results[i] as? Dictionary<String, AnyObject>){
                    
                    if TmdbResponseUtil.isMovie(item: element){
                        var movie: TmdbMovie?
                        movie = TmdbMovie(JSON: element)
                        if let movie = movie {
                            movies.append(movie)
                        }
                    }
                    
                    if TmdbResponseUtil.isTVShow(item: element){
                        var tv: TmdbTVShow?
                        tv = TmdbTVShow(JSON: element)
                        if let tv = tv {
                            tv_shows.append(tv)
                        }
                    }
                    
                    if TmdbResponseUtil.isPerson(item: element) {
                        var person: TmdbPopularPerson?
                        person = TmdbPopularPerson(JSON: element)
                        if let person = person {
                            people.append(person)
                        }
                    }
                }
            }
        }
    }
}
