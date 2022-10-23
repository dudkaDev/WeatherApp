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
        "\(temperature.rounded())"
    }
    
    let feelsLikeTemperature: Double
    var feelsLikeTemperatureString: String {
        "\(feelsLikeTemperature.rounded())"
    }
    
    let conditionCode: Int
    
    init?(currentWeatherData: CurrentWeatherData) {
        cityName = currentWeatherData.name
        temperature = currentWeatherData.main.temp
        feelsLikeTemperature = currentWeatherData.main.feelsLike
        conditionCode = currentWeatherData.weather.first!.id
    }
}
