//
//  ContentView.swift
//  greenMe
//
//  Created by Katie Belanger on 5/27/20.
//  Copyright © 2020 Katie Belanger. All rights reserved.
//

import SwiftUI
import Alamofire
import SwiftyJSON

struct ContentView: View {
    
    @ObservedObject var obs = durationFetchRequest()
    
    @State var showingAddChallenge = false
    
    var body: some View {
    NavigationView {
        List {
            Text("Choose the Duration of Your Sustainability Challenge!")
            ForEach(obs.datas, id: \.id) { i in
        NavigationLink(destination:
        Text(i.challenges)) {
                durationCard(length: i.length, challenges: i.challenges)
                }

            }
        }.navigationBarTitle("greenMe 🌳")
        .navigationBarItems(leading: EditButton(), trailing: Button("Add") {
        self.showingAddChallenge.toggle()
        })
    }
    .sheet(isPresented: $showingAddChallenge) {
            AddView()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

class durationFetchRequest: ObservableObject{
    
    @Published var datas = [dataType]()
//    @Published var challengedata = [challenge]()
    
    init() {
        AF.request("https://green-me-backend.herokuapp.com/durations").responseData {(data) in
            let json = try! JSON(data: data.data!)
            
            for i in json{
                
//                let challenge = i.1["challenges"]["definition"].stringValue{
//                print(challenge)
//
//                self.challengedata.append(challenge(id: i.1["id"].intValue, definition: i.1["definition"].stringValue, difficultyId: i.1["difficulty_id"].intValue))
                
                self.datas.append(dataType(id: i.1["id"].intValue, length: i.1["length"].stringValue, points: i.1["points"].intValue, challenges: i.1["challenges"][0]["definition"].stringValue))
            }
        }
    }
    
}

struct challenge : Identifiable {
    var id: Int
    var definition: String
    var difficultyId: Int
}

struct dataType : Identifiable {
    
    var id: Int
    var length: String
    var points: Int
    var challenges: String
    
}

struct durationCard : View {
    var length = ""
    var challenges = ""
    
    var body : some View{
        HStack{
            Text(length).fontWeight(.heavy)
            EmojiView(for: length)
        }
    }
}

struct challengeCard : View {
    var definition = ""
    var body : some View{
        Text(definition)
    }
}

//struct SecondContentView: View {
//    
//     @ObservedObject var obs = durationFetchRequest()
//    
//    let durationArray = []
    
//    func getChallenges () {
//        ForEach(obs.datas, id: \.id) { i in
//            print(i.challenges)
//        }
//    }
//
    
//    var body: some View {
//
//         @ObservedObject var obs = durationFetchRequest()
//
//
//       NavigationView {
//           List {
//            ForEach(obs.datas.challenges, id: \.id) { challenge in
//           NavigationLink(destination:
            
//            {
//                challengeCard(definition: challenge.definition)
//                   }
//               }
//           }
//       }
//
//}
