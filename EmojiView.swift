//
//  EmojiView.swift
//  greenMe
//
//  Created by Katie Belanger on 5/27/20.
//  Copyright © 2020 Katie Belanger. All rights reserved.
//

import SwiftUI

struct EmojiView: View {
    var length: String
    
    var body: some View {
        switch length {
        case "One Day":
            return Text("👌")
        case "One Week":
            return Text("👍")
        case "One Month":
            return Text("👏")
        case "One Year":
            return Text("🙌")
        default:
            return Text("🤘")
        }
    }
    
    init(for length: String) {
        self.length = length
    }
}

struct EmojiView_Previews: PreviewProvider {
    static var previews: some View {
        EmojiView(for: "One Week")
    }
}

