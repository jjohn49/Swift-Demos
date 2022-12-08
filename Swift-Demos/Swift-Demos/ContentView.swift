//
//  ContentView.swift
//  Swift-Demos
//
//  Created by John Johnston on 12/1/22.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var pets: MyPets
    var body: some View {
        TabView {
            NavigationView {
                CoreDataView().navigationTitle("Core Data: People")
            }.tabItem({
                Label("Core Data", systemImage: "")
            })
            
            NavigationView{
                EnvVarsViews().navigationTitle("Enviorment Variables Demo")
            }.tabItem({
                Label("Env Vars", systemImage: "")
            })
            
            NavigationView{
                ChartsViews().navigationTitle("Chart")
            }.tabItem({
                Label("Chart", image: "")
            })
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(MyPets())
    }
}
