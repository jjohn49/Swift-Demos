//
//  MapViews.swift
//  Swift-Demos
//
//  Created by John Johnston on 12/10/22.
//

import SwiftUI
import MapKit


struct MapViews: View {
    
    @State private var mapRe = MKCoordinateRegion(.world)
    
    var body: some View {
        
            
        TabView {
            Map(coordinateRegion: $mapRe).tabItem({
                Label("Map", systemImage: "globe").bold().font(.title)
            })
            
            
        }
                
            
        
        
    }
}

struct MapViews_Previews: PreviewProvider {
    static var previews: some View {
        MapViews()
    }
}
