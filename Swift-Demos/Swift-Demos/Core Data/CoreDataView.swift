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
    @State var stateLivedIn: String = ""
    @State var dateOfBirth: Date = Date.now
    
    @State var popUp: Bool = false
    
    
    @Environment(\.managedObjectContext) private var viewContext
    
    
    //this modifier is added to the var people so core data knows to store
    //the latest data in the people database
    @FetchRequest(entity: People.entity(), sortDescriptors: []) private var people: FetchedResults<People>
    
    var body: some View {
        Group{
            if people.isEmpty{
                Text("No People in Core Data")
            }else{
                List{
                    ForEach(people){ person in
                        VStack{
                            Text("Name: \(person.firstName ?? "no name") \(person.lastName ?? "no last name")")
                            Text("From: \(person.stateLiveIn ?? "no state given")")
                        }
                    }
                }
            }
        }.toolbar{
            ToolbarItem{
                Button(action: {
                    popUp.toggle()
                }, label: {
                    Text("Add Person")
                })
            }
        }.sheet(isPresented: $popUp, content: {
            AddPersonView(firstName: $firstName, lastName: $lastName, stateLivedIn: $stateLivedIn, dateOfBirth: $dateOfBirth)
        })
    }
}

struct AddPersonView:View{
    
    @Environment(\.managedObjectContext) private var viewContext
    
    @FetchRequest(entity: People.entity(), sortDescriptors: []) private var people: FetchedResults<People>
    
    
    @Binding var firstName:String
    @Binding var lastName:String
    @Binding var stateLivedIn: String
    @Binding var dateOfBirth: Date
    
    var body: some View{
        Form{
            Section("Name", content: {
                TextField("first name", text: $firstName)
                TextField("last name", text: $lastName)
            })
            
            Section("About", content: {
                DatePicker("Date of Birth", selection: $dateOfBirth, displayedComponents: .date)
                TextField("State That you Live In", text: $stateLivedIn)
            })
            
            Button("Submit", action: {
                withAnimation{
                    let person = People(context: viewContext)
                    person.firstName = firstName
                    person.lastName = lastName
                    person.dateOfBirth = dateOfBirth
                    person.stateLiveIn = stateLivedIn
                    
                    do{
                        try viewContext.save()
                    }catch {
                        let error = error as NSError
                        fatalError("Error saving to CoreDate: \(error)")
                    }
                }
            })
        }
    }
}



struct CoreDataView_Previews: PreviewProvider {
    static var previews: some View {
        CoreDataView()
    }
}
