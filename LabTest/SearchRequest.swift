//
//  SearchRequest.swift
//  LabTest
//
//  Created by Wong Tian Haw on 29/06/2022.
//

import Foundation

class SearchRequest: APIRequestType {
    
    typealias Response = WeatherSearchResponse
    
    var path: String = "/v1/current.json"

    var params: [String: Any] = [:]
    
    var method: APIMethod = .get
}
