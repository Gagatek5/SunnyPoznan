//
//  WeatherVC.swift
//  SunnyPoznan
//
//  Created by Tom on 17/05/2018.
//  Copyright © 2018 Tom. All rights reserved.
//

import UIKit

class WeatherVC: UIViewController {
    
    var selectedIndexPath = 0
    
    @IBOutlet weak var WeatherCV: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let detailPage = segue.destination as? DetailVC {
            let cell = sender as! WeatherCell
            let indexPath = self.WeatherCV.indexPath(for: cell)
            detailPage.selectedCell = (indexPath?.row)!
            
        }
    }

}

extension WeatherVC:  UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 7
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = 	collectionView.dequeueReusableCell(withReuseIdentifier: "WeatherCell", for: indexPath) as! WeatherCell
        if OpenWeatherAPIConnector.shared.daysWeathers.isEmpty {
        OpenWeatherAPIConnector.shared.getData(){ (completion) in
        let daysWeathers = completion!
            cell.Date.text = String(daysWeathers[indexPath.row].date)
            cell.Temperature.text = "\(String(daysWeathers[indexPath.row].temp))°C"
            cell.Pressure.text = "\(String(daysWeathers[indexPath.row].pressure))hPa"
            cell.Image.image = daysWeathers[indexPath.row].image
        
            }
            
        }else {
            cell.Date.text = String(OpenWeatherAPIConnector.shared.daysWeathers[indexPath.row].date)
            cell.Temperature.text = "\(String(OpenWeatherAPIConnector.shared.daysWeathers[indexPath.row].temp))°C"
            cell.Pressure.text = "\(String(OpenWeatherAPIConnector.shared.daysWeathers[indexPath.row].pressure))hPa"
            cell.Image.image = OpenWeatherAPIConnector.shared.daysWeathers[indexPath.row].image

        }
        
        return cell
    }
    
    func collectionView(collection: UICollectionView, selectedItemIndex: NSIndexPath)
    {
        self.performSegue(withIdentifier: "WeatherCell", sender: self)
    }

}
