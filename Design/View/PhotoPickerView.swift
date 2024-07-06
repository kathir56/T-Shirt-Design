//
//  PhotoPickerView.swift
//  Design
//
//  Created by Kathiravan Murali on 21/02/24.
//

import SwiftUI
import PhotosUI

struct PhotoPickerView: View {
    @State private var pickerItems = [PhotosPickerItem]()
    @State private var selectedImages = [Image]()
    @State private var opacity : Bool = true
    
    var body: some View {
        PhotosPicker( selection: $pickerItems, matching: .images) {
            HStack(alignment: .center,spacing: 20)
            {
                Text("Selected your Images")
                    .font(.system(size: 35))
                    .fontWeight(.bold)
                    .opacity(opacity ? 1.0 : 2.0)
                
                Image(systemName: "photo")
                    .resizable()
                    .fontDesign(.rounded)
                    .fontWeight(.bold)
                    .opacity(opacity ? 1.0 : 2.0)
                    .frame(width: 50,height: 40)
            }
        }
        
        ScrollView {
            VStack {
                ForEach(0..<selectedImages.count, id: \.self) { i in
                    selectedImages[i]
                        .resizable()
                        .scaledToFit()
                        .padding(.vertical)
                        .padding(.horizontal)
                }
                .onChange(of: pickerItems) {
                    Task {
                        selectedImages.removeAll()

                        for item in pickerItems {
                            if let loadedImage = try await item.loadTransferable(type: Image.self) {
                                selectedImages.append(loadedImage)
                            }
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    PhotoPickerView()
}
