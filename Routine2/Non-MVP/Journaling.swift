//
//  Journaling.swift
//  Routine2
//
//  Created by Alex Westerlund on 2/5/24.
//

import SwiftUI

struct Journaling: View {
    var prompt: String
    @State private var text = ""

    var body: some View {
        VStack {
            Text(prompt)
                .multilineTextAlignment(/*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/)
                .frame(maxWidth: .infinity, alignment: .leading)
                .fontWeight(.bold)
                .fontDesign(.serif)
            TextField("Journal here", text: $text, axis: .vertical)
                .lineLimit(2...10)
                .textFieldStyle(.roundedBorder)
        }
        .padding()
        .background(Color(.systemBackground))
        .clipShape(RoundedRectangle(cornerRadius: 16))
        .shadow(radius: 8)
    }

}

#Preview {
    Journaling(prompt: "The magic I witnessed today was...")
        .frame(maxHeight: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
        .padding()
        .background(Color(.systemGray5))
}
