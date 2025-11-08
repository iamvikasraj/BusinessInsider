//
//  ContentView.swift
//  BusinessInsider
//
//  Created by Vikas Yadav on 04/02/24.
//

import SwiftUI

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

#Preview {
    ContentView()
}

