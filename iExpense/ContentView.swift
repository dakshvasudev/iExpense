//
//  ContentView.swift
//  iExpense
//
//  Created by daksh vasudev on 29/05/24.
//

import SwiftUI

struct Expense{
    let name : String
    let type : String
    let amount : Int
}

@Observable
class Expenses{
    var items = [Expense]()
}

struct ContentView: View {
    @State private var items = Expenses().items
    
    func removeElement (offSet : IndexSet ){
        items.remove(atOffsets: offSet)
    }
    
    var body: some View {
        NavigationStack{
            List{
                ForEach(items, id: \.name){item in
                    Text(item.name)
                }.onDelete(perform: removeElement)
            }.navigationTitle("iExpense")
                .toolbar{
                    Button("Add expense" ,systemImage: "plus"){
                        let expense = Expense(name: "Test", type: "Personal", amount: 5)
                        items.append(expense)
                    }
                }
        }
    }
}

#Preview {
    ContentView()
}
