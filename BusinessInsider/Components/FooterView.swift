//
//  FooterView.swift
//  BusinessInsider
//
//  Created by Vikas Yadav on 04/02/24.
//

import SwiftUI

struct FooterView: View {
    var body: some View {
        VStack(spacing: 8) {
            Divider()
            
            HStack {
                Spacer()
                
                Text("© 2024 Business Insider")
                    .font(.system(size: 12))
                    .foregroundColor(.gray)
                
                Spacer()
            }
            .padding(.vertical, 12)
        }
        .background(.white)
    }
}

#Preview {
    FooterView()
}

