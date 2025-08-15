//
//  Models.swift
//  Crypto
//
//  Created by manish ojha on 14/08/25.
//
import SwiftUI

struct Txn: Identifiable {
    let id = UUID()
    let direction: Direction
    let title: String
    let date: String
    let token: String
    let amount: String
    
    enum Direction { case send, receive }
}

enum Tab: String, CaseIterable, Identifiable {
    case analytics, exchange, record, wallet
    var id: String { rawValue }
    
    var title: String {
        switch self {
        case .analytics: return "Analytics"
        case .exchange:  return "Exchange"
        case .record:    return "Record"
        case .wallet:    return "Wallet"
        }
    }
    var icon: String {
        switch self {
        case .analytics: return "chart.line.uptrend.xyaxis"
        case .exchange:  return "arrow.left.arrow.right"
        case .record:    return "doc.text"
        case .wallet:    return "wallet.pass"
        }
    }
}
