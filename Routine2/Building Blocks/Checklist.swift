//
//  Checklist.swift
//  Routine2
//
//  Created by Alex Westerlund on 1/30/24.
//

import SwiftUI

struct Checklist: View {
    var listName: String
    @Binding var todoItems: [TodoItem]
    
    @State private var showAlert = false
    @State private var allFinished = false
    
    var themeColor = Color(.systemGreen)
    
    var totalDuration: String {
        todoItems.reduce(0) { $0 + $1.duration }.description
    }

    var body: some View {
        VStack(spacing: 0) {
            // MARK: Top Title
            HStack {
                Text(listName)
                    .font(.title3)
                    .fontWeight(.bold)
                    .foregroundStyle(todoItems.allSatisfy({ $0.state != .pending }) ? Color(.systemGray) : Color(.label))
                
                Text("- " + totalDuration + "m")
                    .font(.title3)
                    .foregroundStyle(Color(.systemGray))
                
                Spacer()
            }
            .padding(.horizontal)
            .padding(.vertical, 8)

            
            // MARK: Checklist Maker
            VStack {
                ForEach($todoItems) { $item in
                    ChecklistItem(item: $item, allFinished: $allFinished)
                }
            }
            // checklist
            .padding()
            .background(todoItems.allSatisfy({ $0.state != .pending }) ? Color(.systemGray5) : Color(.systemBackground))
            .clipShape(RoundedRectangle(cornerRadius: 16))
            .onChange(of: todoItems.allSatisfy({ $0.state != .pending })) {
                showAlert = todoItems.allSatisfy({ $0.state == .completed })
                withAnimation(.bouncy(extraBounce: 0.2)) {
                    allFinished = todoItems.allSatisfy({ $0.state != .pending })
                }
            }
        }
        // title+checklist
        .background(Color(.systemGray3))
        .clipShape(RoundedRectangle(cornerRadius: 16))
        .shadow(radius: 8)
        .fontDesign(.serif)
        .alert("Discipline Checkpoint", isPresented: $showAlert) {
            Button("I'm disciplined to win", role: .cancel) { }
        } message: {
            Text("You've finished another segment! Remember: you're playing to win now, not to stay safe.")
        }
    }

}



#Preview {
    Checklist(listName: "Sample", todoItems: .constant([
        TodoItem(name: "Short Yoga", duration: 5),
        TodoItem(name: "Protein shake", duration: 5),
        TodoItem(name: "Train enunciation", duration: 1),
        TodoItem(name: "Whiten teeth", duration: 3),
    ]))
        .frame(maxHeight: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
        .padding()
        .background(Color(.systemGray5))
}
