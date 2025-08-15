import SwiftUI

// MARK: - Transactions Summary (the screen from your screenshot)
struct TransactionsSummaryView: View {
    @State private var portfolioValue = "1,57,342.05"
    @State private var deltaINR = "₹ 1,342"
    @State private var deltaPct = "+4.6%"

    @State private var txns: [SummaryTxn] = [
        .init(direction: .receive, title: "Receive", date: "20 March", token: "BTC", amount: "+0.00216"),
        .init(direction: .send,    title: "Sent",    date: "19 March", token: "ETH", amount: "+0.003126"),
        .init(direction: .send,    title: "Send",    date: "18 March", token: "LTC", amount: "+0.02126")
    ]

    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()

            ScrollView {
                VStack(alignment: .leading, spacing: 22) {

                    // Header
                    HeaderBar()

                    // Portfolio Card
                    PortfolioCard(value: portfolioValue, deltaINR: deltaINR, deltaPct: deltaPct)

                    // Action buttons
                    HStack(spacing: 26) {
                        RoundActionButton(icon: "arrow.up")      // Send
                        RoundActionButton(icon: "plus")          // Add
                        RoundActionButton(icon: "arrow.down")    // Receive
                    }
                    .padding(.top, -4)

                    // Section header
                    HStack {
                        Text("Transactions").foregroundStyle(.white.opacity(0.9))
                        Spacer()
                        Text("Last 4 days").foregroundStyle(.white.opacity(0.6))
                    }
                    .font(.headline)
                    .padding(.horizontal)

                    // Transactions list
                    VStack(spacing: 12) {
                        ForEach(txns) { t in
                            SummaryTxnRow(txn: t)
                        }
                    }
                    .padding(.horizontal)

                    Spacer(minLength: 90) // space for your bottom bar
                }
                .padding(.top, 12)
            }
        }
    }
}

// MARK: - Components (renamed to avoid collisions)

private struct HeaderBar: View {
    var body: some View {
        HStack {
            Image(systemName: "line.3.horizontal")
                .foregroundStyle(.white)
            Spacer()
            Image(systemName: "bell")
                .foregroundStyle(.white)
        }
        .font(.title3)
        .padding(.horizontal)
    }
}

private struct PortfolioCard: View {
    let value: String
    let deltaINR: String
    let deltaPct: String

    var body: some View {
        VStack(spacing: 14) {
            Text("INR")
                .font(.caption.bold())
                .padding(.horizontal, 12).padding(.vertical, 6)
                .background(RoundedRectangle(cornerRadius: 10).fill(Color.white.opacity(0.18)))
                .foregroundStyle(.white)

            Text(value)
                .font(.system(size: 36, weight: .bold, design: .rounded))
                .foregroundStyle(.white)

            HStack(spacing: 6) {
                Text(deltaINR).foregroundStyle(.white.opacity(0.85))
                Text(deltaPct).foregroundStyle(.green)
            }
            .font(.callout)
        }
        .frame(maxWidth: .infinity)
        .padding(.vertical, 24)
        .background(
            ZStack(alignment: .bottom) {
                LinearGradient(colors: [Color.purple, Color.blue],
                               startPoint: .topLeading, endPoint: .bottomTrailing)
                // subtle base shadow like the screenshot
                Capsule().fill(Color.black.opacity(0.35))
                    .frame(width: 140, height: 10)
                    .offset(y: 14)
            }
            .clipShape(RoundedRectangle(cornerRadius: 22, style: .continuous))
        )
        .overlay(
            RoundedRectangle(cornerRadius: 22).stroke(Color.white.opacity(0.08), lineWidth: 1)
        )
        .padding(.horizontal)
    }
}

private struct RoundActionButton: View {
    let icon: String
    var body: some View {
        Button {} label: {
            ZStack {
                Circle().fill(Color.white.opacity(0.08)).frame(width: 58, height: 58)
                Image(systemName: icon)
                    .font(.system(size: 18, weight: .bold))
                    .foregroundStyle(.white)
            }
        }
        .buttonStyle(.plain)
    }
}

private struct SummaryTxn: Identifiable {
    enum Direction { case send, receive }
    let id = UUID()
    let direction: Direction
    let title: String
    let date: String
    let token: String
    let amount: String
}

private struct SummaryTxnRow: View {
    let txn: SummaryTxn

    var body: some View {
        HStack(spacing: 14) {
            ZStack {
                RoundedRectangle(cornerRadius: 14).fill(Color.white.opacity(0.08))
                    .frame(width: 52, height: 52)
                Image(systemName: txn.direction == .receive ? "arrow.down" : "arrow.up")
                    .font(.system(size: 16, weight: .bold))
                    .foregroundStyle(.white)
            }

            VStack(alignment: .leading, spacing: 4) {
                Text(txn.title).foregroundStyle(.white).font(.headline)
                Text(txn.date).foregroundStyle(.white.opacity(0.6)).font(.subheadline)
            }
            Spacer()

            VStack(alignment: .trailing, spacing: 6) {
                Text(txn.token).foregroundStyle(.white.opacity(0.7)).font(.subheadline)
                Text(txn.amount).foregroundStyle(.white).font(.subheadline.weight(.semibold))
            }
            .padding(.horizontal, 6).padding(.vertical, 6)
            .background(RoundedRectangle(cornerRadius: 14).fill(Color.white.opacity(0.08)))
        }
        .padding(12)
        .background(RoundedRectangle(cornerRadius: 18).fill(Color.white.opacity(0.08)))
    }
}

#Preview {
    TransactionsSummaryView()
        .preferredColorScheme(.dark)
}
