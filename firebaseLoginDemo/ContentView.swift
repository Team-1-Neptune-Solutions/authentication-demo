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
                Button("SignOut", action:signOutButtonClicked )
                
                Text("Welcome! You have been signed in.")
            //MARK: -------------------------------------------------
                //Add OAuth here
//                print(authResult.additionalUserInfo.profile)
            }.padding()
        }
    }
    
    func signOutButtonClicked() {
        print("BOSS BB")
    }
    
//    func signOutButtonClicked() {
//        let auth = Auth.auth()
//
//        do {
//            try auth.signOut()
//        } catch let signoutError {
//            self.present(provider.createAlertController(title: "Error", message: signoutError.localizedDescription), animated: true, completion: nil)
//        }
//    }
    
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
                  
                  
                  print("Successful TEST HSC")
//                  let cred:OAuthCredential = authResult?.credential as! OAuthCredential
//                  let oAuthCredential = aut˚hResult?.additionalUserInfo?.profile as! OAuthCredential
//                                      print(oAuthCredential.accessToken!) // Prints token
//                          print(oAuthCredential.idToken ?? <#default value#>) // Prints nil
                  
                  signedIn = true
              // User is signed in.
//               IdP data available in authResult.additionalUserInfo.profile
              // OAuth access token can also be retrieved:
              // (authResult.credential as? OAuthCredential)?.accessToken
              // OAuth ID token can also be retrieved:
              // (authResult.credential as? OAuthCredential)?.idToken
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
