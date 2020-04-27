import SwiftUI

let cameratwo = [
    "https://weathercam.digitraffic.fi/C0355801.jpg"
].map { URL(string: $0)! }

struct CameraTwo: View {
    @Environment(\.imageCache) var cache: ImageCache

    var body: some View {
         List(cameratwo, id: \.self) { url in
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

struct CameraTwo_Previews: PreviewProvider {
    static var previews: some View {
        CameraTwo()
    }
}
