//
//  RegisterView.swift
//  FirstTest
//
//  Created by Dylan Wong on 3/2/25.
//

import SwiftUI

struct RegisterView: View {
    @StateObject var viewModel = RegisterViewModel()
    
    var body: some View {
        VStack {
            HeaderView(title: "Register", subtitle: "create free account", angle: -15, backgroundColor: Color.orange)
            
            Form {
                TextField("Name", text: $viewModel.name)
                    .textFieldStyle(DefaultTextFieldStyle())
                    .autocorrectionDisabled()
                
                TextField("Email", text: $viewModel.email)
                    .textFieldStyle(DefaultTextFieldStyle())
                    .autocapitalization(.none)
                    .autocorrectionDisabled()
                
                SecureField("Password", text: $viewModel.password)
                    .textFieldStyle(DefaultTextFieldStyle())
                    .autocorrectionDisabled()
                
                TLButton(title: "Create account", backgroundColor: Color.green, action: {
                    viewModel.register()
                })
                .padding()
            }
            .offset(y: -50)
            
            Spacer()
        }
    }
}

#Preview {
    RegisterView()
}
