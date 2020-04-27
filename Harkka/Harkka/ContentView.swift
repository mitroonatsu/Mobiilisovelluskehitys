

import SwiftUI

struct ContentView: View {
    var body: some View{
        NavigationView{
        ZStack{Color.blue
            .opacity(0.6)
            .edgesIgnoringSafeArea(.all)
        
        VStack{
            Text("Sovellus näyttää 6 tiellä, Saimaan kanavalla, Mälkiän sillalla olevien kamerojen kuvat. Kuvat päivittyvät 12 minuutin välein, alkaen tasatunnista eli esimerkiksi 18:00, 18:12, 18:24, 18:36, 18:48 ja 19:00.")
                .font(.headline)
                .multilineTextAlignment(.center)
                .padding(30)
        
            NavigationLink(destination: Cameras()) {
                Text("Kamerat")
                    .font(.subheadline)
                    .fontWeight(.heavy)
                    .foregroundColor(Color.black)
                    
                }
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
