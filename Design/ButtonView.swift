//
//  SwiftUIView.swift
//  Design
//
//  Created by Kathiravan Murali on 20/02/24.
//

import SwiftUI

struct ButtonView: View {
    
    var navigation : navigations
    
    var body: some View {
        
        NavigationLink {
            if navigation.lable == "Product"
            {
                Add_Text()
            }
            else
            {
                PhotoPickerView()
            }
        } label: {
            
                HStack {
                    Text(navigation.lable)
                        .font(.title)
                        .fontWeight(.semibold)
                    Spacer()
                    Image(systemName: navigation.isPresented ?  navigation.secondSymbol : navigation.symbol )
                        .font(.title)
                        .fontWeight(.semibold)
                }
                .padding()
                .frame(maxWidth: 500)
                .background()
                .shadow(radius: navigation.isPresented ? 10 : 0)
                .hoverEffect(.highlight)
        }


        
    }
}

#Preview {
    ButtonView(navigation: splitView[0])
}
