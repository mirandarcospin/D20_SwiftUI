//
//  ContentView.swift
//  D20_SwiftUI
//
//  Created by Miranda Ramirez Cospin on 11/10/20.
//

import SwiftUI
import AVFoundation

struct ContentView: View {
    
    //Image and Text
    @State var diceImageView = "d1"
    @State var criticalLabel = "Roll Dice!!!"
    //Sounds
    @State var rollDiceSound : AVAudioPlayer!
    @State var failSound: AVAudioPlayer!
    @State var winSound: AVAudioPlayer!
    @State var launchSound : AVAudioPlayer!
    //Rolling the dice total
    @State var totalRolled = 0
    
    var body: some View {
        //Dice image as a button
        Button(action: {
            
            if(totalRolled == 0) {
                launchSound.play() //Launching sound at the beginning
            }
            //Random number for the dice and image
            let rolledNumber = Int.random(in: 1...20)
            self.diceImageView = "d\(rolledNumber)"
            
            self.totalRolled += 1
            
            rollDiceSound.play()
            //When the number is 1 or 20 or something else
            let imageName = "d\(rolledNumber)"
            if(imageName == "d1"){
                criticalLabel = "TRY AGAIN!!!"
                failSound.play()
            } else if(imageName == "d20") {
                criticalLabel = "CONGRATS!!!"
                winSound.play()
            } else {
                criticalLabel = ""
                rollDiceSound.play()
            }
            
        }) {
            VStack {
                Image(diceImageView) //Dice image
                Text(criticalLabel) //Text (depending if is 1 or 20 or something else)
                    .font(.title)
                    .fontWeight(.medium)
                    .foregroundColor(Color.black)
                    .multilineTextAlignment(.center)
            }
            .frame(width: .infinity, height: 800) //Button size
            .padding()
            .onAppear { //For the sounds to appear according to the dice number
                if let launchPath = Bundle.main.path(forResource: "torpedo", ofType: "mp3") {
                    do {
                        launchSound = try! AVAudioPlayer(contentsOf: URL(fileURLWithPath: launchPath))
                    }
                }
                if let rollPath = Bundle.main.path(forResource: "rolldice", ofType: "mp3") {
                    do {
                        rollDiceSound = try! AVAudioPlayer(contentsOf: URL(fileURLWithPath: rollPath))
                    }
                }
                if let winPath = Bundle.main.path(forResource: "zfanfare", ofType: "mp3") {
                    do {
                        winSound = try! AVAudioPlayer(contentsOf: URL(fileURLWithPath: winPath))
                    }
                }
                if let failPath = Bundle.main.path(forResource: "failwah", ofType: "mp3") {
                    do {
                        failSound = try! AVAudioPlayer(contentsOf: URL(fileURLWithPath: failPath))
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
