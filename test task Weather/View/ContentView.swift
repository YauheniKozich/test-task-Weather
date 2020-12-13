//
//  ContentView.swift
//  test task Weather
//
//  Created by Yauheni Kozich on 11.12.20.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel: WeatherViewModel
    var body: some View {
        ZStack {
           LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)), Color(#colorLiteral(red: 0.01680417731, green: 0.1983509958, blue: 1, alpha: 0.3024400685))]), startPoint: .leading, endPoint: .trailing)
            .ignoresSafeArea(.all)
            VStack {
                Text(viewModel.city)
                    .font(.largeTitle)
                    .padding()
                Text(viewModel.temperature)
                    .font(.system(size: 70))
                    .bold()
                Text("Feels like: \(viewModel.feels_like)")
                    .font(.system(size: 20))
                    .padding()
                Text(viewModel.description)
                    .padding()
                Divider()
                Spacer()
                    .onAppear(perform: {
                        viewModel.refrech()
                    })
            }
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(viewModel: WeatherViewModel(weatherSevice: WeatherService()))
    }
}
