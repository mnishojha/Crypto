//
//  NavigationView.swift
//  Crypto
//
//  Created by manish ojha on 14/08/25.
//

import SwiftUI

struct NavigationButtonsView: View {
    @Binding var selectedTab: String
    
    let tabs: [NavTabItem] = [
        NavTabItem(title: "Analytics", icon: "chart.line.uptrend.xyaxis"),
        NavTabItem(title: "Exchange", icon: "arrow.left.arrow.right"),
        NavTabItem(title: "Record", icon: "doc.text"),
        NavTabItem(title: "Wallet", icon: "wallet.pass")
    ]
    
    var body: some View {
        HStack {
            ForEach(tabs) { tab in
                Spacer()
                VStack(spacing: 5) {
                    Image(systemName: tab.icon)
                        .font(.system(size: 20, weight: .medium))
                        .foregroundColor(selectedTab == tab.title ? .blue : .white)
                    Text(tab.title)
                        .font(.caption2)
                        .foregroundColor(selectedTab == tab.title ? .blue : .white.opacity(0.8))
                }
                .padding(.vertical, 8)
                .onTapGesture {
                    selectedTab = tab.title
                }
                Spacer()
            }
        }
        .background(
            BlurView(style: .systemUltraThinMaterialDark)
                .cornerRadius(25)
                .padding(.horizontal, 8)
        )
        .padding(.bottom, 10)
    }
}

struct NavTabItem: Identifiable {
    let id = UUID()
    let title: String
    let icon: String
}

#Preview {
    NavigationButtonsView(selectedTab: .constant("Analytics"))
        .preferredColorScheme(.dark)
}
