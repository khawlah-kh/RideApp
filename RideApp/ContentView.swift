//
//  ContentView.swift
//  RideApp
//
//  Created by khawlah khalid on 14/03/2022.
//

import SwiftUI
import MapKit

struct ContentView: View {
    @EnvironmentObject var settingViewModel : SettengsViewModel
    @StateObject var viewModel = MapViewModel()
    @State var showSettengs : Bool = false

    var body: some View {
        VStack{
            ZStack{
                Map(coordinateRegion: $viewModel.region, annotationItems: viewModel.annotations) {
                    MapMarker(coordinate: $0.coordinate)
                }
                .ignoresSafeArea()
                
                Circle()
                    .fill(Color.blue.opacity(0.3))
                    .frame(width: 30, height: 30)
            }
            
            
            Button {

                viewModel.handelButtonTapped()
                
            } label: {
                
                Image(systemName: viewModel.locationNumber < 2 ? "plus" : "trash" )
                    .padding()
                    .background(Color.red)
                    .foregroundColor(.white)
                    .font(.title)
                    .clipShape(Circle())
                    .padding(.top,-35)
            }
            //.padding()
            Text("Distance Evaluation")
                .font(.title)
                .bold()
                .padding()
            ZStack{
                Circle()
                    .stroke(Color.red.opacity(0.4),lineWidth: 20)
                    .frame(width: 300, height: 300)
                    .padding()
                
                if viewModel.distance != 0{
                    Text("\(Int(viewModel.distance)) km")
                        .bold()
                }
            }
            HStack{
                Spacer()
                Button {
                    showSettengs.toggle()
                } label: {
                    Image(systemName: "gear")
                        .font(.title)
                        .padding()
                }
                
            }
        }
        .sheet(isPresented: $showSettengs,onDismiss: {
            settingViewModel.storedTravelRadius = settingViewModel.travelRadius
        }) {
            SettingsView()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
