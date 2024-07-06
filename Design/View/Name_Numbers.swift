//
//  Name_Numbers.swift
//  Design
//
//  Created by Kathiravan Murali on 19/02/24.
//

import SwiftUI

struct Name_Numbers: View {
    @EnvironmentObject var Editor : TextEditor
    
    var body: some View {
        
        VStack(spacing: 20) {
            // Username Section
            Text("Enter your name")
                .font(.title)
                .fontWeight(.bold)
            TextField("Name", text: Editor.bindingToMyBackTextProperty)
                .padding()
                .border(Color.gray, width: 2)
                .cornerRadius(5.0)
            
            ColorPicker(selection: Editor.bindingToMyBackNameColorProperty, label: {
                Text("Select you Name Color")
                    .font(.title2)
            })
            
            Text("Name Size : \(Int(Editor.tShirtBackNamesize))")
            
            Slider(value: Editor.bindingToMyBackNameSizeProperty,in: 0...100) {
                Text("Name Size")
            }
            
            // Password Section
            Text("Enter your favourite number")
                .multilineTextAlignment(.center)
                .font(.title)
                .fontWeight(.bold)
            TextField("Number", text: Editor.bindingToMyBackNumberProperty)  // SecureField is used for password input
                .padding()
                .border(Color.gray, width: 2)
                .cornerRadius(5.0)
            
            
            ColorPicker(selection: Editor.bindingToMyBackNumberColorProperty, label: {
                Text("Select you Number Color")
                    .font(.title2)
            })
            
            Text("Number Size : \(Int(Editor.tShirtBackNumbersize))")
            
            Slider(value: Editor.bindingToMyBackNumberSizeProperty,in: 0...500) {
                Text("Number Size")
            }
            Spacer()
        }
        .padding()
    }
}

#Preview {
    Name_Numbers()
}
