//
//  MapViews.swift
//  Swift-Demos
//
//  Created by John Johnston on 12/10/22.
//

import SwiftUI
import MapKit
import CoreLocation


struct MapViews: View {
    
    @State private var mapRe: MKCoordinateRegion = MKCoordinateRegion(.world)
    @State var searchLocation: String = ""
    @State var locationToSearch: MKMapItem = MKMapItem()
    @State var dropDownLocations: [MKMapItem] = []
    let searchRequest = MKLocalSearch.Request()
    
    
    var body: some View {
        
        ZStack {
            
            Map(coordinateRegion: $mapRe).ignoresSafeArea()
            VStack {
                
                TextField("Type a location", text: $searchLocation).frame(width: 350, height: 50).padding().font(.title).background(.gray).cornerRadius(10).onSubmit {
                    Task{
                        try await findLocation(location:searchLocation)
                    }
                }
                ScrollView{
                    ForEach(dropDownLocations, id: \.self){ item in
                        Button(action: {
                            locationToSearch = item
                            withAnimation{
                                changeLocation()
                            }
                        }, label: {
                            Text(item.name ?? "unknown").foregroundColor(.black)
                        }).frame(width: 350, height: 30).padding().font(.title3).background(.gray).cornerRadius(10).opacity(0.7)
                    }
                }
                Spacer()
            }
        }
    }
    
    func findLocation(location: String) async throws{
        dropDownLocations = []
        print("------------------------------------")
        searchRequest.naturalLanguageQuery = location
        let search = MKLocalSearch(request: searchRequest)
        
        try await search.start { resp, err in
            guard let response = resp else {
                print("Error")
                return
            }
            
            for item in response.mapItems{
                dropDownLocations.append(item)
            }
        }
    }
    
    func changeLocation(){
        let coordinates = locationToSearch.placemark.coordinate
        let clLocation = locationToSearch.placemark.location
        let coordinateSpan = MKCoordinateSpan(latitudeDelta: 10, longitudeDelta: 10)
        mapRe = MKCoordinateRegion(center: coordinates, span: coordinateSpan)
    }
}

struct MapViews_Previews: PreviewProvider {
    static var previews: some View {
        MapViews()
    }
}
