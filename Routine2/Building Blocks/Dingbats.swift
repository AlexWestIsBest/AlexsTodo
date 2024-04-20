//
//  OnwardButton.swift
//  Routine2
//
//  Created by Alex Westerlund on 2/26/24.
//

import SwiftUI

struct FocusTime: View {
    var name: String
    
    var body: some View {
        ZStack {
            Divider()
                .padding()
                .padding(.vertical)
            Text("  " + name + "  ")
                .font(.footnote)
                .foregroundStyle(Color(.systemGray))
                .background(Color(.systemGray5))
        }
    }
}



struct OnwardButton: View {
    @Binding var block: Bool
    
    let tap = UIImpactFeedbackGenerator(style: .light)

    var body: some View {
        Button("Finished focusing?", action: {
            withAnimation(.bouncy(extraBounce: 0.07)) {
                block.toggle()
                tap.impactOccurred()
            }
        })
            .foregroundStyle(Color(.systemGreen))
            .padding(.top, -16)
            .padding(.bottom, 200)
            .font(.title3)
            .fontDesign(.serif)
            .onAppear {
                tap.prepare()
            }
    }
}



#Preview {
    VStack {
        FocusTime(name: "Meat & Potatoes")
        OnwardButton(block: .constant(false))
    }
}
