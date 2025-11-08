//
//  NewsDetailView.swift
//  BusinessInsider
//
//  Created by Vikas Yadav on 04/02/24.
//

import SwiftUI

struct NewsDetailView: View {
    let article: NewsArticle
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    // Header Image
                    Image(article.imageName)
                        .resizable()
                        .aspectRatio(16/9, contentMode: .fit)
                        .cornerRadius(12)
                    
                    // Title
                    Text(article.title)
                        .font(.title2)
                        .fontWeight(.bold)
                        .foregroundColor(.primary)
                    
                    // Summary Points
                    VStack(alignment: .leading, spacing: 12) {
                        ForEach(article.summary, id: \.self) { point in
                            HStack(alignment: .top, spacing: 8) {
                                Circle()
                                    .fill(Color.blue)
                                    .frame(width: 6, height: 6)
                                    .padding(.top, 6)
                                
                                Text(point)
                                    .font(.body)
                                    .foregroundColor(.secondary)
                                    .multilineTextAlignment(.leading)
                            }
                        }
                    }
                    
                    // Author and Time
                    HStack {
                        Text(article.author)
                            .font(.caption)
                            .fontWeight(.semibold)
                            .foregroundColor(.blue)
                        
                        Text(article.timeAgo)
                            .font(.caption)
                            .foregroundColor(.gray)
                        
                        Spacer()
                    }
                    .padding(.top, 20)
                    
                    Spacer(minLength: 50)
                }
                .padding()
            }
            .navigationTitle("Article")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Done") {
                        dismiss()
                    }
                }
            }
        }
    }
}

