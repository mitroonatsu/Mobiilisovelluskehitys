//
//  Cameras.swift
//  Harkka
//
//  Created by Susanna Käsnänen on 27.4.2020.
//  Copyright © 2020 Mitro Onatsu. All rights reserved.
//

import SwiftUI

struct Cameras: View {
    var body: some View {
        NavigationView {
            
            ZStack{Color.blue
            .opacity(0.6)
            .edgesIgnoringSafeArea(.all)
                
            VStack{
            NavigationLink(destination: CameraOne()) {
                Text("Kamera Lappeenrantaan päin")
                    .foregroundColor(Color.black)
                }.padding(30)
                    
                NavigationLink(destination: CameraTwo()) {
                    Text("Kamera Imatralle päin")
                        .foregroundColor(Color.black)
                }.padding(30)
                NavigationLink(destination: CameraThree()) {
                    Text("Kamera tietä päin")
                        .foregroundColor(Color.black)
                }.padding(30)
            .navigationBarTitle("Kamerat")
        }
            }
        }
    }
}

struct Cameras_Previews: PreviewProvider {
    static var previews: some View {
        Cameras()
    }
}
