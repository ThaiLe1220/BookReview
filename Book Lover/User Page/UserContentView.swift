//
//  UserContentView.swift
//  Book Lover
//
//  Created by Lê Ngọc Trâm on 10/09/2023.
//

import SwiftUI

struct UserContentView: View {
    var body: some View {
        NavigationView {
            SignInView()
        }
    }
}


struct SignUpView: View {
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var confirmPassword: String = ""

    var body: some View {
        VStack {
            TextField("Email", text: $email)
                .padding()
                .textFieldStyle(RoundedBorderTextFieldStyle())

            SecureField("Password", text: $password)
                .padding()
                .textFieldStyle(RoundedBorderTextFieldStyle())

            SecureField("Confirm Password", text: $confirmPassword)
                .padding()
                .textFieldStyle(RoundedBorderTextFieldStyle())

            Button("Sign Up") {
                // Handle sign up
            }
            .padding()
        }
    }
}


struct SignInView: View {
    @State private var email: String = ""
    @State private var password: String = ""

    var body: some View {
        VStack {
            TextField("Email", text: $email)
                .padding()
                .textFieldStyle(RoundedBorderTextFieldStyle())

            SecureField("Password", text: $password)
                .padding()
                .textFieldStyle(RoundedBorderTextFieldStyle())

            Button("Sign In") {
                // Handle sign in
            }
            .padding()

            NavigationLink(destination: SignUpView()) {
                Text("Don't have an account? Sign Up")
            }
        }
    }
}



struct ProfileView: View {
    var body: some View {
        Button("Sign Out") {
            // Handle sign out
        }
        .padding()
    }
}



struct UserContentView_Previews: PreviewProvider {
    static var previews: some View {
        UserContentView()
    }
}
