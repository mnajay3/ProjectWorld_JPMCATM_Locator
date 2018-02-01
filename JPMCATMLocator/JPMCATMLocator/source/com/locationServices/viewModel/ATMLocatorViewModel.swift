//
//  ATMLocatorViewModel.swift
//  JPMCATMLocator
//
//  Created by Naga Murala on 1/31/18.
//  Copyright © 2018 Naga Murala. All rights reserved.
//

/************************************************************************
 VIEWMODEL: Takes care of fetchin data from network and parsing it and
 assigning it to model objects.
 Once the data is available from network it notifies the view(controller)
 to render the data in UI
 
 It uses Encodable protocol from apples swift4 versioin and decode/parse the
 json data
 ************************************************************************/
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
    //Fetches all the nearby locations by passing current location details
    func fetchNearbyLocations(locationManager: CLLocationManager, fetchCompletion: @escaping BLOCK) {
        self.currentLatitude = locationManager.location?.coordinate.latitude
        self.currentLongitude = locationManager.location?.coordinate.longitude
        let url = prepareURL()
        invokeServiceWithURL(url: url, fetchCompletion: fetchCompletion)
    }
    
    //It prepares and return the url from url String otherwise return nil
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
    
    //It prepares the query parameters for url string by adding current latitude and longitued
    func prepareQueryParmString() -> String {
        guard let latitude = self.currentLatitude, let longitude = self.currentLongitude else {
            print("Something is wrong: latitude/longitude values are nil")
            return ""
        }
        let queryParmString = String(LATITUDE)+String("\(latitude)")+AND+String(LONGITUDE)+String("\(longitude)")
        return queryParmString
    }
    //Service call: It uses my ProjectWorld framework and have the network invocation and fetch the network data
    func invokeServiceWithURL(url: URL?, fetchCompletion: @escaping BLOCK) {
        masterTaskMgmt.performTask(url: url) { [unowned self](data) in
            do {
                //Using Encodable protocol providig by apple from swift4 and parsing the data
                self.locationResponse = try JSONDecoder().decode(ATMLocatorResponse.self, from: data)
            } catch let decodeErr {
                print("Error occured while decoding the data", decodeErr.localizedDescription,decodeErr)
            }
            DispatchQueue.main.async {
                //Call back function: completion handler to notify the view to render network information
                fetchCompletion()
            }
        }
    }
    
}
