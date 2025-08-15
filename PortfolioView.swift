//
//  PortfolioView.swift
//  Crypto
//
//  Created by manish ojha on 14/08/25.
//
import SwiftUI

struct PortfolioDashboardView: View {
    @State private var selectedTimeframe = "6m"
    let timeframes = ["1h", "8h", "1d", "1w", "1m", "6m", "1y"]
    
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                
                // Header
                VStack(alignment: .leading, spacing: 10) {
                    HStack {
                        Button(action: {}) {
                            Image(systemName: "line.3.horizontal")
                                .foregroundColor(.white)
                        }
                        Spacer()
                        Button(action: {}) {
                            Image(systemName: "bell")
                                .foregroundColor(.white)
                        }
                    }
                    
                    Text("Portfolio Value")
                        .foregroundColor(.white.opacity(0.7))
                        .font(.callout)
                    
                    HStack {
                        Text("₹ 1,57,342.05")
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                        Spacer()
                        Toggle("", isOn: .constant(true))
                            .labelsHidden()
                            .toggleStyle(SwitchToggleStyle(tint: .white))
                            .frame(width: 50)
                    }
                    
                    // Time Selector
                    HStack(spacing: 15) {
                        ForEach(timeframes, id: \.self) { tf in
                            Text(tf)
                                .padding(.vertical, 4)
                                .padding(.horizontal, 8)
                                .background(selectedTimeframe == tf ? Color.blue.opacity(0.3) : Color.clear)
                                .cornerRadius(6)
                                .foregroundColor(.white)
                                .onTapGesture {
                                    selectedTimeframe = tf
                                }
                        }
                    }
                }
                .padding()
                .background(
                    LinearGradient(colors: [Color.purple, Color.blue],
                                   startPoint: .topLeading,
                                   endPoint: .bottomTrailing)
                        .cornerRadius(20)
                )
                .padding(.horizontal)
                
                // Graph Placeholder
                VStack {
                    Text("📈 Portfolio Trend Graph")
                        .foregroundColor(.gray)
                        .padding(.vertical, 40)
                }
                .frame(maxWidth: .infinity)
                .background(Color.black.opacity(0.5))
                .cornerRadius(20)
                .padding(.horizontal)
                
                // Assets
                HStack(spacing: 15) {
                    AssetCard(name: "Bitcoin (BTC)", price: "₹ 75,62,502.14", delta: "+3.2%", icon: "bitcoinsign.circle.fill", iconColor: .orange)
                    AssetCard(name: "Ether (ETH)", price: "₹ 1,79,102.50", delta: "+3.1%", icon: "e.circle.fill", iconColor: .gray)
                }
                .padding(.horizontal)
                
                // Recent Transactions
                VStack(alignment: .leading) {
                    Text("Recent Transactions")
                        .foregroundColor(.white)
                        .font(.headline)
                    ForEach(0..<3) { _ in
                        TransactionRow()
                    }
                }
                .padding(.horizontal)
                
            }
            .padding(.top)
        }
        .background(Color.black.edgesIgnoringSafeArea(.all))
    }
}

struct AssetCard: View {
    let name: String
    let price: String
    let delta: String
    let icon: String
    let iconColor: Color
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Image(systemName: icon)
                .font(.largeTitle)
                .foregroundColor(iconColor)
            Text(name)
                .foregroundColor(.white)
                .font(.callout)
            Text(price)
                .foregroundColor(.white)
                .font(.headline)
            Text(delta)
                .foregroundColor(.green)
                .font(.subheadline)
        }
        .padding()
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(Color.black.opacity(0.4))
        .cornerRadius(15)
    }
}

struct TransactionRow: View {
    var body: some View {
        HStack {
            Image(systemName: "bitcoinsign.circle.fill")
                .foregroundColor(.orange)
                .font(.title2)
            VStack(alignment: .leading) {
                Text("Receive")
                    .foregroundColor(.white)
                    .font(.headline)
                Text("BTC")
                    .foregroundColor(.gray)
                    .font(.subheadline)
            }
            Spacer()
            Text("+0.005 BTC")
                .foregroundColor(.green)
        }
        .padding(.vertical, 8)
    }
}

#Preview {
    PortfolioDashboardView()
        .preferredColorScheme(.dark)
}
