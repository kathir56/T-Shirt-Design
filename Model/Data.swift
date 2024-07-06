//
//  Data.swift
//  Design
//
//  Created by Kathiravan Murali on 20/02/24.
//

import Foundation
import SwiftUI
import SceneKit




struct navigations:Identifiable,Hashable
{
    
    
    var id = UUID()
    var lable : String
    var symbol : String
    var secondSymbol : String
    var isPresented : Bool
    
}

var splitView : [navigations] = [
    
    navigations( lable: "Product", symbol: "tshirt", secondSymbol: "tshirt.fill", isPresented: true),
    
    navigations(lable: "Add Text", symbol: "applepencil", secondSymbol: "applepencil.and.scribble", isPresented: false),
    
    navigations(lable: "Upload Art", symbol: "icloud.and.arrow.up", secondSymbol: "icloud.and.arrow.up.fill", isPresented: false),
    
    navigations( lable: "Add clip", symbol: "photo.badge.plus", secondSymbol:  "photo.badge.plus.fill", isPresented: false),
    
    navigations(lable: "Add Numbers", symbol: "18.circle", secondSymbol: "18.circle.fill", isPresented: false),

]


class TextEditor : ObservableObject
{
    @Published var tShirtFronttext : String = "Apple"
    @Published var tShirtFrontsize : Double = 50
    @Published var tShirtFrontrotation : Double = 0
    @Published var tShirtFrontcolor : Color = .blue
    
    @Published var tShirtBacktext : String = "Steve Jobs"
    @Published var tShirtBackNamesize : Double = 60
    @Published var tShirtBackNamecolor : Color = .black
    @Published var tShirtBackNumbercolor : Color = .black
    @Published var tShirtBackNumbersize : Double = 250
    @Published var tShirtBackrotation : Double = 5
    @Published var tShirtBackcolor : Color = .purple
    @Published var tshirtBackNumber : String = "24"
    
    var bindingToMyFrontTextProperty: Binding<String> {
            Binding(get: { self.tShirtFronttext }, set: { newValue in
                self.tShirtFronttext = newValue
            })
        }
    
    
    var bindingToMyFrontSizeProperty: Binding<Double> {
            Binding(get: { self.tShirtFrontsize}, set: { newValue in
                self.tShirtFrontsize = newValue
            })
        }
    
    var bindingToMyFrontRotationProperty: Binding<Double> {
            Binding(get: { self.tShirtFrontrotation }, set: { newValue in
                self.tShirtFrontrotation = newValue
            })
        }
    
    var bindingToMyFrontColorProperty: Binding<Color> {
            Binding(get: { self.tShirtFrontcolor }, set: { newValue in
                self.tShirtFrontcolor = newValue
            })
        }
    
    var bindingToMyBackTextProperty: Binding<String> {
            Binding(get: { self.tShirtBacktext }, set: { newValue in
                self.tShirtBacktext = newValue
            })
        }
    
    var bindingToMyBackSizeProperty: Binding<Double> {
            Binding(get: { self.tShirtBackNamesize }, set: { newValue in
                self.tShirtBackNamesize = newValue
            })
        }
    
    var bindingToMyBackNameSizeProperty: Binding<Double> {
            Binding(get: { self.tShirtBackNamesize }, set: { newValue in
                self.tShirtBackNamesize = newValue
            })
        }
    
    var bindingToMyBackNumberSizeProperty: Binding<Double> {
            Binding(get: { self.tShirtBackNumbersize }, set: { newValue in
                self.tShirtBackNumbersize = newValue
            })
        }
    
    var bindingToMyBackNameColorProperty: Binding<Color> {
            Binding(get: { self.tShirtBackNamecolor }, set: { newValue in
                self.tShirtBackNamecolor = newValue
            })
        }
    
    var bindingToMyBackNumberColorProperty: Binding<Color> {
            Binding(get: { self.tShirtBackNumbercolor }, set: { newValue in
                self.tShirtBackNumbercolor = newValue
            })
        }
    
    var bindingToMyBackRotationProperty: Binding<Double> {
            Binding(get: { self.tShirtBackrotation }, set: { newValue in
                self.tShirtBackrotation = newValue
            })
        }
    
    var bindingToMyBackColorProperty: Binding<Color> {
            Binding(get: { self.tShirtBackcolor }, set: { newValue in
                self.tShirtBackcolor = newValue
            })
        }
    
    var bindingToMyBackNumberProperty: Binding<String> {
            Binding(get: { self.tshirtBackNumber }, set: { newValue in
                self.tshirtBackNumber = newValue
            })
        }

}
