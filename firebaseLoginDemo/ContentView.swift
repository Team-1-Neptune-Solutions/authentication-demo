//
//  ContentView.swift
//  firebaseLoginDemo
//
//  Created by AKSHAY MAHAJAN on 2023-01-20.
//

import SwiftUI
import Firebase
import FirebaseAuth

struct ContentView: View {
    var provider = OAuthProvider(providerID: "microsoft.com")
    @State var signedIn:Bool = false
    var body: some View {
        if(!signedIn){
            VStack {
                Button("Sign-In",
                       action:signButtonClicked)
                
                Text("Login with Microsoft").padding()
            }
            .padding()
        }else{
            VStack{
                Text("Welcome! You have been signed in.")
            }
        }
        
    }
    
    func signButtonClicked(){
        provider.getCredentialWith(nil) { credential, error in
          if error != nil {
            // Handle error.
          }
          if credential != nil {
              Auth.auth().signIn(with: credential!) { authResult, error in
              if error != nil {
                // Handle error.
              }
            print("Sign in successful!")
                  signedIn = true
              // User is signed in.
              // IdP data available in authResult.additionalUserInfo.profile.
              // OAuth access token can also be retrieved:
              // (authResult.credential as? OAuthCredential)?.accessToken
              // OAuth ID token can also be retrieved:
              // (authResult.credential as? OAuthCredential)?.idToken
            }
          }
        }

    }
}

//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}
