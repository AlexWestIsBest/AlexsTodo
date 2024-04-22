//
//  Monthlies.swift
//  Routine2
//
//  Created by Alex Westerlund on 1/31/24.
//

import SwiftUI

struct Monthlies: View {
    var body: some View {
        VStack {
            Checklist(listName: "Home", todoItems: $list1)
                .padding(.horizontal)
                        
            Checklist(listName: "Laundry", todoItems: $list2)
                .padding(.horizontal)
            
            Checklist(listName: "Journals", todoItems: $list3)
                .padding(.horizontal)
            
            Checklist(listName: "Finances", todoItems: $list4)
                .padding(.horizontal)
            
            Checklist(listName: "Laptop", todoItems: $list5)
                .padding(.horizontal)

            Checklist(listName: "Phone", todoItems: $list6)
                .padding(.horizontal)
            
            Checklist(listName: "Health & Body", todoItems: $list7)
                .padding(.horizontal)
            
            Checklist(listName: "Eleanor", todoItems: $list8)
                .padding(.horizontal)
        }
    }
    
    @State private var list1 = [
        TodoItem(name: "Clean dry erase board", duration: 10),
        TodoItem(name: "Clean bathroom", duration: 45),
        TodoItem(name: "Clean kitchen", duration: 45),
        TodoItem(name: "Vacuum", duration: 30),
    ]
    
    @State private var list2 = [
        TodoItem(name: "My clothes + pillow case", duration: 60),
        TodoItem(name: "Comforter & cat blankets", duration: 60),
        TodoItem(name: "Bedsheets & towels", duration: 60),
    ]

    @State private var list3 = [
        TodoItem(name: "Transfer JoaG", duration: 15),
        TodoItem(name: "Transfer PoaP", duration: 15),
        TodoItem(name: "Transfer NNY", duration: 15),
    ]
    
    @State private var list4 = [
        TodoItem(name: "Dig into spending", duration: 15),
    ]
    
    @State private var list5 = [
        TodoItem(name: "Inbox zero", duration: 15),
        TodoItem(name: "Empty downloads folder", duration: 15),
        TodoItem(name: "Empty desktop", duration: 30),
        TodoItem(name: "GRO: Downloads folder", duration: 30),
    ]
    
    @State private var list6 = [
        TodoItem(name: "Close Safari tabs", duration: 15),
        TodoItem(name: "GRO: Photo stream", duration: 30),
        TodoItem(name: "GRO: Clear app", duration: 30)
    ]
    
    @State private var list7 = [
        TodoItem(name: "Book haircut", duration: 5),
        TodoItem(name: "Cut fingernails", duration: 2),
        TodoItem(name: "Cut toenails", duration: 2),
        TodoItem(name: "Shave face", duration: 5),
        TodoItem(name: "Shave balls", duration: 10),
        TodoItem(name: "Refill nootropics", duration: 15),
    ]
    
    @State private var list8 = [
        TodoItem(name: "Trim Eleanor's nails", duration: 5),
        TodoItem(name: "Apply Frontline to Eleanor", duration: 5),
    ]
}

#Preview {
    ScrollView {
        Monthlies()
    }
        .frame(maxHeight: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
        .background(Color(.systemGray5))
}
