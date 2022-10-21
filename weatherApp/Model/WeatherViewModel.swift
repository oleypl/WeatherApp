//
//  WeatherViewModel.swift
//  weatherApp
//
//  Created by Michal on 20/10/2022.
//

import Foundation

class WeatherViewModel : ObservableObject {
    @Published var temp: String = "-"
    @Published var image: String = ""
    @Published var description: String = ""
    @Published var pressure: String = ""
    @Published var humidity: String = ""
    @Published var windSpeed: String = ""
    @Published var cityName: String = ""


    func getWeatherInfoCompletionHandler(city: String) {
        print(city.removeWhitespace())
        guard let url = URL(string: "https://api.openweathermap.org/data/2.5/weather?q=\(city.removeWhitespace())&appid=4c6b828d88dbffbceaa0164c0e828451") else { fatalError("Missing URL") }

        let urlRequest = URLRequest(url: url)

        let dataTask = URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
            if let error = error {
                print("Request error: ", error)
                return
            }
            
            guard (response as? HTTPURLResponse)?.statusCode == 200 else {
                print("no response")
                DispatchQueue.main.async {
                    self.cityName = "No result"
                }
                return }
            
            guard let data = data else { return }
                    do {
                 let decodedWeather = try JSONDecoder().decode(ResponseWeather.self, from: data)
                 print("Decoding completed", decodedWeather)
                        print("222")

                        DispatchQueue.main.async {
                            self.temp = String(format: "%.0f", decodedWeather.main.temp - 273.15)
                            self.image = "https://openweathermap.org/img/w/\(decodedWeather.weather.first!.icon).png"
                            self.description = decodedWeather.weather.first!.description
                            self.pressure = String(decodedWeather.main.pressure)
                            self.humidity = String(decodedWeather.main.humidity)
                            self.windSpeed = String(decodedWeather.wind.speed)
                            self.cityName = decodedWeather.name
                        }
             } catch {
                     print("Error decoding", error)
                 print("333")

             }
        }

        dataTask.resume()
    }

}


extension String {
   func replace(string:String, replacement:String) -> String {
       return self.replacingOccurrences(of: string, with: replacement, options: NSString.CompareOptions.literal, range: nil)
   }

   func removeWhitespace() -> String {
       return self.replace(string: " ", replacement: "")
   }
 }
