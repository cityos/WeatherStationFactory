//
//  WeatherStationFactory.swift
//  WeatherStationFactory
//
//  Created by Said Sikira on 3/23/16.
//  Copyright © 2016 CityOS. All rights reserved.
//

import CoreCityOS

public final class WeatherFactory: FactoryType {
    
    public static var sharedInstance: WeatherFactory = WeatherFactory()
    
    public func getLatestData(completion: (data: LiveDataCollectionType?, error: ErrorType) -> ()) {
        
        Backend.requestLatestData {
            data, error in
            print(data)
            print(error)
        }
    }
}
