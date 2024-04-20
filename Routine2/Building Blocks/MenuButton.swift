//
//  MenuButton.swift
//  Routine2
//
//  Created by Alex Westerlund on 2/3/24.
//

import SwiftUI

struct MenuButton: View {
    @Binding var isDailies: Bool
    var themeColor: Color
    
    var body: some View {
        Button(action: {
            isDailies.toggle()
        }, label: {
            VStack(alignment: .center, spacing: 0) {
                Image(systemName: "calendar")
                if isDailies {
                    Text(Date().formatted(.dateTime.weekday(.wide)) + ",")
                    Text(Date().formatted(.dateTime.month().day()))
                } else {
                    Text(Date().formatted(.dateTime.month(.wide)))
                    Text("mode")
                }
            }
            .foregroundStyle(.white)
            .font(.caption)
            .fontWeight(.bold)
            .padding(10)
            .background(themeColor)
            .clipShape(RoundedRectangle(cornerRadius: 10))
        })
    }
}

#Preview {
    MenuButton(isDailies: .constant(true), themeColor: .green)
}
