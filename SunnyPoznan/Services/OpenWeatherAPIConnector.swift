//
//  OpenWeatherAPIConnector.swift
//  SunnyPoznan
//
//  Created by Tom on 17/05/2018.
//  Copyright © 2018 Tom. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON
import UIKit

class OpenWeatherAPIConnector {
    var daysWeathers : [DayWeather] = []
    static let shared = OpenWeatherAPIConnector()
    private init() {}
    
    func getData(completion: @escaping ([DayWeather]?) -> Void){
        
        let headers: [String:String] = ["appid" : "ad4e521f54b155390c178acc59582f10"]
        
        Alamofire.request("http://api.openweathermap.org/data/2.5/forecast/daily?q=Poznan,pl&units=metric&cnt=7", parameters : headers).responseJSON { response in
            guard response.result.isSuccess else {
                print("Error: \(String(describing: response.result.error))")
                    completion(nil)
                return}
            
            if self.daysWeathers.count == 0
            {
                let json = JSON(response.result.value!)
                    for item in json["list"] {
                        
                    let counter = Int(item.0)!
 
                    let day = DayWeather.init(
                        date: Converter.shared.dataDay(dayNumber: counter),
                        temp: json["list"][counter]["temp"]["day"].intValue,
                        tempMax: json["list"][counter]["temp"]["max"].intValue,
                        tempMin: json["list"][counter]["temp"]["min"].intValue,
                        pressure: json["list"][counter]["pressure"].intValue,
                        image: UIImage(data: try! Data(contentsOf: NSURL(string: "http://openweathermap.org/img/w/\(json["list"][counter]["weather"][0]["icon"].stringValue).png")! as URL) as Data)!,
                        humidity: json["list"][counter]["humidity"].intValue,
                        windSpeed: json["list"][counter]["speed"].intValue,
                        windDirection: Converter.shared.convertDegToDir(deg:(json["list"][counter]["deg"].intValue))
                        )
                        self.daysWeathers.append(day)
                }
            }
            completion(self.daysWeathers)
        }
    }
    
}
