//
//  APIModel.swift
//  View_Practice01
//
//  Created by lkh on 11/12/23.
//

import Foundation

// MARK: - Welcome
struct Welcome: Codable {
    let lastBuildDate: String
    let total, start, display: Int
    let items: [Item]
}

// MARK: - Item
struct Item: Codable, Identifiable {
    let id = UUID()
    let title: String
    let originallink: String
    let link: String
    let description, pubDate: String
}

