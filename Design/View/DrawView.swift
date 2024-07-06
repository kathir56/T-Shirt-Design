//
//  DressView.swift
//  Design
//
//  Created by Kathiravan Murali on 19/02/24.
//

import SwiftUI
import PencilKit

struct DrawView: View {
    var canvasView = PKCanvasView()
    @Binding var photo : UIImage?
    var size : CGSize
    @Binding var color : Color
    
    var body: some View {
        
        MyCanvas(canvasView: canvasView, image: $photo, size: size, color: $color)
    }
}

struct MyCanvas: UIViewRepresentable {
    var canvasView: PKCanvasView
    let picker = PKToolPicker()
    @Binding var image: UIImage?
    var size: CGSize
    @Binding var color: Color

    func makeUIView(context: Context) -> PKCanvasView {
        self.canvasView.isOpaque = false
        self.canvasView.backgroundColor = .clear
        self.canvasView.drawingPolicy = .anyInput
        self.canvasView.tool = PKInkingTool(.pen, color: .black, width: 15)
        self.canvasView.becomeFirstResponder()

        // Set the tool picker for the canvas view
        picker.addObserver(canvasView)
        picker.setVisible(true, forFirstResponder: canvasView)

        return canvasView
    }
    func updateUIView(_ uiView: PKCanvasView, context: Context) {
          // ... your existing code ...
        if let originalImage = image {
            let imageView = UIImageView(image: originalImage.withRenderingMode(.alwaysTemplate))
            imageView.tintColor = UIColor(color)
                    imageView.frame = CGRect(x: 0, y: 0, width: size.width, height: size.height)
                    imageView.contentMode = .scaleAspectFit
                    imageView.clipsToBounds = true

                    // Remove any existing image views
                    uiView.superview?.subviews.forEach { view in
                        if view is UIImageView {
                            view.removeFromSuperview()
                        }
                    }

                    // Add the canvas view first, then the image view
                    uiView.superview?.addSubview(uiView)
                    uiView.superview?.addSubview(imageView)

                    // Ensure that the image view is placed below the canvas view
                    uiView.superview?.sendSubviewToBack(imageView)
          }
      }
}




    
    #Preview {
        CustomDesign()
    }
