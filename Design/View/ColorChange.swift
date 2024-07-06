//
//  ColorChange.swift
//  Design
//
//  Created by Kathiravan Murali on 20/02/24.
//

import SwiftUI

struct ColorChange: View {
   @State var selectedColor: Color = .brown
    var body: some View {
        
        Text("MODEL View")
//        VStack {
//            HStack {
//                Image(systemName: "laurel.leading")
//                    .imageScale(.large)
//                    .foregroundColor(selectedColor)
//                
//                Text("Design")
//                    .font(.title)
//                    .fontWeight(.bold)
//                    .foregroundColor(selectedColor)
//                
//                Image(systemName: "laurel.trailing")
//                    .imageScale(.large)
//                    .foregroundColor(selectedColor)
//                
//                
//                
//            }
//            
//            ColorPicker(selection: $selectedColor) {
//                
//                
//                Text("Change color here: ")
//                    .font(.title2)
//                    .fontWeight(.bold)
//                    
//                    
//                
//                Rectangle()
//                    .fill(selectedColor)
//                    .frame(width: 100, height: 100)
//                    .clipShape(Circle())
//                    //.border(Color.black, width: 1)
//                    .background(Circle()
//                        .stroke(lineWidth: 15)
//                        .foregroundStyle(.black))
//                
//                
//                    .buttonBorderShape(.roundedRectangle(radius: 12))
//                
//                
//                
//
//            }
//            .padding(.horizontal, 50)
//            Spacer()
//        }
//        .padding()
    }
}


#Preview {
    ColorChange()
}
