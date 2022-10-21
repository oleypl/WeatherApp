//
//  ContentView.swift
//  weatherApp
//
//  Created by Michal on 19/10/2022.
//

import SwiftUI

struct ContentView: View {
    @State private var isNight = false
    @State private var city = ""
    @StateObject var weatherViewModel = WeatherViewModel()

    var body: some View {
        ZStack {
            BackgroundView(isNight: $isNight)
            
            VStack {
                HStack{
                        TextField("Put city name", text: $city)
                        .foregroundColor(Color.white)
                            .frame(width: 160, height: 25)
                            .background(Color.white.opacity(0.3))
                            .font(.system(size: 20, weight: .bold))
                            .cornerRadius(14)
                            .multilineTextAlignment(.center)


                        Button {
                            weatherViewModel.getWeatherInfoCompletionHandler(city: city)
                        } label: {
                            Image(systemName: "magnifyingglass")
                                .foregroundColor(.white)
                            
                        }
                }
                .padding(.leading, 13)
                               
                CityTextView(cityName: weatherViewModel.cityName)
                
                MainWeatherStatusView(imageName: weatherViewModel.image, temperature: weatherViewModel.temp, description: weatherViewModel.description, pressure: weatherViewModel.pressure, humidity: weatherViewModel.humidity, windSpeed: weatherViewModel.windSpeed)
                
                HStack(spacing: 22){
            
                    WeatherDayView(dayOfWeek: "TUE", imageName: "cloud.fill", temperature: 12)
                    WeatherDayView(dayOfWeek: "WED", imageName: "cloud.sun.bolt.fill", temperature: 15)
                    WeatherDayView(dayOfWeek: "THU", imageName: "cloud.sun.fill", temperature: 17)
                    WeatherDayView(dayOfWeek: "FRI", imageName: "cloud.sun.fill", temperature: 21)
                    WeatherDayView(dayOfWeek: "SUN", imageName: "smoke.fill", temperature: 11)

                }
                .frame(width: 360, height: 170)
                .background(Color.black.opacity(0.3))
                .cornerRadius(16)
                
                Spacer()
        
                Button{
                    print("Theme changed")
                    isNight.toggle()
                    
                } label: {
                    ButtonView(title: isNight ? "Night Theme" : "Day Theme")
                }
            }
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct BackgroundView: View {
    @Binding var isNight: Bool
    
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [isNight ? .black : .blue, isNight ? .gray : Color("customLightBlue")]), startPoint: .topLeading, endPoint: .bottomTrailing).edgesIgnoringSafeArea(.all)
    }
}


struct CityTextView: View {
    var cityName: String

    var body: some View {
        Text(cityName).font(.system(size: 44, weight: .medium, design: .default))
            .foregroundColor(.white)
            .padding()
    }
}

struct ButtonView: View {
    var title: String

    var body: some View {

        Text(title)
            .foregroundColor(Color.white)
                .frame(width: 180, height: 45)
                .background(Color.black.opacity(0.3))
                .font(.system(size: 20, weight: .bold))
                .cornerRadius(14)
    }
}


