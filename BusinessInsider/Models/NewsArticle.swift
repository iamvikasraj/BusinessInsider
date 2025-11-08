//
//  NewsArticle.swift
//  BusinessInsider
//
//  Created by Vikas Yadav on 04/02/24.
//

import Foundation

struct NewsArticle: Identifiable {
    let id = UUID()
    let title: String
    let summary: [String]
    let author: String
    let timeAgo: String
    let imageName: String
}

