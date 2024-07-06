//
//  Add_Product.swift
//  Design
//
//  Created by Kathiravan Murali on 19/02/24.
//

import SwiftUI

struct Add_Product: View {
    
    @State var gridLayout : [GridItem] = [GridItem(.flexible())]
    @State var gridColumn : Double = 3.0
    
    
    func gridSwtich()
    {
        gridLayout = Array(repeating: .init(.flexible()), count: 2)
    }
    
    var body: some View {
        
        ScrollView(.vertical,showsIndicators: false)
        {
            VStack(alignment:.center,spacing: 16)
            {
                LazyVGrid(columns: gridLayout,spacing: 5) {
                    
                    ForEach(1..<18){item in
                        Image("\(item)")
                            .padding(.horizontal)
                    }
                }
            }
        }
        .onAppear(perform: {
            gridSwtich()
        })
    }
}

#Preview {
    Add_Product()
}
