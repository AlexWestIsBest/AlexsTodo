//
//  Dailies.swift
//  Routine2
//
//  Created by Alex Westerlund on 1/31/24.
//

import SwiftUI

struct Dailies: View {
    @State private var block1 = false
    @State private var block2 = false
    @State private var block3 = false
    @State private var block4 = false
    
    var body: some View {
        VStack {
            Checklist(listName: "Morning", todoItems: $list1)
            FocusTime(name: "1️⃣ Apply to 4 jobs")
            
            
            if !block1 {
                OnwardButton(block: $block1)
            } else {
                Group {
                    MealBreak(meal: "Breakfast", boring: true)
                    Checklist(listName: "Post-breakfast", todoItems: $list2)
                    HStack(spacing: 16) {
                        Text("[1440](message://)")
                        Text("[Eye contact](https://www.youtube.com/playlist?list=PLfEKqOAqLGd2kQ44ERAwQ8QWl_hV1cSyC)")
                        Text("[Asana Rebel](asanarebel://)")
                    }

                    FocusTime(name: "2️⃣ Ella's website refresh")
                }
                .transition(.scale)
                
                
                if !block2 {
                    OnwardButton(block: $block2)
                } else {
                    Group {
                        Checklist(listName: "Active recovery", todoItems: $list3)
                        MealBreak(meal: "Lunch", boring: true)
                        Checklist(listName: "Personal growth", todoItems: $list4)
                        HStack(spacing: 16) {
                            Text("[Deep Questions](https://thoughtcatalog.com/rania-naim/2016/02/40-deep-questions-to-ask-if-you-really-want-to-get-to-know-someone/)")
                            Text("[Email](message://)")
                        }
                        FocusTime(name: "3️⃣ LinkedIn/IG POSTS")
                    }
                    .transition(.scale)
                    
                    
                    if !block3 {
                        OnwardButton(block: $block3)
                    } else {
                        Group {
                            Checklist(listName: "Active recovery", todoItems: $list5)
                            MealBreak(meal: "Dinner", boring: false)
                            FocusTime(name: "4️⃣ Finish Nate's book cover")
                        }
                        .transition(.scale)
                        
                        if !block4 {
                            OnwardButton(block: $block4)
                        } else {
                            Group {
//                                Journaling(prompt: "The magic I witnessed today was...")
//                                Journaling(prompt: "The intention that came to me today was...")
                                Checklist(listName: "Nighttime prep", todoItems: $list6)
                                
                                Text("How can I make an extra $100 dollars?")
                            }
                            .transition(.scale)
                        }
                    }
                }
            }
        }
        .padding(.horizontal)
    }
    
    @State private var list1 = [
        TodoItem(name: "Brew Kona espresso", duration: 5),
        TodoItem(name: "30 horizontal arm twists", duration: 1)
    ]
    
    @State private var list2 = [
        TodoItem(name: "Read 1440", duration: 10),
        TodoItem(name: "Train eye contact", duration: 6),
        TodoItem(name: "Train enunciation", duration: 3),
        TodoItem(name: "Practice Asana Rebel yoga", duration: 6),
        TodoItem(name: "Drink protein shake", duration: 4),
        TodoItem(name: "Whiten teeth", duration: 3),
        TodoItem(name: "Start 1h LMNT timer", duration: 1),
    ]
    
    @State private var list3 = [
        TodoItem(name: "Meditate", duration: 20),
    ]
    
    @State private var list4 = [
//        TodoItem(name: "Recorded deep question", duration: 4),
        TodoItem(name: "Read all emails", duration: 15),
        TodoItem(name: "5 ab curl leg lifts", duration: 2)
//        TodoItem(name: "Wim Hof breathwork", duration: 14),
//        TodoItem(name: "MV \'Stage Effect\' quest", duration: 20),
    ]
    
    @State private var list5 = [
        TodoItem(name: "60s bar hang", duration: 2),
        TodoItem(name: "Shower", duration: 20),
        TodoItem(name: "Apply adapalene", duration: 5),
        TodoItem(name: "Apply moisturizer", duration: 5),
//        TodoItem(name: "4-4-4-4 Box breathing", duration: 7),
    ]
    
    @State private var list6 = [
        TodoItem(name: "Hardcode tomorrow's focalo", duration: 20),
        TodoItem(name: "4-7-8 breathing", duration: 5),
    ]
}

#Preview {
    ScrollView {
        Dailies()
    }
        .background(Color(.systemGray5))
}
