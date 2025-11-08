//
//  NewsCardView.swift
//  BusinessInsider
//
//  Created by Vikas Yadav on 04/02/24.
//

import SwiftUI

struct NewsCardView: View {
    let article: NewsArticle
    let onTap: () -> Void
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            // Image
            Image(article.imageName)
                .resizable()
                .aspectRatio(16/9, contentMode: .fit)
                .cornerRadius(8)
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(Color.gray.opacity(0.3), lineWidth: 0.5)
                )
            
            // Title
            Text(article.title)
                .font(.system(size: 20))
                .fontWeight(.bold)
                .foregroundColor(.primary)
                .multilineTextAlignment(.leading)
            
            // Summary Points
            VStack(alignment: .leading, spacing: 8) {
                ForEach(article.summary.prefix(2), id: \.self) { point in
                    Text(point)
                        .font(.system(size: 14))
                        .fontWeight(.semibold)
                        .foregroundColor(.gray)
                        .multilineTextAlignment(.leading)
                }
            }
            
            // Author and Time
            HStack {
                Text(article.author)
                    .font(.system(size: 12))
                    .fontWeight(.semibold)
                    .foregroundColor(.blue)
                
                Text(article.timeAgo)
                    .font(.system(size: 12))
                    .fontWeight(.regular)
                    .foregroundColor(.gray)
                
                Spacer()
                
                Image("Menu")
                    .resizable()
                    .frame(width: 16, height: 16)
            }
            
            // Divider
            Rectangle()
                .fill(Color.gray.opacity(0.3))
                .frame(height: 1)
        }
        .contentShape(Rectangle())
        .onTapGesture {
            onTap()
        }
    }
}

