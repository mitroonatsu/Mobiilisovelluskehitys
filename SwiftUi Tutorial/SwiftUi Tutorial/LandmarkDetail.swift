//
//  ContentView.swift
//  SwiftUi Tutorial
//
//  Created by Mitro Onatsu on 13/01/2020.
//  Copyright © 2020 Mitro Onatsu. All rights reserved.
//

import SwiftUI

struct LandmarkDetail: View {
    var landmark: Landmark
    @EnvironmentObject var userData: UserData
    @State private var showingAlert = false
    
    var landmarkIndex: Int {
        userData.landmarks.firstIndex(where: { $0.id == landmark.id })!
    }
    
    var body: some View {
        VStack {
             MapView(coordinate: landmark.locationCoordinate)
                          .edgesIgnoringSafeArea(.top)
                          .frame(height: 300)

                      CircleImage(image: landmark.image)
                          .offset(y: -130)
                          .padding(.bottom, -130)

            Button(action: {
            self.showingAlert = true
            }) {
            Text("Delete")
            }
            
                      VStack(alignment: .leading) {
                        HStack{
                          Text(landmark.name)
                              .font(.title)
                        
                        Button(action: {
                        self.userData.landmarks[self.landmarkIndex]
                            .isFavorite.toggle()
                        }) {
                        if self.userData.landmarks[self.landmarkIndex]
                            .isFavorite {
                    Image(systemName: "star.fill")
                    .foregroundColor(Color.yellow)
                            } else {
                            Image(systemName: "star")
                        .foregroundColor(Color.gray)
                    }
                }
            }
                          HStack(alignment: .top) {
                              Text(landmark.park)
                                  .font(.subheadline)
                              Spacer()
                              Text(landmark.state)
                                  .font(.subheadline)
            }
        }
            .padding()
            
            .alert(isPresented: $showingAlert) {
            Alert(title: Text("Do you want to delete?"), primaryButton: .default(Text("Yes")), secondaryButton: .destructive(Text("No")))
                }
            
            Spacer()
        }
        .navigationBarTitle(Text(landmark.name), displayMode: .inline)
        
        
    }
}

struct LandmarkDetail_Previews: PreviewProvider {
    static var previews: some View {
        LandmarkDetail(landmark: landmarkData[0])
    }
}
