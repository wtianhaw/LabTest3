//
//  BaseResponse.swift
//  LabTest
//
//  Created by Wong Tian Haw on 29/06/2022.
//

import Foundation

class BaseResponse : Codable {

    let status: Bool?
    let code: Int?
    let msg: String?
    let error: ResponseError?

    private enum CodingKeys: String, CodingKey {
        case status = "status"
        case code = "code"
        case msg = "message"
        case error = "error"
    }

    required init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        status = try? values.decodeIfPresent(Bool.self, forKey: .status)
        code = try? values.decodeIfPresent(Int.self, forKey: .code)
        msg = try? values.decodeIfPresent(String.self, forKey: .msg)
        error = try? values.decodeIfPresent(ResponseError.self, forKey: .error)
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try? container.encodeIfPresent(status, forKey: .status)
        try? container.encodeIfPresent(code, forKey: .code)
        try? container.encodeIfPresent(msg, forKey: .msg)
        try? container.encodeIfPresent(error, forKey: .error)
    }

}

class ResponseError: Codable {
    let code: Int?
    let message: String?
    
    private enum CodingKeys: String, CodingKey {
        case code = "code"
        case message = "message"
    }

    required init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        message = try? values.decodeIfPresent(String.self, forKey: .message)
        code = try? values.decodeIfPresent(Int.self, forKey: .code)
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try? container.encodeIfPresent(message, forKey: .message)
        try? container.encodeIfPresent(code, forKey: .code)
    }
}

