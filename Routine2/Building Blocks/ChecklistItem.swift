//
//  ChecklistItem.swift
//  Routine2
//
//  Created by Alex Westerlund on 2/26/24.
//

import SwiftUI

enum TodoItemState: Equatable {
    case pending
    case completed
    case skipped
    case failed
}

struct TodoItem: Identifiable {
    var id = UUID()
    var name: String
    var duration: Int
    var state: TodoItemState = .pending
}

struct ChecklistItem: View {
    @Binding var item: TodoItem
    @Binding var allFinished: Bool
    @State private var symbolBounce = 0.0
    let tap = UISelectionFeedbackGenerator()
    let longTap = UIImpactFeedbackGenerator(style: .soft)

    var body: some View {
        HStack {
            Image(systemName: enumSymbol(item.state))
                .foregroundColor(enumColor(item.state))
                .symbolEffect(.bounce.down, value: symbolBounce)
            
            Text(item.name)
                .foregroundStyle(item.state != .pending ? .clear : Color(.label))
                .animatedStrikethrough(item.state != .pending, color: enumColor(item.state))

            Spacer()
            
            Text("\(item.duration)min")
                .italic()
                .foregroundStyle(item.state != .pending ? .clear : Color(.systemGray))
                .animatedStrikethrough(item.state != .pending, pattern: .dot, color: Color(.systemGray))
        }
        .padding(.vertical, allFinished ? 0 : 4)
        .background(allFinished ? Color(.systemGray5) : Color(.systemBackground))
        .onTapGesture {
            tap.selectionChanged()
            withAnimation(.bouncy(extraBounce: 0.2)) {
                item.state = item.state == .pending ? .completed : .pending
            }
            symbolBounce += 1
        }
        .onLongPressGesture {
            longTap.impactOccurred()
            withAnimation(.bouncy(extraBounce: 0.2)) {
                item.state = item.state == .failed ? .skipped : .failed
            }
        }
        .onAppear {
            tap.prepare()
        }
        .onReceive(NotificationCenter.default.publisher(for: UIApplication.willEnterForegroundNotification)) { _ in
            tap.prepare()
        }
    }
    
    func enumColor(_ state: TodoItemState) -> Color {
        switch state {
        case .pending:
            return Color(.label)
        case .completed:
            return Color(.systemGreen)
        case .skipped:
            return Color(.systemGray)
        case .failed:
            return Color(.systemRed)
        }
    }
    
    func enumSymbol(_ state: TodoItemState) -> String {
        switch state {
        case .pending:
            return "circle"
        case .completed:
            return "checkmark.circle.fill"
        case .skipped:
            return "moon.circle.fill"
        case .failed:
            return "xmark.circle.fill"
        }
    }
}

extension Text {
    func animatedStrikethrough(_ isActive: Bool = true,
                               pattern: Text.LineStyle.Pattern = .solid,
                               textColor: Color? = nil,
                               color: Color? = nil) -> some View {
        self
            .foregroundStyle(textColor ?? .clear)
            .overlay(alignment: .leading) {
                self
                    .foregroundStyle(.clear)
                    .strikethrough(isActive, pattern: pattern, color: color)
                    .scaleEffect(x: isActive ? 1 : 0, anchor: .leading)
            }
    }
}

//#Preview {
//    ChecklistItem()
//}
