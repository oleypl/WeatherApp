//
//  MainWeatherStatusView.swift
//  weatherApp
//
//  Created by Michal on 20/10/2022.
//

import SwiftUI

struct MainWeatherStatusView: View {
    var imageName: String
    var temperature: String
    var description: String = ""
    var pressure: String = ""
    var humidity: String = ""
    var windSpeed: String = ""
    
    var body: some View {
        
        HStack(spacing: 20) {
            VStack(spacing: 8){
                AsyncImage(url: URL(string: imageName)) { image in
                      image
                          .resizable()
                          .aspectRatio(contentMode: .fit)
                          .frame(width: 60)
                  } placeholder: {
                      ProgressView()
                  }
                    
                Text("\(temperature)°")
                    .font(.system(size: 70, weight: .medium))
                    .foregroundColor(.white)
            }
            .frame(width: 150, height: 200)
                        .background(Color.black.opacity(0.3))
                        .cornerRadius(16)
            .padding(.bottom, 80)
            
            VStack(alignment: .leading,  spacing: 20.0){
                
                Text(description.uppercased())
                    .font(.system(size: 16, weight: .bold))
                    .foregroundColor(.white)
                
                HStack() {
                    Image(systemName: "barometer")
                        .resizable()
                        .foregroundColor(.white)
                        .frame(width: 25,height: 25)
                    Text(pressure)
                        .font(.system(size: 15, weight: .bold))
                        .foregroundColor(.white)
                }
                HStack() {
                    Image(systemName: "humidity")
                        .resizable()
                        .foregroundColor(.white)
                        .frame(width: 25,height: 25)
                    Text(humidity)
                        .font(.system(size: 15, weight: .bold))
                        .foregroundColor(.white)
                }
                HStack() {
                    Image(systemName: "wind")
                        .resizable()
                        .foregroundColor(.white)
                        .frame(width: 25,height: 25)
                    Text(windSpeed)
                        .font(.system(size: 15, weight: .bold))
                        .foregroundColor(.white)
                }
            }
            .frame(width: 150, height: 200)
                        .background(Color.black.opacity(0.3))
                        .cornerRadius(16)
            .padding(.bottom, 80)
        }
    }
}


