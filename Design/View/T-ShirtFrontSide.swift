//
//  T-ShirtFrontSide.swift
//  Design
//
//  Created by Kathiravan Murali on 25/02/24.
//

import SwiftUI

struct T_ShirtFrontSide: View {
    @EnvironmentObject var Editor : TextEditor
    @State private var image = UIImage(named: "tShirtFront")
    @State private var textPosition = CGPoint(x: 300, y: 300)
    private var size = 10
    @State private var tShirtBackcolor = Color.blue
    var body: some View {
        
        GeometryReader{proxy -> AnyView in
            
            let size = proxy.frame(in: .global).size
            
            return AnyView(
                
                
                VStack {
                    ColorPicker(selection: $tShirtBackcolor, label: {
                        Text("Select your T Shirt Color")
                            .font(.title2)
                    })
                    .padding()
                    
                    ZStack {
                        DrawView(photo: $image, size: size, color: $tShirtBackcolor)
                        Text(Editor.tShirtFronttext)
                            .font(.system(size: Editor.tShirtFrontsize))
                            .rotationEffect(Angle(degrees: Editor.tShirtFrontrotation))
                            .foregroundStyle(Editor.tShirtFrontcolor)
                            .position(textPosition)
                            .gesture(
                                DragGesture()
                                    .onChanged { value in
                                        textPosition = value.location
                                    }
                            )
                    }
                    
            
                }
            )
        }
    }
}

#Preview {
    T_ShirtFrontSide()
}
