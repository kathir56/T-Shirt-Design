//
//  T-ShirtBackSide.swift
//  Design
//
//  Created by Kathiravan Murali on 25/02/24.
//

import SwiftUI

struct T_ShirtBackSide: View {
    @EnvironmentObject var Editor : TextEditor
    @State private var image = UIImage(named: "tShirtBack")
    @State private var namePosition = CGPoint(x: 300, y: 200)
    @State private var numberPosition = CGPoint(x: 300, y: 400)
    private var size = 10
    @State private var tShirtFrontColor = Color.purple
    
    var body: some View {
        
        GeometryReader{proxy -> AnyView in
            
            let size = proxy.frame(in: .global).size
            
            return AnyView(
                
                
                VStack {
                    ColorPicker(selection: $tShirtFrontColor, label: {
                        Text("Select your T Shirt Color")
                            .font(.title2)
                    })
                    .padding()
                    
                    ZStack {
                        DrawView(photo: $image, size: size, color: $tShirtFrontColor)
                        Text(Editor.tShirtBacktext)
                            .font(.system(size: Editor.tShirtBackNamesize))
                            .foregroundStyle(Editor.tShirtBackNamecolor)
                            .position(namePosition)
                            .gesture(
                                DragGesture()
                                    .onChanged { value in
                                        namePosition = value.location
                                    }
                            )
                        
                        Text(Editor.tshirtBackNumber)
                            .font(.system(size: Editor.tShirtBackNumbersize))
                            .foregroundStyle(Editor.tShirtBackNumbercolor)
                            .position(numberPosition)
                            .gesture(
                                DragGesture()
                                    .onChanged { value in
                                        numberPosition = value.location
                                    }
                            )
                    }
                    
                }
                
            )
        }
    }
}

#Preview {
    T_ShirtBackSide()
}
