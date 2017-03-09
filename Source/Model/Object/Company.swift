//
//  TmdbCompany.swift
//  MyFavoriteMovies
//
//  Created by Kamil Swojak on 13/01/2017.
//  Copyright © 2017 Kamil Swojak. All rights reserved.
//

import Foundation
import ObjectMapper

public class TmdbCompany: TmdbResponse{
    
    public var id: Int?
    public var logo_path: String?
    public var name: String?
    
    override public func mapping(map: Map) {
        super.mapping(map: map)
        id <- map["id"]
        logo_path <- map["logo_path"]
        name <- map["name"]
    }
}
