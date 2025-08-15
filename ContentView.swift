//
//  ContentView.swift
//  Crypto
//
//  Created by manish ojha on 14/08/25.
//

import SwiftUI

struct ContentView: View {
    @State private var selectedTab = "Analytics"
    
    var body: some View {
        ZStack(alignment: .bottom) {
            // Switch Screens
            Group {
                switch selectedTab {
                case "Analytics":
                    PortfolioDashboardView()
                case "Exchange":
                    Text("Exchange Screen").foregroundColor(.white)
                case "Record":
                    Text("Record Screen").foregroundColor(.white)
                case "Wallet":
                    Text("Wallet Screen").foregroundColor(.white)
                default:
                    PortfolioDashboardView()
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.black.edgesIgnoringSafeArea(.all))
            
            // Bottom Navigation
            PortfolioDashboardView()
        }
        .preferredColorScheme(.dark)
    }
}

