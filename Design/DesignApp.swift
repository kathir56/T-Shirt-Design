//
//  DesignApp.swift
//  Design
//
//  Created by Kathiravan Murali on 19/02/24.
//

import SwiftUI

@main
struct DesignApp: App {
    @StateObject var Editor = TextEditor()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(Editor)
//            Add_Art()
//                .environmentObject(Editor)
//            //Writer()
//            //Add_Art()
//          CustomDesign()
//                .environmentObject(Editor)
        }
    }
}
