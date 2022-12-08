//
//  ChartsViews.swift
//  Swift-Demos
//
//  Created by John Johnston on 12/8/22.
//

import SwiftUI
import Charts

struct ChartsViews: View {
    var body: some View {
        MyChart().padding()
    }
}

struct Transaction: Identifiable, Hashable{
    var id = UUID()
    var cost: Double
    var strDate: String
    var person: String
}

struct MyChart: View{
    var transactions: [Transaction] = [
        Transaction(cost: 1.37, strDate: "11-1", person: "Jack"),
        Transaction(cost: 10.15, strDate: "11-1", person: "Sam"),
        Transaction(cost: 8.40, strDate: "11-2", person: "Jack"),
        Transaction(cost: 2.39, strDate: "11-3", person: "Sam"),
        Transaction(cost: 45.01, strDate: "11-4", person: "Jack"),
        Transaction(cost: 12.22, strDate: "11-7", person: "Sam")
    ]
    
    var body: some View{
        Chart{
            ForEach(transactions){
                LineMark(x: .value("Date", $0.strDate), y: .value("Cost", $0.cost)).foregroundStyle(by: .value("Person", $0.person))
            }
        }
    }
}

struct ChartsViews_Previews: PreviewProvider {
    static var previews: some View {
        ChartsViews()
    }
}
