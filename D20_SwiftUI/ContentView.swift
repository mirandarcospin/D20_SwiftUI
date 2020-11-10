//
//  ContentView.swift
//  D20_SwiftUI
//
//  Created by Miranda Ramirez Cospin on 11/10/20.
//

import SwiftUI
import AVFoundation

struct ContentView: View {
    
    //var diceImageView : Image
    
    var body: some View {
        VStack {
            Image("d1")
            Text("Roll")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
