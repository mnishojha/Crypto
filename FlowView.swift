import SwiftUI

// MARK: - Dummy placeholder views (replace with your real ones)
struct PortfolioDashboardViews: View {
    var body: some View {
        Text("Portfolio Dashboard")
            .font(.largeTitle)
            .foregroundColor(.white)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.black)
    }
}

struct TransactionsSummaryViews: View {
    var body: some View {
        Text("Transactions Summary")
            .font(.largeTitle)
            .foregroundColor(.white)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.black)
    }
}

struct ExchangeScreenViews: View {
    var body: some View {
        Text("Exchange Screen")
            .font(.largeTitle)
            .foregroundColor(.white)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.black)
    }
}

// MARK: - Tabs Enum
private enum RootTab: CaseIterable {
    case analytics, transactions, exchange
    
    var title: String {
        switch self {
        case .analytics:    return "Analytics"
        case .transactions: return "Record"
        case .exchange:     return "Exchange"
        }
    }
    
    var icon: String {
        switch self {
        case .analytics:    return "chart.line.uptrend.xyaxis"
        case .transactions: return "doc.text"
        case .exchange:     return "arrow.2.squarepath"
        }
    }
}

// MARK: - Flow View
struct FlowView: View {
    @State private var tab: RootTab = .analytics
    
    var body: some View {
        ZStack(alignment: .bottom) {
            
            // Switch between views
            Group {
                if tab == .analytics {
                    PortfolioDashboardView()
                } else if tab == .transactions {
                    TransactionsSummaryView()
                } else if tab == .exchange {
                    ExchangeScreenView()
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.black.ignoresSafeArea())
            
            // Bottom Tab Bar
            HStack(spacing: 18) {
                ForEach(RootTab.allCases, id: \.self) { t in
                    Button {
                        tab = t
                    } label: {
                        VStack(spacing: 4) {
                            Image(systemName: t.icon)
                                .font(.system(size: 18, weight: .semibold))
                            Text(t.title)
                                .font(.caption2)
                        }
                        .foregroundStyle(tab == t ? .white : .white.opacity(0.7))
                        .padding(.horizontal, 10)
                        .padding(.vertical, 8)
                        .background(
                            Capsule()
                                .fill(tab == t ? Color.blue.opacity(0.35) : .clear)
                        )
                    }
                    .buttonStyle(.plain)
                }
            }
            .padding(.horizontal, 20)
            .padding(.vertical, 10)
            .background(.ultraThinMaterial, in: Capsule())
            .shadow(color: .black.opacity(0.35), radius: 16, x: 0, y: 8)
            .padding(.bottom, 16)
        }
        .preferredColorScheme(.dark)
    }
}

#Preview {
    FlowView()
}
