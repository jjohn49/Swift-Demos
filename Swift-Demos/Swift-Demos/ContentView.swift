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
                EnviormentVariablesView().navigationTitle("Env Vars: Pets")
            }.tabItem({
                Label("Env Vars", systemImage: "")
            })
            
            NavigationView{
                AddPetView().navigationTitle("Add Pet")
            }.tabItem({
                Label("Add Pet", systemImage: "")
            })
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(MyPets())
    }
}
