
import SwiftUI

let cameraone = [
    "https://weathercam.digitraffic.fi/C0355802.jpg"
].map { URL(string: $0)! }

struct CameraOne: View {
    @Environment(\.imageCache) var cache: ImageCache

    var body: some View {
        
         List(cameraone, id: \.self) { url in
             AsyncImage(
                url: url,
                cache: self.cache,
                placeholder: Text("Loading ..."),
                configuration: { $0.resizable() }
             )
            .frame(idealHeight: UIScreen.main.bounds.width / 16 * 9) // 16:9 aspect ratio
         }
    }
}

struct CameraOne_Previews: PreviewProvider {
    static var previews: some View {
        CameraOne()
    }
}
