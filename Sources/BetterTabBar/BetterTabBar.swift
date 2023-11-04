import Foundation
import SwiftUI

public struct BetterTabBar: View {
    @Environment(\.colorScheme) var colorScheme
    @Binding var tabId: Int
    var strokeColor: Color
    var strokeLineWidth: CGFloat
    var spacing: CGFloat
    var maxWidth: CGFloat?
    var cornerRadius: CGFloat
    var height: CGFloat
    var tapFeedback: Bool
    var buttons: [TabButton]
    
    public init(tabId: Binding<Int>, strokeColor: Color, strokeLineWidth: CGFloat, spacing: CGFloat, maxWidth: CGFloat? = nil, cornerRadius: CGFloat, height: CGFloat, tapFeedback: Bool, buttons: [TabButton]) {
        self._tabId = tabId
        self.strokeColor = strokeColor
        self.strokeLineWidth = strokeLineWidth
        self.spacing = spacing
        self.maxWidth = maxWidth
        self.cornerRadius = cornerRadius
        self.height = height
        self.tapFeedback = tapFeedback
        self.buttons = buttons
    }
    
    public var body: some View{
        VStack (spacing: 15) {
            RoundedRectangle(cornerRadius: cornerRadius)
                .fill(.regularMaterial)
                .frame(maxWidth: maxWidth?.isNaN ?? true ? CGFloat(60 * buttons.count) : maxWidth)
                .overlay(
                    HStack (alignment: .center, spacing: spacing) {
                        ForEach(Array(buttons.enumerated()), id: \.element.id) { index, button in
                            let image = tabId == index ? button.selectedImage : button.unselectedImage
                            Button {
                                if tapFeedback {
#if os(iOS)
                                    UIImpactFeedbackGenerator(style: .medium).impactOccurred()
#endif
                                }
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
}

public struct TabButton {
    public let id: UUID = UUID()
    public var selectedImage: Image
    public var unselectedImage: Image
    public var lightColor: Color
    public var darkColor: Color
    
    public init(selectedImage: Image, unselectedImage: Image, lightColor: Color, darkColor: Color) {
        self.selectedImage = selectedImage
        self.unselectedImage = unselectedImage
        self.lightColor = lightColor
        self.darkColor = darkColor
    }
}
