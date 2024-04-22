//
//  MealBreak.swift
//  Routine2
//
//  Created by Alex Westerlund on 2/5/24.
//

import SwiftUI

struct MealBreak: View {
    var meal: String
    var boring: Bool
    
    @FocusState private var isFocused: Bool
    @State private var text = ""
    @State private var isBoring = false
    var themeColor = Color(.systemGreen)
    
    var hasEaten: Bool {
        return text.count > 5 && isBoring
    }

    var body: some View {
        VStack {
            HStack {
                Text(meal)
                    .foregroundStyle(hasEaten ? Color(.systemGray) : Color(.label))
                    .font(.title3)
                    .fontWeight(.bold)
                    .fontDesign(.serif)
                    .padding(8)
                    .background(Color(.systemGray4))
                    .clipShape(RoundedRectangle(cornerRadius: 8))
                TextField("What did you eat?", text: $text, axis: .vertical)
                    .focused($isFocused)
                    .textFieldStyle(.roundedBorder)
                    .padding(.trailing, 4)
            }
            
            if boring {
                Toggle(isOn: $isBoring, label: {
                    Text("Was is a 'boring' break?")
                        .foregroundStyle(hasEaten ? Color(.systemGray) : Color(.label))
                })
                .padding(8)
            } else {
                Text(meal + " is 'boring'-optional")
                    .italic()
                    .foregroundStyle(Color(.systemGray))
            }
        }
        .padding(8)
        .background(hasEaten ? Color(.systemGray5) : Color(.systemBackground))
        .clipShape(RoundedRectangle(cornerRadius: 16))
        .shadow(radius: 8)
    }
}

#Preview {
    MealBreak(meal: "Breakfast", boring: true)
        .frame(maxHeight: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
        .padding()
        .background(Color(.systemGray5))
}
