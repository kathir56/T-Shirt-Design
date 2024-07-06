//
//  CustomImage.swift
//  Design
//
//  Created by Kathiravan Murali on 25/02/24.
//

import SwiftUI

struct CustomImage: View {
    
    @EnvironmentObject var Editor : TextEditor
    
    @State private var textPosition = CGPoint(x: 200, y: 200)
    @State var color = Color.black
    @State var imageIndex = 0
    @State private var viewRefreshId = UUID()
    @State var images = [UIImage(named: "tShirtFront"), UIImage(named: "tShirtBack")]
    @State var isTrue = true
    @State private var stickerPosition = CGPoint(x: 100, y: 100)
    @State private var stickerScale: CGFloat = 1.0
    @State private var stickerRotation: Double = 0.0
    var body: some View {
        
        ZStack
        {
            
            GeometryReader{proxy -> AnyView in
                
                let size = proxy.frame(in: .global).size
                
                return AnyView(
                    VStack
                    {
                        ColorPicker(selection: $color) {
                            
                            
                            Text("Change color here: ")
                                .font(.title2)
                                .fontWeight(.bold)
                        }
                        .padding(.top)
                        .frame(width:200)
                        ZStack {
                            DrawView( photo: $images[imageIndex], size: size, color: $color)
                            
                            
                            Image("20")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 100, height: 100)
                                .position(stickerPosition)
                                .scaleEffect(stickerScale)
                                .rotationEffect(Angle(degrees: stickerRotation))
                                .gesture(
                                    DragGesture()
                                        .onChanged { value in
                                            stickerPosition = value.location
                                        }
                                )
                                .gesture(
                                    MagnificationGesture()
                                        .onChanged { scale in
                                            stickerScale = scale.magnitude
                                        }
                                )
                                .gesture(
                                    RotationGesture()
                                        .onChanged { angle in
                                            stickerRotation = angle.degrees
                                        }
                                )
                            Text(Editor.tShirtBacktext)
                                .font(.system(size: Editor.tShirtFrontsize))
                                .foregroundStyle(.black)
                                .foregroundColor(.white) // Customiz
                                .position(textPosition)
                                .gesture(
                                    DragGesture()
                                        .onChanged { value in
                                            textPosition = value.location
                                        }
                                )
                        }
                    }
                        .overlay(content: {
                            
                            HStack {
                                Spacer()
                                VStack {
                                    Button(action: {
                                        imageIndex = (imageIndex + 1) % images.count
                                        isTrue.toggle()
                                    }, label: {
                                        
                                        VStack {
                                            Image(isTrue ? "tShirtBack" : "tShirtFront")
                                                .resizable()
                                                .scaledToFit()
                                                .frame(width: 200,height: 250)
                                            .symbolRenderingMode(.multicolor)
                                            .border(.black, width: 5)
                                            
                                            Text(isTrue ?   "T-Shirt Back" : "T-Shirt Front")
                                                .font(.title3)
                                                .fontWeight(.light)
                                        }
                                        .padding()
                                        .background()
                                        .shadow(radius: 10)
                                        
                                    })
                                        Spacer()
                                        
                                    }
                                }
                            })
                    
                )
                
            }
            
            
            
        }
        .environmentObject(Editor)
    }
}


#Preview {
    CustomImage()
}
