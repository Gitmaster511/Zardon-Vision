//
//  NewView.swift
//  Zardon Vision
//
//  Created by Alaap Joshi on 5/13/23.
//

import SwiftUI
import AVFoundation
import AVFAudio

struct Contact2: Identifiable {
        var id = UUID()
        var name: String
        var image: String
        var phoneNumber: String
        var availability: String
        var timezone: String
        var Bio: String
        var Hobbies: String
        var SocialMedihandles: String
}

let contacts2 = [
    Contact(name: "Alex Kim", image: "man4", phoneNumber: "908-952-5450", availability: "yes", timezone: "Mountain", Bio: "I'm a big fan of hiking and camping.", Hobbies: "Playing basketball and listening to podcasts", SocialMedihandles: "@AlexKim"),
    Contact(name: "Katie Lee", image: "women2", phoneNumber: "908-952-5450", availability: "yes", timezone: "Eastern", Bio: "I love spending time with my family and friends.", Hobbies: "Cooking and watching movies", SocialMedihandles: "@KatieLee"),
    Contact(name: "David Wang", image: "man5", phoneNumber: "908-952-5450", availability: "yes", timezone: "Pacific", Bio: "I'm passionate about technology and innovation.", Hobbies: "Playing video games and building robots", SocialMedihandles: "@DavidWang")
]

struct NewView: View {
    var body: some View {
        NavigationView {
            VStack {
                NavigationView {
                    List(contacts2) { contact in
                        NavigationLink(destination: ContactDetailView(contact: contact)) {
                            ContactRowView(contact: contact)
                            
                        }
                    }
                    .navigationTitle("More")
                    
                }

            }
        }
    }
}

struct ContactRowView2: View {
    let speechSynthesizer = AVSpeechSynthesizer()

    var contact: Contact
    
    var body: some View {
        VStack {
            HStack {
                Image(contact.image)
                    .resizable()
                    .frame(width: 50, height: 50)
                    .clipShape(Circle())
                Text(contact.name)
                Spacer()
                if contact.availability == "yes" {
                    Button(action: {
                        facetime(phoneNumber: contact.phoneNumber)
                    }) {
                        Image(systemName: "video.fill")
                            .foregroundColor(.blue)
                    }
                } else {
                    Text("Not available")
                        .foregroundColor(.red)
                }
            }
        }

            }

}

struct ContactDetailView2: View {
    var contact: Contact
    var body: some View {
        VStack {
            Image(contact.image)
                .resizable()
                .frame(width: 150, height: 150)
                .clipShape(Circle())
            Text(contact.name)
                .font(.largeTitle)
                .padding(10)
                .font(.title)
                .multilineTextAlignment(.center)
                .foregroundColor(.black)

        
            
            
            Text(contact.phoneNumber)
                .font(.title2)
                .padding(10)
                .foregroundColor(.black)


            if contact.availability == "yes" {
                Text("Available")
                    .foregroundColor(.green)
                    .font(.title)
            } else {
                Text("Not Available")
                    .foregroundColor(.red)
                    .font(.title)
                    .foregroundColor(.black)


            }

            Text("Timezone: \(contact.timezone)")
                .font(.title2)
                .padding(10)
                .foregroundColor(.black)

            Text("Bio: \(contact.Bio)")
                .font(.title2)
                .padding(10)
                .foregroundColor(.black)


            Text("Hobbies: \(contact.Hobbies)")
                .font(.title2)
                .padding(10)
                .foregroundColor(.black)


            Text("Social Media Handles: \(contact.SocialMedihandles)")
                .font(.title2)
                .padding(10)
                .foregroundColor(.blue)
            
            Button(action: {
                            facetime(phoneNumber: contact.phoneNumber)
                        }) {
                            Text("Call")
                                .foregroundColor(.white)
                                .font(.title2)
                                .padding(.horizontal)
                                .padding(.vertical, 10)
                                .background(Color.blue)
                                .cornerRadius(10)
                        }
                        .padding(.bottom, 20)

            Spacer()
        }
        .background(Color.white) // set the background color to white
        //        .navigationTitle("Contacts")
        .navigationBarTitle("", displayMode: .inline)

    }
}
    
    struct NewView_Previews: PreviewProvider {
        static var previews: some View {
            FacetimeView()
        }
    }
    private func facetime(phoneNumber:String) {
        if let facetimeURL:NSURL = NSURL(string: "facetime://\(phoneNumber)") {
            let application:UIApplication = UIApplication.shared
            if (application.canOpenURL(facetimeURL as URL)) {
                application.open(facetimeURL as URL);
            }
        }
    }

