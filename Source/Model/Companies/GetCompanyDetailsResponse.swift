//
//  GetCompanyDetailsResponse.swift
//  MyFavoriteMovies
//
//  Created by Kamil Swojak on 14/01/2017.
//  Copyright © 2017 Kamil Swojak. All rights reserved.
//

import Foundation
import ObjectMapper

public class TmdbGetCompanyDetailsResponse: TmdbResponse{
    
    public var description: String?
    public var headquarters: String?
    public var homepage: String?
    public var id: Int?
    public var logo_path: String?
    public var name: String?
    public var parent_company: String?
    
    override public func mapping(map: Map) {
        super.mapping(map: map)
        description <- map["description"]
        headquarters <- map["headquarters"]
        homepage <- map["homepage"]
        id <- map["id"]
        logo_path <- map["logo_path"]
        name <- map["name"]
        parent_company <- map["parent_company"]
    }
}
