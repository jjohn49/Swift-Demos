//
//  ContentView.swift
//  Swift-Demos
//
//  Created by John Johnston on 12/1/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            CoreDataView().navigationTitle("People")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
