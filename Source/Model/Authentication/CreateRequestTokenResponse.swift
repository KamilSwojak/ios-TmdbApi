//
//  GetRequestTokenResponse.swift
//  MyFavoriteMovies
//
//  Created by Kamil Swojak on 12/01/2017.
//  Copyright © 2017 Kamil Swojak. All rights reserved.
//

import Foundation
import ObjectMapper

public class TmdbCreateRequestTokenResponse: TmdbResponse{
    
    public var success: Bool?
    public var expires_at: String?
    public var request_token: String!
    
    override public func mapping(map: Map) {
        super.mapping(map: map)
        success <- map["success"]
        expires_at <- map["expires_at"]
        request_token <- map["request_token"]
    }
}
