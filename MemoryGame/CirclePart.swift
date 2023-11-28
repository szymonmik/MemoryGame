//
//  CirclePart.swift
//  MemoryGame
//
//  Created by student on 28/11/2023.
//

import SwiftUI

struct CirclePart: Shape {
    func path(in rect: CGRect) -> Path {
        Path { path in
                    
            path.move(to: CGPoint(x: rect.midX, y: rect.midY))
            path.addArc(center: CGPoint(x: rect.midX, y: rect.midY), radius: 180, startAngle: .degrees(-90), endAngle: .degrees(160), clockwise: false)
                    
            //path.move(to: CGPoint(x: rect.midX, y: rect.midY))
            //path.addLine(to: CGPoint(x: rect.midX, y: rect.maxY))
            //path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
            //path.addLine(to: CGPoint(x: rect.midX, y: rect.minY))
        }
    }
    
}

#Preview {
    CirclePart()
        .fill(.blue)
}
