//
//  FaceView.swift
//  FaceIt
//
//  Created by Adhitya Surya Pratama on 8/11/17.
//  Copyright © 2017 Adhitya Surya Pratama. All rights reserved.
//

import UIKit

@IBDesignable
class FaceView: UIView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    @IBInspectable var faceScale : CGFloat = 0.9
    
    @IBInspectable var openEye : Bool = true
    
    @IBInspectable var mouthCurved : Double = 1.0
    @IBInspectable var lineWidth : CGFloat = 5.0
    @IBInspectable var color : UIColor = UIColor.black
    private var skullRadius : CGFloat {
        return min(bounds.size.width, bounds.size.height) / 2 * faceScale
    }
    
    private var skullCenter : CGPoint {
        return CGPoint(x: bounds.midX, y: bounds.midY)
    }
    
    private enum Eye {
        case left
        case right
    }
    
    private struct Ratios{
        static let skullRadiusToEyeOffset : CGFloat = 3
        static let skullRadiusToEyeRadius : CGFloat = 10
        static let skullRadiusToMouthWidth : CGFloat = 1
        static let skullRadiusToMouthHeight : CGFloat = 3
        static let skullRadiusToMouthOffset : CGFloat = 3
        
    }
    private func pathForEye(_ eye: Eye)->UIBezierPath
    {
        func centerOfEye(_ eye: Eye)->CGPoint {
            let eyeOffset = skullRadius  / Ratios.skullRadiusToEyeOffset
            var eyeCenter = skullCenter
            eyeCenter.y -= eyeOffset
            eyeCenter.x += ((eye == .left) ? -1 : 1) * eyeOffset
            return eyeCenter
        }
        
        let eyeRadius = skullRadius / Ratios.skullRadiusToEyeRadius
        let eyeCenter = centerOfEye(eye)
        
        let path : UIBezierPath
        if openEye{
            path = UIBezierPath(arcCenter: eyeCenter, radius: eyeRadius, startAngle: 0, endAngle: 2 * CGFloat.pi, clockwise: false)
        }
        else{
            path = UIBezierPath()
            path.move(to: CGPoint(x: eyeCenter.x - eyeRadius, y: eyeCenter.y))
            path.addLine(to: CGPoint(x: eyeCenter.x + eyeRadius, y: eyeCenter.y))
        }
        path.lineWidth = lineWidth
        return path
    }
    
    private func pathForSkull()->UIBezierPath {
        let path = UIBezierPath(arcCenter: skullCenter, radius: skullRadius, startAngle: 0, endAngle: 2 * CGFloat.pi, clockwise: false)
        path.lineWidth = lineWidth
        return path
    }
    
    private func pathForMouth()->UIBezierPath{
        let width = skullRadius / Ratios.skullRadiusToMouthWidth
        let offset = skullRadius / Ratios.skullRadiusToMouthOffset
        let height = skullRadius / Ratios.skullRadiusToMouthHeight
        
        let mouthRect = CGRect(x: skullCenter.x - width / 2, y: skullCenter.y + offset, width: width, height: height)
        
        let smileOffset = CGFloat(max(-1,min(mouthCurved, 1))) * mouthRect.height
        
        let start = CGPoint(x: mouthRect.minX, y: mouthRect.midY)
        let end = CGPoint(x: mouthRect.maxX, y: mouthRect.midY)
        
        let centerPointLeft = CGPoint(x: start.x + mouthRect.width/3, y: start.y + smileOffset)
        
        let centerPointRight = CGPoint(x: end.x - mouthRect.width/3, y: end.y + smileOffset)
        
        let path = UIBezierPath()
        path.move(to: start)
        path.addCurve(to: end, controlPoint1: centerPointLeft, controlPoint2: centerPointRight)
        path.lineWidth = lineWidth
        return path
    }
    override func draw(_ rect: CGRect)
    {
        UIColor.black.set()
        pathForSkull().stroke()
        pathForEye(.left).stroke()
        pathForEye(.right).stroke()
        pathForMouth().stroke()
    }
}
