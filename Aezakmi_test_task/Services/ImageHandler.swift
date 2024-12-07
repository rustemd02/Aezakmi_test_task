//
//  ImageHandler.swift
//  Aezakmi_test_task
//
//  Created by Рустем on 07.12.2024.
//

import SwiftUI

final class ImageLoader: ObservableObject {
    @Published var image: Image? = nil
    
    func load(from urlString: String) {
        if let url = URL(string: urlString), url.scheme == "https" {
            NetworkService.shared.downloadImage(from: urlString) { uiImage in
                guard let uiImage = uiImage else { return }
                DispatchQueue.main.async {
                    self.image = Image(uiImage: uiImage)
                }
            }
        } else {
            let fileURL = URL(fileURLWithPath: urlString)
            if FileManager.default.fileExists(atPath: fileURL.path) {
                do {
                    let imageData = try Data(contentsOf: fileURL)
                    if let uiImage = UIImage(data: imageData) {
                        DispatchQueue.main.async {
                            self.image = Image(uiImage: uiImage)
                        }
                    }
                } catch {
                    print(error.localizedDescription)
                }
            }
        }
    }
}


struct DownloadedImage: View {
    
    var image: Image?
    
    var body: some View {
        if let image = image {
            image
                .resizable()
        } else {
            ProgressView()
        }
        
    }
}


struct FlagImage: View {
    
    @StateObject var imageLoader = ImageLoader()
    let urlString: String
    
    var body: some View {
        DownloadedImage(image: imageLoader.image)
            .onAppear() {
                imageLoader.load(from: urlString)
            }
    }
}
