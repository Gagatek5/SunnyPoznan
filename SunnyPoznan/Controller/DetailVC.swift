//
//  DetailVC.swift
//  SunnyPoznan
//
//  Created by Tom on 22/05/2018.
//  Copyright © 2018 Tom. All rights reserved.
//

import UIKit

class DetailVC: UIViewController {

    let list = OpenWeatherAPIConnector.shared.daysWeathers
    var selectedCell = 0
    
    @IBOutlet weak var dateL: UILabel!
    @IBOutlet weak var imageWeather: UIImageView!
    @IBOutlet weak var tempDayL: UILabel!
    @IBOutlet weak var tempMaxL: UILabel!
    @IBOutlet weak var tempMinL: UILabel!
    @IBOutlet weak var pressureL: UILabel!
    @IBOutlet weak var humidityL: UILabel!
    @IBOutlet weak var windSpeedL: UILabel!
    @IBOutlet weak var windDirectionL: UILabel!
    @IBOutlet weak var dataTitle: UINavigationItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataTitle.title = list[selectedCell].date
        imageWeather.image = list[selectedCell].image
        tempDayL.text = "Śr \(String(list[selectedCell].temp))°C"
        tempMaxL.text = "Max \(String(list[selectedCell].tempMax))°C"
        tempMinL.text = "Min \(String(list[selectedCell].tempMin))°C"
        pressureL.text = "\(String(list[selectedCell].pressure))hPa"
        humidityL.text = "Wilgotność \(String(list[selectedCell].humidity))%"
        windSpeedL.text = "Prędkość wiatru:\(String(list[selectedCell].windSpeed))km/h"
        windDirectionL.text = "Kierunek wiatru: \(String(list[selectedCell].windDirection.rawValue))"
       
    }


}
