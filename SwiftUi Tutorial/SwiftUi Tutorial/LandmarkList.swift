//
//  LandmarkList.swift
//  SwiftUi Tutorial
//
//  Created by Mitro Onatsu on 13/01/2020.
//  Copyright © 2020 Mitro Onatsu. All rights reserved.
//

import SwiftUI

struct LandmarkList: View {
    @State private var landmark = landmarkData
    @State var showFavoritesOnly = false
    @EnvironmentObject private var userData: UserData
    var body: some View {
        NavigationView {
            List{
                
                Toggle(isOn: $userData.showFavoritesOnly) {
                    Text("Favorites only")
                }
                
                ForEach(userData.landmarks){ landmark in
                    if !self.userData.showFavoritesOnly || landmark.isFavorite {
            NavigationLink(destination: LandmarkDetail(landmark: landmark)
                .environmentObject(self.userData)) {
                LandmarkRow(landmark: landmark)
                   }
                }
            }
                .onDelete(perform: delete)
                .onMove(perform: move)
            }
            .navigationBarTitle(Text("Landmarks"))
            .navigationBarItems(trailing: EditButton())
                }
        }
    
    
    func delete(at offsets: IndexSet){
        userData.landmarks.remove(atOffsets: offsets)
    }
    
    func move(from source: IndexSet, to destination: Int){
        userData.landmarks.move(fromOffsets: source, toOffset: destination)
    }
}
struct LandmarkList_Previews: PreviewProvider {
    static var previews: some View {
        ForEach(["iPhone SE", "iPhone XS Max"], id: \.self) { deviceName in
        LandmarkList()
            .environmentObject(UserData())
            .previewDevice(PreviewDevice(rawValue: "iPhone SE"))
            .previewDisplayName(deviceName)
        }
    }
}
