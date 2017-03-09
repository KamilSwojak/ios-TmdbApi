//
//  GetCertificationsRespone.swift
//  MyFavoriteMovies
//
//  Created by Kamil Swojak on 17/01/2017.
//  Copyright © 2017 Kamil Swojak. All rights reserved.
//

import Foundation
import ObjectMapper

public class TmdbGetCertificationsResponse: TmdbResponse{
    
    public var US: [TmdbCertification]?
    public var CA: [TmdbCertification]?
    public var DE: [TmdbCertification]?
    public var GB: [TmdbCertification]?
    public var AU: [TmdbCertification]?
    public var BR: [TmdbCertification]?
    public var FR: [TmdbCertification]?
    public var NZ: [TmdbCertification]?
    public var IN: [TmdbCertification]?
    
    override public func mapping(map: Map) {
        super.mapping(map: map)
        US <- map["certifications.US"]
        CA <- map["certifications.CA"]
        DE <- map["certifications.DE"]
        GB <- map["certifications.GB"]
        AU <- map["certifications.AU"]
        BR <- map["certifications.BR"]
        FR <- map["certifications.FR"]
        NZ <- map["certifications.NZ"]
        IN <- map["certifications.IN"]
    }
}
