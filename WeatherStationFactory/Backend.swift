//
//  Backend.swift
//  WeatherStationFactory
//
//  Created by Said Sikira on 3/24/16.
//  Copyright © 2016 CityOS. All rights reserved.
//

import Foundation

internal class Backend {
    class func requestLatestData(completion: (data: Dictionary<String, AnyObject>?, error: ErrorType?) -> ()) {
        let session = NSURLSession.sharedSession()
        let url = NSURL(string: "http://test")!
        let task = session.dataTaskWithURL(url) {
            data, response, error in
            if error != nil {
                completion(data: nil, error: error!)
            } else {
                do {
                    let jsonData = try NSJSONSerialization.JSONObjectWithData(data!, options: [])
                    if let jsonData = jsonData as? [String: AnyObject] {
                        completion(data: jsonData, error: nil)
                    }
                } catch {
                    completion(data: nil, error: error)
                }
            }
            
        }
        task.resume()
    }
}