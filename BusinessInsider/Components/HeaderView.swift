//
//  HeaderView.swift
//  BusinessInsider
//
//  Created by Vikas Yadav on 04/02/24.
//

import SwiftUI

struct HeaderView: View {
    var body: some View {
        VStack(spacing: 0) {
            // Top Bar
            HStack {
                Button(action: {}) {
                    Image("Menu")
                        .resizable()
                        .frame(width: 24, height: 24)
                }

                Image("logo")
                    .resizable()
                    .frame(width: 167, height: 24)
                
                Spacer()
                
                Button(action: {}) {
                    Image("Search")
                        .resizable()
                        .frame(width: 24, height: 24)
                }
                
                Button(action: {}) {
                    Image("User")
                        .resizable()
                        .frame(width: 24, height: 24)
                }
            }
            .padding(16)
            
            // Navigation Tabs
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 16) {
                    Button(action: {}) {
                        HStack(spacing: 6) {
                            Image("Menu")
                                .resizable()
                                .frame(width: 16, height: 16)
                            Text("BUSINESS")
                                .font(.system(size: 12))
                                .fontWeight(.semibold)
                                .foregroundColor(.black)
                        }
                    }
                    
                    Text("•")
                        .font(.system(size: 12))
                        .foregroundColor(.gray)
                    
                    Button(action: {}) {
                        HStack(spacing: 6) {
                            Image("Menu")
                                .resizable()
                                .frame(width: 16, height: 16)
                            Text("TECH")
                                .font(.system(size: 12))
                                .fontWeight(.semibold)
                                .foregroundColor(.black)
                        }
                    }
                    
                    Text("•")
                        .font(.system(size: 12))
                        .foregroundColor(.gray)
                    
                    Button(action: {}) {
                        HStack(spacing: 6) {
                            Image("Menu")
                                .resizable()
                                .frame(width: 16, height: 16)
                            Text("MARKETS")
                                .font(.system(size: 12))
                                .fontWeight(.semibold)
                                .foregroundColor(.black)
                        }
                    }
                    
                    Text("•")
                        .font(.system(size: 12))
                        .foregroundColor(.gray)
                    
                    Button(action: {}) {
                        HStack(spacing: 6) {
                            Image("Menu")
                                .resizable()
                                .frame(width: 16, height: 16)
                            Text("REVIEWS")
                                .font(.system(size: 12))
                                .fontWeight(.semibold)
                                .foregroundColor(.black)
                        }
                    }
                }
                .padding(16)
            }
        }
        .background(.white)
    }
}

#Preview {
    HeaderView()
}

