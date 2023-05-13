//
//  FacialReconView.swift
//  Zardon Vision
//
//  Created by Alaap Joshi on 5/13/23.
//

import SwiftUI
import AVFoundation


struct FacialReconView: View {
    let synthesizer = AVSpeechSynthesizer()
    func speak(_ message: String) {
        let utterance = AVSpeechUtterance(string: message)
        synthesizer.speak(utterance)
    }
    var body: some View {
        Text("Sorry, we were unable to implement this into a camera! If you check out the Zardon.mlmodel we can accurately classify images with a 71% accuracy!")
            .padding(10)
            .onAppear {
                    speak("Facial Recognition")
                        }
        
    }
}

struct FacialReconView_Previews: PreviewProvider {
    static var previews: some View {
        FacialReconView()
    }
}
