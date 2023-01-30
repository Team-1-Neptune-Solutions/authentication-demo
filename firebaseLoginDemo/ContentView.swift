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
    
//    provider.customParameters = [
//        "prompt":"select_account"
//    ]
    
    @State var signedIn:Bool = false
    @State var name:String? = "User"
    
    var body: some View {
        if(!signedIn){
            VStack {
                Button("Sign-In",
                       action:signInButtonClicked)
                
                Text("Login with Microsoft").padding()
            }
            .padding()
        }else{
            VStack{
                Text("Welcome \(name ?? "user")!")
                Button("Sign out",
                action: signOut
                )
            }
        }
        
    }
    
    func signInButtonClicked(){
        provider.customParameters = [
            "prompt":"login"
        ]
        provider.getCredentialWith(nil) { credential, error in
          if error != nil {
            // Handle error.
          }
          if let credential{
              Auth.auth().signIn(with: credential) { authResult, error in

                  if let error {
                // Handle error.
                  print("Login failed due to \(error)")
                  }
            
                  guard let authResult else{ return }
                 //Signed in
                  name = authResult.user.displayName
                  signedIn = true
            }
          }
        }
    }
    
    func signOut(){
        let firebaseAuth = Auth.auth()
        do {
          try firebaseAuth.signOut()
                    signedIn=false
        } catch let signOutError as NSError {
          print("Error signing out: %@", signOutError)
        }
    }
}

//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}
