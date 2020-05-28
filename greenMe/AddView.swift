//
//  AddView.swift
//  greenMe
//
//  Created by Katie Belanger on 5/28/20.
//  Copyright © 2020 Katie Belanger. All rights reserved.
//

import SwiftUI
import Alamofire
import SwiftyJSON

struct AddView: View {
    @Environment(\.presentationMode) var presentationMode

    @State private var definition = ""
    @State private var difficulty = ""
    @State private var duration = ""
    let difficulties = ["Easy", "Intermediate", "Hard"]
    let durations = ["One Day", "One Week", "One Month", "One Year", "One Time Fix"]

    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Challenge", text: $definition)
                    Picker("Difficulty", selection: $difficulty) {
                        ForEach(difficulties, id: \.self) { difficulty in
                            Text(difficulty)
                        }
                    }
                    Picker("Duration", selection: $duration) {
                        ForEach(durations, id: \.self) { duration in
                            Text(duration)
                        }
                    }
                }

                Button("Add Challenge") {
//                    let newChallenge = {
//                        definition : self.definition
//                        difficulty :  self.difficulty
//                        duration : self.duration
//                    }
//
                    do {
//                        try self.moc.save()
                        self.presentationMode.wrappedValue.dismiss()
//                    } catch {
//                        print("Whoops! \(error.localizedDescription)")
                    }
                }
            }.navigationBarTitle("New Challenge")
        }
    }
}


struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        AddView()
    }
}
