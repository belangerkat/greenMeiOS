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
    @State var showingSignUp = false
    
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
            NavigationLink(destination: SecondContentView()) {
                Text("View All Challenges 🌎").fontWeight(.heavy)
            }
                            
        }.navigationBarTitle("greenMe 🌳")
            .navigationBarItems(leading: Button("Sign Up") {self.showingSignUp.toggle()}, trailing: Button("Add Challenge") {
        self.showingAddChallenge.toggle()
        }.sheet(isPresented: $showingAddChallenge) {
            AddView()
        })
    }
    
    .sheet(isPresented: $showingSignUp) {
        SignUpView()
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
    
    init() {
        AF.request("https://green-me-backend.herokuapp.com/durations").responseData {(data) in
            let json = try! JSON(data: data.data!)
            
            for i in json{
                
                self.datas.append(dataType(id: i.1["id"].intValue, length: i.1["length"].stringValue, points: i.1["points"].intValue, challenges: i.1["challenges"][0]["definition"].stringValue))
            }
        }
    }
    
}

class challengeFetchRequest: ObservableObject{
    
    @Published var datas = [challenge]()
    
    init() {
        AF.request("https://green-me-backend.herokuapp.com/challenges").responseData {(data) in
            let json = try! JSON(data: data.data!)
            
            for i in json{
                
                self.datas.append(challenge(id: i.1["id"].intValue, definition: i.1["definition"].stringValue, difficulty: i.1["difficulty"]["rank"].stringValue, duration: i.1["duration"]["length"].stringValue))
            }
        }
    }
    
}

struct challenge : Identifiable {
    var id: Int
    var definition: String
    var difficulty: String
    var duration: String
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
    var difficulty = ""
    var duration = ""
    
    var body : some View{
        HStack {
            Text(definition)
            .padding([.horizontal, .bottom])
            Text(duration)
            .font(.headline)
            .lineLimit(10)
            .padding([.horizontal, .bottom])
        }
    }
}

struct SecondContentView: View {
    
    @ObservedObject var obs = challengeFetchRequest()
    
     
    
    var body: some View {
        NavigationView {
        
            ScrollView(.vertical) {
                VStack(alignment: .leading) {
                Text("All greenMe 🌳 Challenges").fontWeight(.heavy)
                ForEach(obs.datas, id: \.id) { i in
            NavigationLink(destination:
            Text(i.difficulty)) {
                    challengeCard(definition: i.definition, duration: i.duration)
                    }
                }
                                
                }
                .frame(width: 400, height: 400)
                
            }.padding()
        }.background(LinearGradient(gradient: Gradient(colors: [Color("Start"), Color("Middle"), Color("End")]), startPoint: .top, endPoint: .bottom))
        .offset(y: 120)
        .edgesIgnoringSafeArea(.all)
       }

}
