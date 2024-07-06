//
//  ContentView.swift
//  Design
//
//  Created by Kathiravan Murali on 19/02/24.
//

import SwiftUI
import SceneKit

struct ContentView: View {
    @EnvironmentObject var Editor : TextEditor
    @State var isMenuOpen: String = " "
    @State var selectedView : navigations?
    
    var splitViews : [navigations] = splitView
    
    var body: some View {
        NavigationSplitView {
            List(splitView, id:\.self,selection : $selectedView) { navigation in
            
                NavigationLink {
                    if navigation.lable == "Product"
                    {
                        Add_Text()
                    }
                    else if navigation.lable == "Add Text"
                    {
                        Add_Text()
                    }
                    else if navigation.lable == "Upload Art"
                    {
                        PhotoPickerView()
                    }
                    else if navigation.lable  == "Add clip"
                    {
                        Add_Product()
                    }
                    else
                    {
                        Name_Numbers()
                    }
                } label: {
                    
                        HStack {
                            Text(navigation.lable)
                                .font(.title)
                                .fontWeight(.semibold)
                                .foregroundStyle(.black)
                            Spacer()
                            Image(systemName: navigation.isPresented ?  navigation.secondSymbol : navigation.symbol )
                                .font(.title)
                                .fontWeight(.semibold)
                                .foregroundStyle(.black)
                        }
                        .padding()
                        .frame(maxWidth: 500)
                        .background()
                        //.shadow(radius: navigation.isPresented ? 10 : 0)
                        .hoverEffect(.highlight)
                }


                    
            }
            .onChange(of: selectedView?.lable ?? "Product") { oldValue, newValue in
                isMenuOpen = newValue
            }
        }content: {
        }detail: {
            if isMenuOpen == "Product"
            {
                Add_Art()// need to change
                    .environmentObject(Editor)
            }
            else if isMenuOpen == "Add Text"
            {
                T_ShirtFrontSide()
                    .environmentObject(Editor)
            }
            else if isMenuOpen == "Upload Art"
            {
                CustomImage()
                    .environmentObject(Editor)
            }
            else if isMenuOpen  == "Add clip"
            {
                CustomDesign()
                    .environmentObject(Editor)
            }
            else if isMenuOpen == "Add Numbers"
            {
                T_ShirtBackSide()
                    .environmentObject(Editor)
            }
            else
            {
                Add_Art()
            }
            
        }
    }
}


//        NavigationSplitView {
//            List(view,selection: $isMenuOpen, rowContent: {_ in
////                ForEach(view){item in
////                    ButtonView(navigation: item)
////                }
//
//            })
////                .padding(.top,10)
////                .navigationBarTitle(
////                    Text("Home")
////                    .font(.largeTitle)
////                    .fontWeight(.bold)
////                , displayMode: .large)
//        } detail:
//        {
//
//        }
//
//        }


//












#Preview {
    ContentView()
}

