// Created by Enes UTKU

import SwiftUI
import SwiftData

struct ContentView: View {
    // This line injects the model context into the property context using the Environment property wrapper in SwiftUI.
    @Environment(\.modelContext) private var context
    
    // This line uses the @Query property wrapper to automatically fetch an array of Data objects and assigns it to items.
    @Query private var items: [Data]
    
    var body: some View {
        VStack {
            Text("Add Data")
            Button("Add an item") {
                addItem()
            }
            
            // This code displays each item’s name from the items array in a list
            List {
                ForEach(items) { item in
                    HStack {
                        Text(item.name)
                        Spacer()
                        Button(action: {
                            updateItem(item)
                        }, label: {
                            Image(systemName: "arrow.counterclockwise")
                        })
                    }
                 
                }
                .onDelete(perform: { indexes in
                    for index in indexes {
                        deleteItem(items[index])
                    }
                })
            }
        }
        .padding()
    }
    
    func addItem() {
        // Create the item
        let item = Data(name: "Test")
        // Add the item to the data context
        context.insert(item)
    }
    
    func deleteItem(_ item: Data) {
        // This line removes the item from the data context using the delete method on the context object
        context.delete(item)
    }
    
    func updateItem(_ item: Data) {
        // Edit the item data
        item.name = "Updated Test"
        // Save the context
        // The try? is used here to handle potential errors by ignoring them and allowing the program to continue running.
        try? context.save()
    }
}

#Preview {
    ContentView()
}
