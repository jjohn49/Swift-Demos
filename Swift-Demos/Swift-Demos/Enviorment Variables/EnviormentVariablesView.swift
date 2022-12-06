//
//  EnviormentVariablesView.swift
//  Swift-Demos
//
//  Created by John Johnston on 12/5/22.
//

import SwiftUI

struct EnviormentVariablesView: View {
    @EnvironmentObject var pets: MyPets
    var body: some View {
        VStack{
            Text("Check if pets was modified: \(pets.wasModified.description)")
            
            if pets.allPets.isEmpty {
                Text("No pets :(")
            }else{
                List{
                    ForEach(pets.allPets){ pet in
                        Text(pet.name)
                    }
                }
            }
        }
    }
}

struct AddPetView:View{
    @EnvironmentObject var pets:MyPets
    @State var name: String = ""
    @State var species: String = ""
    
    var body: some View{
        VStack {
            Text("Modify Enviorment Variable Here")
            Form{
                Section("Name", content: {
                    TextField("Name of Pet", text: $name)
                })
                
                Section("Species", content: {
                    TextField("Name of Species", text: $species)
                })
                
                Button(action: {
                    pets.allPets.append(Pet(name: name, species: species))
                    pets.wasModified = true
                }, label: {
                    Text("Add Pet")
                })
            }
        }
    }
}

struct EnviormentVariablesView_Previews: PreviewProvider {
    static var previews: some View {
        EnviormentVariablesView().environmentObject(MyPets())
    }
}
