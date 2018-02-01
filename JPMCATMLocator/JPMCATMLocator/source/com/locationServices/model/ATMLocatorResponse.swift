//
//  ATMLocatorResponse.swift
//  JPMCATMLocator
//
//  Created by Naga Murala on 1/31/18.
//  Copyright © 2018 Naga Murala. All rights reserved.
//
/***************************************************************
 This Model class implements Codable protocol is providing by
 apple api from Swift4.0 for encodable and decodable purpose.
 It makes our life easy as long as the member data is equal to
 network response json keys
 ***************************************************************/
import Foundation

struct ATMLocatorResponse: Codable {
    var locations: [ATMLocation]?
    var errors: [Errors]?
}

struct ATMLocation: Codable {
    let state: String
    let locType: String?
    let label: String?
    let address: String
    let city: String
    let zip: String
    let name: String
    let lat: String
    let lng: String
    let bank: String
    let type: String?
    let lobbyHrs: [String]?
    let driveUpHrs: [String]?
    let atms: Int?
    let services: [String]?
    let phone: String?
    let distance: Double
}

struct Errors: Codable {
    var errorMessage: String?
    var errorCode: String?
}
