// The Swift Programming Language
// https://docs.swift.org/swift-book

import Foundation
import SwiftUI

struct BetterTabBar: View {
    @Environment(\.colorScheme) var colorScheme
    @Binding var tabId: Int
    var strokeColor: Color
    var strokeLineWidth: CGFloat
    var spacing: CGFloat
    var maxWidth: CGFloat?
    var cornerRadius: CGFloat
    var height: CGFloat
    var buttons: [TabButton]
    
    struct TabButton {
        let id: UUID = UUID()
        var selectedImage: Image
        var unselectedImage: Image
        var lightColor: Color
        var darkColor: Color
    }
    
    var body: some View{
        VStack (spacing: 15) {
            RoundedRectangle(cornerRadius: cornerRadius)
                .fill(.regularMaterial)
                .frame(maxWidth: maxWidth?.isNaN ?? true ? CGFloat(60 * buttons.count) : maxWidth)
                .overlay(
                    HStack (alignment: .center, spacing: spacing) {
                        ForEach(Array(buttons.enumerated()), id: \.element.id) { index, button in
                            let image = tabId == index ? button.selectedImage : button.unselectedImage
                            Button {
                                tabBarFeedback()
                                withAnimation {
                                    tabId = index
                                }
                            } label: {
                                image
                                    .font(.system(size: 25, weight: tabId == index ? .semibold : .regular))
                                    .foregroundColor(colorScheme == .light ? button.lightColor : button.darkColor)
                                    .background(Color.clear)
                                    .opacity(tabId == index ? 1 : 0.5)
                            }
                        }
                        
                    }
                )
                .overlay(
                    RoundedRectangle(cornerRadius: cornerRadius)
                        .stroke(strokeColor.opacity(0.6), lineWidth: strokeLineWidth)
                )
                .frame(height: height)
                .animation(.spring())
        }
    }
    
    private func tabBarFeedback() {
#if os(iOS)
        UIImpactFeedbackGenerator(style: .medium).impactOccurred()
#endif
    }
}

/*
#Preview {
    BetterTabBar(tabId: .constant(1), strokeColor: .green, strokeLineWidth: 4, spacing: 20, cornerRadius: 30, height: 60, buttons: [
        .init(selectedImage: Image(systemName: "bus"), unselectedImage: Image(systemName: "bus.fill"), lightColor: .green, darkColor: .blue),
        .init(selectedImage: Image(systemName: "car"), unselectedImage: Image(systemName: "car.fill"), lightColor: .green, darkColor: .blue),
        .init(selectedImage: Image(systemName: "tram"), unselectedImage: Image(systemName: "tram.fill"), lightColor: .green, darkColor: .blue)
    ])
}
*/
