//
//  Weeklies.swift
//  Routine2
//
//  Created by Alex Westerlund on 2/21/24.
//

import SwiftUI

struct Weeklies: View {
    @AppStorage("learnDanceMoveLog") var learnDanceMoveLog: String = ""
    @AppStorage("takeColdShowerLog") var takeColdShowerLog: String = ""
    @AppStorage("playTromboneLog") var playTromboneLog: String = ""
    @AppStorage("goForHikeLog") var goForHikeLog: String = ""
    @AppStorage("trainEyesightLog") var trainEyesightLog: String = ""
    @AppStorage("postLinkedInLog") var postLinkedInLog: String = ""
    @AppStorage("postInstagramLog") var postInstagramLog: String = ""

    var body: some View {
        ScrollView {
            Text("Weekly items")
                .font(.title)
                .underline()
            
            TextField("Learn a new dance move", text: $learnDanceMoveLog)
            TextField("Take a cold shower", text: $takeColdShowerLog)
            TextField("Play trombone", text: $playTromboneLog)
            TextField("Go for a hike", text: $goForHikeLog)
            TextField("Train eyesight", text: $trainEyesightLog)
            TextField("Post on LinkedIn", text: $postLinkedInLog)
            TextField("Post on Instagram", text: $postInstagramLog)
        }
        .padding(.horizontal)
    }
}


#Preview {
    Weeklies()
}
