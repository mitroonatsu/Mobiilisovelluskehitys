import SwiftUI

let camerathree = [
    "https://weathercam.digitraffic.fi/C0355809.jpg"
].map { URL(string: $0)! }

struct CameraThree: View {
    @Environment(\.imageCache) var cache: ImageCache

    var body: some View {
         List(camerathree, id: \.self) { url in
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

struct CameraThree_Previews: PreviewProvider {
    static var previews: some View {
        CameraThree()
    }
}
