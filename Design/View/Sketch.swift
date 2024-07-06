//
//  Sketch.swift
//  Design
//
//  Created by Kathiravan Murali on 23/02/24.
//

import SwiftUI
import PencilKit

struct ImageDrawingView: View {
    @State private var canvasView = PKCanvasView()
    @State private var image: UIImage? = UIImage(named: "1") // Replace with your image
    @State private var showImagePicker = false

    var body: some View {
        VStack {
            if let image = image {
                ZStack {
                    Image(uiImage: image)
                        .resizable()
                        .scaledToFit()

                    CanvasView(canvasView: $canvasView)
                        .ignoresSafeArea() // Draw over the entire image
                }
            } else {
                Text("No Image Selected")
            }

            HStack {
                Button("Load Image") {
                    showImagePicker = true
                }

                Button("Clear Drawing") {
                    canvasView.drawing = PKDrawing()
                }

                Button("Save") {
                    saveCombinedImage()
                }
            }
        }
        .sheet(isPresented: $showImagePicker) {
            ImagePicker(image: $image)
        }
    }

    func saveCombinedImage() {
        guard let combinedImage = exportCombinedImage() else { return }
        UIImageWriteToSavedPhotosAlbum(combinedImage, nil, nil, nil)
    }

    func exportCombinedImage() -> UIImage? {
        guard let image = image else { return nil }
        let drawing = canvasView.drawing
        let imageSize = image.size

        UIGraphicsBeginImageContextWithOptions(imageSize, false, 0.0)
        image.draw(in: CGRect(origin: .zero, size: imageSize))
        drawing.image(from: CGRect(origin: .zero, size: imageSize), scale: 1.0).draw(at: .zero)
        let combinedImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()

        return combinedImage
    }
}

struct CanvasView: UIViewRepresentable {
    @Binding var canvasView: PKCanvasView

    func makeUIView(context: Context) -> PKCanvasView {
        canvasView.drawingPolicy = .anyInput // Allow drawing with finger or Apple Pencil
        canvasView.tool = PKInkingTool(.pen, color: .black, width: 5)
        return canvasView
    }

    func updateUIView(_ uiView: PKCanvasView, context: Context) {
        // No updates needed in this example
    }
}

struct ImagePicker: UIViewControllerRepresentable {
    @Binding var image: UIImage?

    func makeUIViewController(context: Context) -> UIImagePickerController {
        let picker = UIImagePickerController()
        picker.sourceType = .photoLibrary
        picker.delegate = context.coordinator
        return picker
    }

    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {}

    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    class Coordinator: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
        let parent: ImagePicker

        init(_ parent: ImagePicker) {
            self.parent = parent
        }

        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            if let image = info[.originalImage] as? UIImage {
                parent.image = image
            }
            picker.dismiss(animated: true)
        }
    }
}

#Preview {
    ImageDrawingView()
}
