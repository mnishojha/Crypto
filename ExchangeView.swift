//
//  ExchangeView.swift
//  Crypto
//
//  Created by manish ojha on 15/08/25.
//
import SwiftUI

struct ExchangeScreenView: View {
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            
            VStack(spacing: 20) {
                // Top Bar
                HStack {
                    Image(systemName: "line.horizontal.3")
                        .font(.title2)
                        .foregroundColor(.white)
                    
                    Spacer()
                    
                    Image(systemName: "bell")
                        .font(.title2)
                        .foregroundColor(.white)
                }
                .padding(.horizontal)
                
                // Balance Card
                VStack(spacing: 10) {
                    Text("INR")
                        .font(.caption)
                        .foregroundColor(.white)
                        .padding(.horizontal, 12)
                        .padding(.vertical, 6)
                        .background(Color.blue.opacity(0.8))
                        .cornerRadius(10)
                    
                    Text("1,57,342.05")
                        .font(.system(size: 32, weight: .bold))
                        .foregroundColor(.white)
                    
                    HStack(spacing: 5) {
                        Text("₹ 1,342")
                            .foregroundColor(.white.opacity(0.7))
                        Text("+4.6%")
                            .foregroundColor(.green)
                    }
                }
                .frame(maxWidth: .infinity)
                .padding()
                .background(
                    LinearGradient(
                        colors: [Color.purple, Color.blue],
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    )
                )
                .cornerRadius(20)
                .shadow(radius: 5)
                .padding(.horizontal)
                
                // Action Buttons
                HStack(spacing: 40) {
                    CircleButton(icon: "arrow.up")
                    CircleButton(icon: "plus")
                    CircleButton(icon: "arrow.down")
                }
                
                // Transactions header
                HStack {
                    Text("Transactions")
                        .foregroundColor(.white.opacity(0.7))
                    Spacer()
                    Text("Last 4 days")
                        .foregroundColor(.white.opacity(0.7))
                }
                .padding(.horizontal)
                
                // Transactions list
                VStack(spacing: 15) {
                    TransactionItem(title: "Recieve", date: "20 March", coin: "BTC", amount: "+0.002126", icon: "arrow.down")
                    TransactionItem(title: "Sent", date: "19 March", coin: "ETH", amount: "+0.003126", icon: "arrow.up")
                    TransactionItem(title: "Send", date: "18 March", coin: "LTC", amount: "+0.002126", icon: "arrow.up")
                }
                
                Spacer()
                
                // Bottom Nav
                HStack {
                    BottomNavItem(icon: "chart.bar", title: "Analytics")
                    BottomNavItem(icon: "arrow.2.squarepath", title: "Exchange", isActive: true)
                    BottomNavItem(icon: "doc.text", title: "Record")
                    BottomNavItem(icon: "wallet.pass", title: "Wallet")
                }
                .padding()
                .background(
                    Color.black.opacity(0.9)
                        .cornerRadius(20)
                        .shadow(radius: 5)
                )
                .padding(.horizontal)
            }
            .padding(.top)
        }
    }
}

// MARK: - Components

private struct CircleButton: View {
    let icon: String
    var body: some View {
        Button(action: {}) {
            Image(systemName: icon)
                .foregroundColor(.white)
                .font(.title3)
                .frame(width: 50, height: 50)
                .background(Color.black.opacity(0.7))
                .clipShape(Circle())
        }
    }
}

private struct TransactionItem: View {
    let title: String
    let date: String
    let coin: String
    let amount: String
    let icon: String
    
    var body: some View {
        HStack {
            Image(systemName: icon)
                .foregroundColor(.white)
                .frame(width: 40, height: 40)
                .background(Color.black.opacity(0.7))
                .clipShape(RoundedRectangle(cornerRadius: 12))
            
            VStack(alignment: .leading) {
                Text(title)
                    .foregroundColor(.white)
                Text(date)
                    .font(.caption)
                    .foregroundColor(.white.opacity(0.6))
            }
            Spacer()
            VStack(alignment: .trailing) {
                Text(coin)
                    .foregroundColor(.white)
                Text(amount)
                    .foregroundColor(.white.opacity(0.6))
            }
        }
        .padding()
        .background(Color.black.opacity(0.6))
        .cornerRadius(15)
        .padding(.horizontal)
    }
}

private struct BottomNavItem: View {
    let icon: String
    let title: String
    var isActive: Bool = false
    
    var body: some View {
        VStack(spacing: 4) {
            Image(systemName: icon)
                .foregroundColor(isActive ? .blue : .white)
            Text(title)
                .font(.caption)
                .foregroundColor(isActive ? .blue : .white)
        }
        .frame(maxWidth: .infinity)
    }
}

// MARK: - Preview
#Preview {
    ExchangeScreenView()
}
