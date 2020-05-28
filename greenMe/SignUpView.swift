//
//  SignUpView.swift
//  greenMe
//
//  Created by Katie Belanger on 5/28/20.
//  Copyright © 2020 Katie Belanger. All rights reserved.
//

import SwiftUI

struct SignUpView: View {
     @Environment(\.presentationMode) var presentationMode
    

        @State private var name = ""
        @State private var email = ""
        @State private var password = ""
        @State var showingSignIn = false
        

        var body: some View {
            NavigationView {
                Form {
                    Section {
                        TextField("name", text: $name)
                        TextField("e-mail", text: $email)
                        TextField("password", text: $password)


                       
                    }

                    Button("Sign Up") {
    //                    let newUser = {
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
                    Button("Sign In") {
                        self.showingSignIn.toggle()
                        
                    }.sheet(isPresented: $showingSignIn) {
                        SignInView()
                    }

                }.navigationBarTitle("Join greenMe 🌳")
            }
        }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}
