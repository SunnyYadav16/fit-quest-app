//
//  StatsRadarView.swift
//  FitQuest
//
//  Created by Rushad Daruwalla on 11/18/25.
//

import UIKit

class StatsRadarView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .clear
        isOpaque = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func draw(_ rect: CGRect) {
        guard let ctx = UIGraphicsGetCurrentContext() else { return }
        
        let center = CGPoint(x: rect.midX, y: rect.midY)
        let outerRadius = min(rect.width, rect.height) / 2 - 8
        
        let gridColor = UIColor(red: 0.12, green: 0.26, blue: 0.42, alpha: 1.0)
        let fillColor = UIColor(red: 0.33, green: 0.67, blue: 0.93, alpha: 0.35)
        let strokeColor = UIColor(red: 0.33, green: 0.67, blue: 0.93, alpha: 0.9)
        
        // Helper to compute a point on the pentagon
        func point(at index: Int, radius: CGFloat) -> CGPoint {
            // Start at top and go around
            let angle = -CGFloat.pi / 2 + CGFloat(index) * (2 * CGFloat.pi / 5)
            let x = center.x + radius * cos(angle)
            let y = center.y + radius * sin(angle)
            return CGPoint(x: x, y: y)
        }
        
        // Draw concentric pentagon grid
        let levels = 4
        ctx.setLineWidth(1)
        gridColor.setStroke()
        
        for level in 1...levels {
            let r = outerRadius * CGFloat(level) / CGFloat(levels)
            let path = UIBezierPath()
            for i in 0..<5 {
                let p = point(at: i, radius: r)
                if i == 0 {
                    path.move(to: p)
                } else {
                    path.addLine(to: p)
                }
            }
            path.close()
            path.stroke()
        }
        
        // 2) Draw radial lines from center to each vertex
        for i in 0..<5 {
            let p = point(at: i, radius: outerRadius)
            let path = UIBezierPath()
            path.move(to: center)
            path.addLine(to: p)
            path.stroke()
        }
        
        // 3) Draw main light-blue pentagon (filled)
        let statRadius = outerRadius * 0.8
        let statPath = UIBezierPath()
        for i in 0..<5 {
            let p = point(at: i, radius: statRadius)
            if i == 0 {
                statPath.move(to: p)
            } else {
                statPath.addLine(to: p)
            }
        }
        statPath.close()
        
        fillColor.setFill()
        statPath.fill()
        
        strokeColor.setStroke()
        statPath.lineWidth = 2
        statPath.stroke()
    }
}
