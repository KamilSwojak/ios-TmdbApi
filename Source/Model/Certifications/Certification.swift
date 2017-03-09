//
//  Certification.swift
//  MyFavoriteMovies
//
//  Created by Kamil Swojak on 17/01/2017.
//  Copyright © 2017 Kamil Swojak. All rights reserved.
//

import Foundation
import ObjectMapper

public class TmdbCertification: TmdbResponse{
    
    public var certification: String?
    public var meaning: String?
    public var order: Int?
    
    override public func mapping(map: Map) {
        super.mapping(map: map)
        certification <- map["certification"]
        meaning <- map["meaning"]
        order <- map["order"]
    }
}
