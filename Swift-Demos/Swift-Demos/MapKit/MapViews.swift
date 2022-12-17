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
    @State var searchLocation: String = ""
    let searchRequest = MKLocalSearch.Request()
    
    var body: some View {
        
            
        TabView {
            ZStack {
                
                Map(coordinateRegion: $mapRe).ignoresSafeArea()
                VStack {
                    
                    TextField("Type a location", text: $searchLocation).frame(width: 350, height: 50).padding().font(.title).background(.gray).cornerRadius(10).onSubmit {
                        Task{
                            try await findLocation(location:searchLocation)
                        }
                    }
                    Spacer()
                }
            }.tabItem({
                Label("Map", systemImage: "globe").bold().font(.title)
            })
        }
    }
    
    func findLocation(location: String) async throws{
        searchRequest.naturalLanguageQuery = location
        let search = MKLocalSearch(request: searchRequest)
        
        try await search.start { resp, err in
            guard let response = resp else {
                print("Error")
                return
            }
            
            for item in response.mapItems{
                print(item.placemark)
            }
        }
    }
}

struct MapViews_Previews: PreviewProvider {
    static var previews: some View {
        MapViews()
    }
}
