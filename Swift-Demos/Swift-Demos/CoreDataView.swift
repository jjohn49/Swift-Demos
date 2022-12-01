//
//  CoreDataView.swift
//  Swift-Demos
//
//  Created by John Johnston on 12/1/22.
//

import SwiftUI
import CoreData

struct CoreDataView: View {
    
    //State is declared to tell swift that these vars can change in the view
    @State var firstName: String = ""
    @State var lastName: String = ""
    @State var age: Int = 0
    @State var stateLivedIn: String = ""
    @State var dateOfBirth: Date = Date.now
    
    
    @Environment(\.managedObjectContext) private var viewContext
    
    
    //this modifier is added to the var people so core data knows to store
    //the latest data in the people database
    @FetchRequest(entity: People.entity(), sortDescriptors: []) private var people: FetchedResults<People>
    
    var body: some View {
        List{
            ForEach(people){ person in
                VStack{
                    Text("Name: \(person.firstName ?? "no name") \(person.lastName ?? "no last name")")
                    Text("Age: \(person.age ?? 0)")
                    Text("From: \(person.stateLiveIn ?? "no state given")")
                }
            }
        }
    }
}

struct CoreDataView_Previews: PreviewProvider {
    static var previews: some View {
        CoreDataView()
    }
}
