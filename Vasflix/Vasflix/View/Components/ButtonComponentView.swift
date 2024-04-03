//
//  ButtonComponentView.swift
//  Vasflix
//
//  Created by Adrian Castañeda on 02/04/24.
//

import SwiftUI


struct ButtonComponentView: View {
    let label: String
    let labelColor: Color?
    let labelSize: CGFloat?
    let labelWeight: Font.Weight?
    let icon: String?
    let iconImage: String?
    let action: () -> Void
    let backgroundColor: Color?
    
    init(
        label: String,
        labelColor:Color? = nil,
        backgroundColor: Color? = nil,
        labelSize: CGFloat = 16,
        labelWeight: Font.Weight? = .medium,
        icon: String? = nil,
        iconImage: String? = nil,
        action: @escaping () -> Void
    ) {
        self.label = label
        self.icon = icon
        self.action = action
        self.labelSize = labelSize
        self.labelWeight = labelWeight
        self.iconImage = iconImage
        self.labelColor = labelColor
        self.backgroundColor = backgroundColor
    }
    var body: some View {
        Button {
            action()
        }label: {
            HStack {
                if let icon {
                    Image(systemName: icon)
                        .frame(width: 24,height: 24)
                }
                if let iconImage {
                    Image(iconImage)
                        .resizable()
                        .frame(width: 24,height: 24)
                }
                
                Text(label)
                    .font(.system(size: labelSize! ,weight: labelWeight))
                    .foregroundStyle(labelColor ?? .whiteColor)
                    
                    
            }
            .frame(width: 263,height: 55)
            .background(RoundedRectangle(cornerRadius: 10))
            .buttonStyle(.borderedProminent)
            .tint(backgroundColor ?? .white)
            
                
        }
    }
}

#Preview {
    ButtonComponentView(
        label: "Sign up with Google",
        backgroundColor: .caribeanColor,
        iconImage: "google"){}
}
