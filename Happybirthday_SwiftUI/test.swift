//
//  test.swift
//  Happybirthday_SwiftUI
//
//  Created by kaito on 2023/04/15.
//

import SwiftUI

struct ContentView: View {
    
    @State private var image: Image?
    @State private var showingImagePicker = false
    
    let userDefaults = UserDefaults.standard
    
    var body: some View {
        VStack {
            image?
                .resizable()
                .scaledToFit()
            
            Button("Select Image") {
                showingImagePicker = true
            }
        }
        .sheet(isPresented: $showingImagePicker, onDismiss: loadImage) {
            ImagePicker(image: $image)
        }
        .onDisappear {
            if let imageData = image?.toData() {
                userDefaults.set(imageData, forKey: "savedImage")
            }
        }
    }
    
    func loadImage() {
        guard let inputImage = image else { return }
        let imageData = inputImage.toData()
        userDefaults.set(imageData, forKey: "savedImage")
    }
}

struct ImagePicker: UIViewControllerRepresentable {
    
    @Binding var image: Image?
    @Environment(\.presentationMode) var presentationMode
    
    func makeUIViewController(context: Context) -> UIImagePickerController {
        let picker = UIImagePickerController()
        picker.delegate = context.coordinator
        picker.sourceType = .photoLibrary
        return picker
    }
    
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {
        // Do nothing
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    class Coordinator: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
        
        let parent: ImagePicker
        
        init(_ parent: ImagePicker) {
            self.parent = parent
        }
        
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            if let uiImage = info[.originalImage] as? UIImage {
                parent.image = Image(uiImage: uiImage)
            }
            parent.presentationMode.wrappedValue.dismiss()
        }
    }
}

extension Image {
    
    func toData() -> Data? {
        guard let cgImage = self.cgImage else { return nil }
        return UIImage(cgImage: cgImage).jpegData(compressionQuality: 0.5)
    }
}

struct test_Previews: PreviewProvider {
    static var previews: some View {
        test()
    }
}
