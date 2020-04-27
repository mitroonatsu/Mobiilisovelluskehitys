import Foundation
import SwiftUI

struct Search: UIViewRepresentable {
    
    class Coordinator: NSObject, UISearchBarDelegate {
        @Binding var text: String
        
        init(text: Binding<String>) {
            _text = text
        }
        
        func search(_ search: UISearch, textDidChange city: String) {
            text = city
        }
        
    }
    
    func makeCoordinator() -> Search.Coordinator {
        return Coordinator(text: $text)
    }
    
    func makeUIView(context: UIViewRepresentableContext<Search>) -> UISearch {
        let search = UISearch(frame: .zero)
        search.delegate = context.coordinator
        return search
    }
    
    func updateUIView(_ uiView: UISearch, context: UIViewRepresentableContext<Search>) {
        uiView.text = text
    }
}