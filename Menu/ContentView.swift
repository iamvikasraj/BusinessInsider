//
//  ContentView.swift
//  Menu
//
//  Created by Vikas Yadav on 04/02/24.
//

import SwiftUI

// MARK: - News Data Model
struct NewsArticle: Identifiable {
    let id = UUID()
    let title: String
    let summary: [String]
    let author: String
    let timeAgo: String
    let imageName: String
}

// MARK: - News Detail View
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

struct ContentView: View {
    @State private var selectedArticle: NewsArticle?
    @State private var showingSheet = false
    
    // Sample news data
    private let newsArticles: [NewsArticle] = [
        NewsArticle(
            title: "Nykaa to face competitive heat but its omni-channel experience maybe the game changer",
            summary: [
                "Nykaa was able to increase its revenue by ₹1,300 crore in the fiscal year 2022.",
                "ICICI Securities anticipates much higher competition for Nykaa in the time to come.",
                "The brokerage recommends investors to hold on to the stock."
            ],
            author: "Katie Balevic",
            timeAgo: "12 hrs ago",
            imageName: "logo"
        ),
        NewsArticle(
            title: "India's GDP growth exceeds expectations in Q3 2024",
            summary: [
                "India's economy grew at 7.2% in the third quarter of 2024.",
                "Manufacturing sector showed strong recovery with 8.5% growth.",
                "Services sector continued to drive economic expansion."
            ],
            author: "Rajesh Kumar",
            timeAgo: "2 hrs ago",
            imageName: "logo"
        ),
        NewsArticle(
            title: "Tech giants announce major investments in Indian startups",
            summary: [
                "Google announces $1 billion investment in Indian AI startups.",
                "Microsoft partners with local universities for skill development.",
                "Amazon expands its cloud infrastructure across tier-2 cities."
            ],
            author: "Priya Sharma",
            timeAgo: "4 hrs ago",
            imageName: "logo"
        ),
        NewsArticle(
            title: "Stock markets reach new all-time highs amid positive sentiment",
            summary: [
                "Nifty 50 crosses 24,000 mark for the first time in history.",
                "Foreign institutional investors turn net buyers after months.",
                "Retail participation in equity markets continues to grow."
            ],
            author: "Amit Patel",
            timeAgo: "6 hrs ago",
            imageName: "logo"
        ),
        NewsArticle(
            title: "Renewable energy sector sees unprecedented growth",
            summary: [
                "Solar power capacity additions reach record high this quarter.",
                "Wind energy projects get green clearance faster than ever.",
                "Government announces new incentives for green hydrogen production."
            ],
            author: "Sunita Reddy",
            timeAgo: "8 hrs ago",
            imageName: "logo"
        )
    ]
    
    var body: some View {
        VStack(spacing: 0) {
            // Header Section
            VStack(alignment: .leading, spacing: 0) {
                HStack {
                    Image("Menu")
                        .resizable()
                        .frame(width: 24, height: 24)

                    Image("logo")
                        .resizable()
                        .frame(width: 167, height: 24)
                    
                    Spacer()
                    
                    Image("Search")
                    Image("User")
                }
                .padding(16)
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 20) {
                        Image("Menu")
                            .resizable()
                            .frame(width: 24, height: 24)
                        
                        Text("BUSINESS")
                        
                        Image("Menu")
                            .resizable()
                            .frame(width: 24, height: 24)
                        
                        Text("TECH")
                        
                        Image("Menu")
                            .resizable()
                            .frame(width: 24, height: 24)
                        
                        Text("MARKETS")
                        
                        Image("Menu")
                            .resizable()
                            .frame(width: 24, height: 24)
                        
                        Text("REVIEWS")
                    }
                    .font(.system(size: 12))
                    .fontWeight(.semibold)
                    .padding(.horizontal, 16)
                }
            }
            .background(.white)
            
            // News Content Section
            ScrollView(showsIndicators: false) {
                VStack(alignment: .leading, spacing: 24) {
                    Text("TOP STORIES")
                        .font(.system(size: 20))
                        .fontWeight(.bold)
                        .foregroundColor(.black)
                        .padding(.horizontal, 16)
                    
                    ForEach(newsArticles) { article in
                        NewsCardView(article: article) {
                            selectedArticle = article
                            showingSheet = true
                        }
                        .padding(.horizontal, 16)
                    }
                }
                .padding(.vertical, 16)
            }
        }
        .background(.white)
        .sheet(isPresented: $showingSheet) {
            if let article = selectedArticle {
                NewsDetailView(article: article)
            }
        }
    }
}

// MARK: - News Card View
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

#Preview {
    ContentView()
}
