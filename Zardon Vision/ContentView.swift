//
//  ContentView.swift
//  Zardon Vision
//
//  Created by Alaap Joshi on 5/13/23.
//

import SwiftUI
import AVFoundation

let viewPageActivityType = "com.app.facetime"

let viewPageActivity: NSUserActivity = {
    let userActivity = NSUserActivity(activityType: viewPageActivityType)
    userActivity.title = "View facetime"
    userActivity.isEligibleForSearch = true
    userActivity.isEligibleForPrediction = true
    return userActivity
}()

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        userActivity = viewPageActivity
    }
}
struct ContentView: View {
    let synthesizer = AVSpeechSynthesizer()
    //let message = "Welcome to VisionHelp, this is the homepage, you can use Siri to navigate the app. For instance, say, Hey Siri, navigate to Object recognition"
    let message = ""

    func speak(_ message: String) {
           let utterance = AVSpeechUtterance(string: message)
           synthesizer.speak(utterance)
       }
    

    var body: some View {
        ZStack {
        TabView {
            HomeView()
                .tabItem {
                    Image(systemName: "house")
                    Text("Home")
                }

            DescribeView()
                .tabItem {
                    Image(systemName: "mappin.and.ellipse")
                    Text("Object Rec")
                }
            FacetimeView()
                .tabItem {
                    Image(systemName: "video.fill")
                    Text("Facetime")
                }
            TextView()
                .tabItem {
                    Image(systemName: "text.magnifyingglass")
                    Text("OCR")
                }

        }
        .accentColor(.red)
        }

    }
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            

            ContentView()
                .previewDevice(PreviewDevice(rawValue: "iPhone 11"))
                .previewDisplayName("iPhone 11")
        }
    }
}
