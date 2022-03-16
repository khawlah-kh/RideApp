//
//  SettingsView.swift
//  RideApp
//
//  Created by khawlah khalid on 16/03/2022.
//

import SwiftUI

struct SettingsView: View {
    @State var travelRadius : Double = 300
    @Environment (\.presentationMode) var presentationMode
    var numbeOfCars : Int {
        Int(travelRadius) / 100
    }
    var body: some View {
        VStack{
            HStack{
                Spacer()
            Button {
                presentationMode.wrappedValue.dismiss()
            } label: {
                Text("Done")
            }
            .padding()
            }
           
            Image(systemName: "map")
                .padding()
                .foregroundColor(Color(.systemBackground))
                .font(.system(size: 80))
                .background(LinearGradient(colors: [.red,.pink], startPoint: .top, endPoint: .bottom))
                .cornerRadius(15)
                .padding()
        Text("Your Ride Expierence")
            .font(.largeTitle)
            .bold()
            Spacer().frame(height: 100)
            
         Text("How far do like to drive?")
                .bold()
            Slider(value: $travelRadius,in :100 ... 500,step: 100)
                .padding()
            HStack{
                ForEach(0 ..< numbeOfCars,id:\.self){_ in
               
                Image(systemName: "car.fill")
                    .font(.title)
            }
            }
            .padding()
            Text("My Radius is \(Int(travelRadius)) km")
                .font(.headline)
                .foregroundColor(.gray)
            Spacer()
        }
    }
    
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
