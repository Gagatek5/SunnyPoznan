//
//  DayWeather.swift
//  SunnyPoznan
//
//  Created by Tom on 21/05/2018.
//  Copyright © 2018 Tom. All rights reserved.
//

import Foundation
import UIKit

class DayWeather {
    let date : String
    let temp: Int
    let tempMax: Int
    let tempMin: Int
    let pressure: Int
    let image: UIImage
    let humidity: Int
    let windSpeed: Int
    let windDirection: Direction

    init(date:String, temp:Int, tempMax:Int, tempMin:Int, pressure:Int, image:UIImage, humidity:Int, windSpeed:Int, windDirection:Direction ) {
        self.date = date
        self.temp = temp
        self.tempMax = tempMax
        self.tempMin = tempMin
        self.pressure = pressure
        self.image = image
        self.humidity = humidity
        self.windSpeed = windSpeed
        self.windDirection = windDirection
    }
}
