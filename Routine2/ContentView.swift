//
//  ContentView.swift
//  Routine2
//
//  Created by Alex Westerlund on 1/30/24.
//

import SwiftUI

struct ContentView: View {
    @State private var isDailies = true
    var themeColor = Color(.systemGreen)

    var body: some View {
        ScrollView {
            Spacer()
                .frame(height: 50)
            
            HStack {
                VStack(alignment: .leading, spacing: 0) {
                    Text("Welcome,")
                        .font(.title3)
                        .fontWeight(.black)
                        .foregroundStyle(themeColor)
                    Text("Alex Westerlund")
                        .font(.title)
                        .fontWeight(.black)
                }
                
                Spacer()
                
                MenuButton(isDailies: $isDailies, themeColor: themeColor)
            }
            .padding(.horizontal)

            if isDailies {
                Dailies()
            } else {
//                Weeklies()
                Monthlies()
            }
            
            Spacer()
                .frame(height: 50)
        }
        .padding(.top)
        .background(Color(.systemGray5))
        .edgesIgnoringSafeArea(.top)
        .dynamicTypeSize(.large)
        .scrollDismissesKeyboard(.interactively)
    }
}




#Preview {
    ContentView()
}
