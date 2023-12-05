//
//  CirclePart.swift
//  MemoryGame
//
//  Created by student on 28/11/2023.
//

import SwiftUI
import CoreGraphics

struct CirclePart: Shape {
    var startAngle: Angle = .zero
    let endAngle: Angle
    func path(in rect: CGRect) -> Path {
        let center = CGPoint(x: rect.midX, y: rect.midY)
        let radius = min(rect.width, rect.height)/2
        let start = CGPoint(
            x: center.x + radius * cos(startAngle.radians),
            y: center.y + radius * sin(startAngle.radians)
        )
        
        var path = Path()
        path.move(to: center)
        path.addLine(to: start)
        path.addArc(center: center,
                    radius: radius,
                    startAngle: startAngle,
                    endAngle: endAngle,
                    clockwise: false)
        path.addLine(to: center)
        return path
    }
}

#Preview {
    CirclePart(startAngle: .degrees(-90), endAngle: .degrees(160))
        .fill(.blue)
}
