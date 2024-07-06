//
//  Add_Text.swift
//  Design
//
//  Created by Kathiravan Murali on 19/02/24.
//

import SwiftUI

struct Add_Text: View {
    @EnvironmentObject var Editor : TextEditor
    var body: some View {
        NavigationStack
        {
        VStack(spacing: 20) {
            // Username Section
            Text("Enter the Text")
                .font(.title)
                .fontWeight(.bold)
            TextField("Text", text: Editor.bindingToMyFrontTextProperty)
                .padding()
                .padding(.horizontal,30)
                .border(Color.gray, width: 2)
                .cornerRadius(5.0)
            
            VStack(spacing: 20) {
                /// Display the current volume as a percentage
                Text("Size: \(Int(Editor.tShirtFrontsize))")
                    .font(.title2)
                
                /// A slider allowing adjustment of the volume between 0 and 100.
                Slider(value: Editor.bindingToMyFrontSizeProperty, in: 0...100) {
                    Text("Size")
                    
                }
                .onChange(of: Editor.tShirtFrontsize, { oldValue, newValue in
                    print(newValue)
                })
                .padding()
                
                Text("Rotation Effect: \(Int(Editor.tShirtFrontrotation))")
                    .font(.title2)
                
                /// A slider allowing adjustment of the volume between 0 and 100.
                Slider(value: Editor.bindingToMyFrontRotationProperty, in: 0...360) {
                    Text("Rotate")
                }
                .padding()
                
                HStack {
                    Spacer()
                    ColorPicker(selection: Editor.bindingToMyFrontColorProperty, label: {
                        Text("Select the Font Color")
                            .font(.title2)
                    })
                    Spacer()
                }
                
            }
            .padding()
            Spacer()
        }
        .padding()
    }
        
    }
}

#Preview {
    Add_Text()
}
