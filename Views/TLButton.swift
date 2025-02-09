//
//  TLButton.swift
//  FirstTest
//
//  Created by Dylan Wong on 3/2/25.
//

import SwiftUI

struct TLButton: View {
    let title: String
    let backgroundColor: Color
    let action: () -> Void
    
    var body: some View {
        Button {
            action()
        } label: {
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(backgroundColor)
                
                Text(title)
                    .foregroundColor(Color.white)
                    .bold()
            }
        }
    }
}

#Preview {
    TLButton(title: "Value", backgroundColor: Color.pink, action: {})
}
