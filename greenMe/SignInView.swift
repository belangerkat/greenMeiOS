//
//  SignInView.swift
//  greenMe
//
//  Created by Katie Belanger on 5/28/20.
//  Copyright © 2020 Katie Belanger. All rights reserved.
//

import SwiftUI

struct SignInView: View {
        @Environment(\.presentationMode) var presentationMode
    

        @State private var email = ""
        @State private var password = ""
        @State var showingSignIn = false
        

        var body: some View {
            NavigationView {
                Form {
                    Section {
                        TextField("e-mail", text: $email)
                        TextField("password", text: $password)


                       
                    }

                    Button("Sign In!") {
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

                }.navigationBarTitle("Welcome back 🌳")
            }
        }
}

struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView()
    }
}
