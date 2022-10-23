//
//  ViewController.swift
//  WeatherApp
//
//  Created by Андрей Абакумов on 23.10.2022.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var weatherIconImageView: UIImageView!
    @IBOutlet var cityLabel: UILabel!
    @IBOutlet var temperatureLabel: UILabel!
    @IBOutlet var feelsLikeTemperatureLabel: UILabel!
    
    var networkWeatherManager = NetworkWeatherManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        networkWeatherManager.delegate = self
        networkWeatherManager.fetchCurrentWeather(forCity: "London")
    }

    
    @IBAction func searchButtonPressed(_ sender: UIButton) {
        searchAlertController(withTitle: "Enter city name", message: nil, style: .alert)
        
    }
    
    private func searchAlertController(withTitle title: String, message: String?, style: UIAlertController.Style) {
        let alert = UIAlertController(
            title: title,
            message: message,
            preferredStyle: style
        )
        
        let search = UIAlertAction(title: "Search", style: .default) { _ in
            let textField = alert.textFields?.first
            guard let cityName = textField?.text else { return }
            if cityName != "" {
                let city = cityName.split(separator: " ").joined(separator: "%20")
                self.networkWeatherManager.fetchCurrentWeather(forCity: city)
            }
        }
        let cancel = UIAlertAction(title: "Cancel", style: .cancel)
        
        alert.addTextField()
        alert.addAction(search)
        alert.addAction(cancel)
        present(alert, animated: true)
    }
}

extension ViewController: NetworkWeatherManagerDelegate {
    func updateInterface(_: NetworkWeatherManager, with currentWeather: CurrentWeather) {
        DispatchQueue.main.async {
            self.cityLabel.text = currentWeather.cityName
            self.temperatureLabel.text = currentWeather.temperatureString
            self.feelsLikeTemperatureLabel.text = currentWeather.feelsLikeTemperatureString
            self.weatherIconImageView.image = UIImage(systemName: currentWeather.systemIconNameString)
        }
    }
}
