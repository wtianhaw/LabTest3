//
//  WeatherSearchResponse.swift
//  LabTest
//
//  Created by Wong Tian Haw on 29/06/2022.
//

import Foundation

// MARK: - WeatherSearchResponse
class WeatherSearchResponse: BaseResponse {
    let location: Location?
    let current: Current?
    
    private enum CodingKeys: String, CodingKey {
        case location = "location"
        case current = "current"
    }
    
    required init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        location = try values.decodeIfPresent(Location.self, forKey: .location)
        current = try values.decodeIfPresent(Current.self, forKey: .current)
        try super.init(from: decoder)
    }
    
    override public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(current, forKey: .current)
        try container.encode(location, forKey: .location)
    }
}

// MARK: - Current
struct Current : Codable {
    let lastUpdatedEpoch: Int?
    let lastUpdated: String?
    let tempC: Double?
    let tempF: Double?
    let isDay: Int?
    let condition: Condition?
    let windMph: Double?
    let windKph: Double?
    let windDegree: Double?
    let windDir: String?
    let pressureMb: Double?
    let pressureIn: Double?
    let precipMm: Double?
    let precipIn: Double?
    let humidity: Int?
    let cloud: Int?
    let feelslikeC: Double?
    let feelslikeF: Double?
    let visKm: Double?
    let visMiles: Double?
    let uv: Double?
    let gustMph: Double?
    let gustKph: Double?
    
    private enum CodingKeys: String, CodingKey {
        
        case lastUpdatedEpoch
        case lastUpdated
        case tempC
        case tempF
        case isDay
        case condition
        case windMph
        case windKph
        case windDegree
        case windDir
        case pressureMb
        case pressureIn
        case precipMm
        case precipIn
        case humidity
        case cloud
        case feelslikeC
        case feelslikeF
        case visKm
        case visMiles
        case uv
        case gustMph
        case gustKph
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        lastUpdatedEpoch = try values.decodeIfPresent(Int.self, forKey: .lastUpdatedEpoch)
        lastUpdated = try values.decodeIfPresent(String.self, forKey: .lastUpdated)
        tempC = try values.decodeIfPresent(Double.self, forKey: .tempC)
        tempF = try values.decodeIfPresent(Double.self, forKey: .tempF)
        isDay = try values.decodeIfPresent(Int.self, forKey: .isDay)
        condition = try values.decodeIfPresent(Condition.self, forKey: .condition)
        windMph = try values.decodeIfPresent(Double.self, forKey: .windMph)
        windKph = try values.decodeIfPresent(Double.self, forKey: .windKph)
        windDegree = try values.decodeIfPresent(Double.self, forKey: .windDegree)
        windDir = try values.decodeIfPresent(String.self, forKey: .windDir)
        pressureMb = try values.decodeIfPresent(Double.self, forKey: .pressureMb)
        pressureIn = try values.decodeIfPresent(Double.self, forKey: .pressureIn)
        precipMm = try values.decodeIfPresent(Double.self, forKey: .precipMm)
        precipIn = try values.decodeIfPresent(Double.self, forKey: .precipIn)
        humidity = try values.decodeIfPresent(Int.self, forKey: .humidity)
        cloud = try values.decodeIfPresent(Int.self, forKey: .cloud)
        feelslikeC = try values.decodeIfPresent(Double.self, forKey: .feelslikeC)
        feelslikeF = try values.decodeIfPresent(Double.self, forKey: .feelslikeF)
        visKm = try values.decodeIfPresent(Double.self, forKey: .visKm)
        visMiles = try values.decodeIfPresent(Double.self, forKey: .visMiles)
        uv = try values.decodeIfPresent(Double.self, forKey: .uv)
        gustMph = try values.decodeIfPresent(Double.self, forKey: .gustMph)
        gustKph = try values.decodeIfPresent(Double.self, forKey: .gustKph)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(lastUpdatedEpoch, forKey: .lastUpdatedEpoch)
        try container.encode(lastUpdated, forKey: .lastUpdated)
        try container.encode(tempC, forKey: .tempC)
        try container.encode(tempF, forKey: .tempF)
        try container.encode(isDay, forKey: .isDay)
        try container.encode(condition, forKey: .condition)
        try container.encode(windMph, forKey: .windMph)
        try container.encode(windKph, forKey: .windKph)
        try container.encode(windDegree, forKey: .windDegree)
        try container.encode(windDir, forKey: .windDir)
        try container.encode(pressureMb, forKey: .pressureMb)
        try container.encode(pressureIn, forKey: .pressureIn)
        try container.encode(precipMm, forKey: .precipMm)
        try container.encode(precipIn, forKey: .precipIn)
        try container.encode(humidity, forKey: .humidity)
        try container.encode(cloud, forKey: .cloud)
        try container.encode(feelslikeC, forKey: .feelslikeC)
        try container.encode(feelslikeF, forKey: .feelslikeF)
        try container.encode(visKm, forKey: .visKm)
        try container.encode(visMiles, forKey: .visMiles)
        try container.encode(uv, forKey: .uv)
        try container.encode(gustMph, forKey: .gustMph)
        try container.encode(gustKph, forKey: .gustKph)
    }
    
}

// MARK: - Condition
struct Condition : Codable {
    let text : String?
    let icon : String?
    let code : Int?
    
    private enum CodingKeys: String, CodingKey {
        case text = "text"
        case icon = "icon"
        case code = "code"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        text = try values.decodeIfPresent(String.self, forKey: .text)
        icon = try values.decodeIfPresent(String.self, forKey: .icon)
        code = try values.decodeIfPresent(Int.self, forKey: .code)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(text, forKey: .text)
        try container.encode(icon, forKey: .icon)
        try container.encode(code, forKey: .code)
        
    }
    
}


// MARK: - Location
struct Location : Codable {
    let name : String?
    let region : String?
    let country : String?
    let lat : Double?
    let lon : Double?
    let tzId : String?
    let localtimeEpoch : Int?
    let localtime : String?
    
    private enum CodingKeys: String, CodingKey {
        case name
        case region
        case country
        case lat
        case lon
        case tzId
        case localtimeEpoch
        case localtime
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        name = try values.decodeIfPresent(String.self, forKey: .name)
        region = try values.decodeIfPresent(String.self, forKey: .region)
        country = try values.decodeIfPresent(String.self, forKey: .country)
        lat = try values.decodeIfPresent(Double.self, forKey: .lat)
        lon = try values.decodeIfPresent(Double.self, forKey: .lon)
        tzId = try values.decodeIfPresent(String.self, forKey: .tzId)
        localtimeEpoch = try values.decodeIfPresent(Int.self, forKey: .localtimeEpoch)
        localtime = try values.decodeIfPresent(String.self, forKey: .localtime)
    }
    
}

