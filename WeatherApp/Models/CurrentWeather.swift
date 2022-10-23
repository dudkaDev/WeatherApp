//
//  CurrentWeather.swift
//  WeatherApp
//
//  Created by Андрей Абакумов on 23.10.2022.
//

import Foundation

struct CurrentWeather {
    let cityName: String
    
    let temperature: Double
    var temperatureString: String {
        "\(temperature.rounded()) °C"
    }
    
    let feelsLikeTemperature: Double
    var feelsLikeTemperatureString: String {
        "Feels like \(feelsLikeTemperature.rounded()) °C"
    }
    
    let conditionCode: Int
    var systemIconNameString: String {
        switch conditionCode {
        case 200...232:
            return "cloud.bolt.rain.fill"
        case 300...321:
            return "cloud.drizzle.fill"
        case 500...531:
            return "cloud.rain.fill"
        case 600...622:
            return "cloud.snow.fill"
        case 701...781:
            return "smoke.fill"
        case 800:
            return "sun.min.fill"
        default:
            return "cloud.fill"
        }
    }
    
    init?(currentWeatherData: CurrentWeatherData) {
        cityName = currentWeatherData.name
        temperature = currentWeatherData.main.temp
        feelsLikeTemperature = currentWeatherData.main.feelsLike
        conditionCode = currentWeatherData.weather.first!.id
    }
}
