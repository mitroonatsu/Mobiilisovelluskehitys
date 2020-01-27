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
    @State private var showingAlert = false
    var body: some View {
        NavigationView {
            List{
                ForEach(landmark, id: \.id){ landmark in
            NavigationLink(destination: LandmarkDetail(landmark: landmark)) {
                LandmarkRow(landmark: landmark)
                   }
                }
                .onDelete(perform: delete)
                .onMove(perform: move)
            }
            .navigationBarTitle(Text("Landmarks"))
            .navigationBarItems(trailing: EditButton())
                }
        
        .alert(isPresented: $showingAlert) {
            Alert(title: Text("Do you want to delete?"), primaryButton: .destructive(Text("Confirm")), secondaryButton: .cancel(Text("Cancel")))
            }
        }
    
    
    func delete(at offsets: IndexSet){
        showingAlert = true
        //landmark.remove(atOffsets: offsets)
    }
    
    func move(from source: IndexSet, to destination: Int){
        landmark.move(fromOffsets: source, toOffset: destination)
    }
}
struct LandmarkList_Previews: PreviewProvider {
    static var previews: some View {
        ForEach(["iPhone SE", "iPhone XS Max"], id: \.self) { deviceName in
        LandmarkList()
.previewDevice(PreviewDevice(rawValue: "iPhone SE"))
        .previewDisplayName(deviceName)
        }
    }
}
