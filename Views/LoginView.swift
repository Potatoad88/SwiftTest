//
//  LoginView.swift
//  FirstTest
//
//  Created by Dylan Wong on 3/2/25.
//

import SwiftUI

struct LoginView: View {
    @StateObject var viewModel = LoginViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                HeaderView(title: "To Do List", subtitle: "Get started", angle: 15, backgroundColor: Color.pink)
                
                Form {
                    if !viewModel.errorMessage.isEmpty {
                        Text(viewModel.errorMessage)
                            .foregroundColor(Color.red)
                    }
                    
                    TextField("Enter your email", text: $viewModel.email)
                        .textFieldStyle(DefaultTextFieldStyle())
                        .autocapitalization(.none)
                        .autocorrectionDisabled()
                    
                    SecureField("Enter your passsword", text: $viewModel.password)
                        .textFieldStyle(DefaultTextFieldStyle())
                        .autocorrectionDisabled()
                    
                    TLButton(title: "Log in", backgroundColor: Color.blue, action: {
                        viewModel.login()
                    })
                    .padding()
                }
                .offset(y: -50)
                
                VStack {
                    Text("Don't have an account?")
                    NavigationLink("Create an acccount", destination: RegisterView())
                }
                .padding(.bottom, 50)
                
                Spacer()
            }
        }
    }
}

#Preview {
    LoginView()
}
