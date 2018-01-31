//
//  ATMLocatorViewModel.swift
//  JPMCATMLocator
//
//  Created by Naga Murala on 1/31/18.
//  Copyright © 2018 Naga Murala. All rights reserved.
//

import UIKit
import CoreLocation
import ProjectWorldFramework

class ATMLocatorViewModel: NSObject {
    
    var currentLatitude: CLLocationDegrees?
    var currentLongitude: CLLocationDegrees?
    var locationResponse: ATMLocatorResponse?
    
    override init() {
        super.init()
    }
    
    func fetchNearbyLocations(locationManager: CLLocationManager, fetchCompletion: @escaping BLOCK) {
        self.currentLatitude = locationManager.location?.coordinate.latitude
        self.currentLongitude = locationManager.location?.coordinate.longitude
        let url = prepareURL()
        invokeServiceWithURL(url: url, fetchCompletion: fetchCompletion)
    }
    
    func prepareURL() -> URL? {
        guard let latitude = self.currentLatitude, let longitude = self.currentLongitude else {
            print("Something is wrong: latitude/longitude values are nil")
            return nil
        }
        let queryParmstring = prepareQueryParmString()
        let urlString = ATM_LOCATIONS_URL+queryParmstring
        let url = masterTaskMgmt.urlFromURLString(urlString: urlString)
        return url
    }
    
    func prepareQueryParmString() -> String {
        guard let latitude = self.currentLatitude, let longitude = self.currentLongitude else {
            print("Something is wrong: latitude/longitude values are nil")
            return ""
        }
        let queryParmString = String(LATITUDE)+String("\(latitude)")+AND+String(LONGITUDE)+String("\(longitude)")
        return queryParmString
    }
    
    func invokeServiceWithURL(url: URL?, fetchCompletion: @escaping BLOCK) {
        masterTaskMgmt.performTask(url: url) { [unowned self](data) in
            do {
                self.locationResponse = try JSONDecoder().decode(ATMLocatorResponse.self, from: data)
            } catch let decodeErr {
                print("Error occured while decoding the data", decodeErr.localizedDescription,decodeErr)
            }
            DispatchQueue.main.async {
                fetchCompletion()
            }
        }
    }
    
}
