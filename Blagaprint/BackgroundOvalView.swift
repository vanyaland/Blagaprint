//
//  BackgroundOvalView.swift
//  Blagaprint
//
//  Created by Ivan Magda on 13.10.15.
//  Copyright (c) 2015 Ivan Magda. All rights reserved.
//
//  Generated by PaintCode (www.paintcodeapp.com)
//



import UIKit

class BackgroundOvalView : NSObject {
    //// Drawing Methods

    class func drawOvalView(frame: CGRect, fillColor: UIColor, visible: Bool) {
        //// Color Declarations
        var fillColorRedComponent: CGFloat = 1,
            fillColorGreenComponent: CGFloat = 1,
            fillColorBlueComponent: CGFloat = 1
        fillColor.getRed(&fillColorRedComponent, green: &fillColorGreenComponent, blue: &fillColorBlueComponent, alpha: nil)

        let strokeColor = UIColor(red: (fillColorRedComponent * 0.7), green: (fillColorGreenComponent * 0.7), blue: (fillColorBlueComponent * 0.7), alpha: (CGColorGetAlpha(fillColor.CGColor) * 0.7 + 0.3))
        var checkmarkStrokeColor = UIColor(red: (fillColorRedComponent * 0.5), green: (fillColorGreenComponent * 0.5), blue: (fillColorBlueComponent * 0.5), alpha: (CGColorGetAlpha(fillColor.CGColor) * 0.5 + 0.5))
        
        if fillColor == UIColor.blackColor() {
            checkmarkStrokeColor = UIColor.whiteColor()
        }

        //// Oval Drawing
        let ovalPath = UIBezierPath()
        ovalPath.moveToPoint(CGPointMake(frame.maxX - 14.29, frame.maxY - 15.29))
        ovalPath.addCurveToPoint(CGPointMake(frame.maxX - 14.29, frame.minY + 14.29), controlPoint1: CGPointMake(frame.maxX - 2.57, frame.maxY - 27), controlPoint2: CGPointMake(frame.maxX - 2.57, frame.minY + 26))
        ovalPath.addCurveToPoint(CGPointMake(frame.minX + 15.29, frame.minY + 14.29), controlPoint1: CGPointMake(frame.maxX - 26, frame.minY + 2.57), controlPoint2: CGPointMake(frame.minX + 27, frame.minY + 2.57))
        ovalPath.addCurveToPoint(CGPointMake(frame.minX + 15.29, frame.maxY - 15.29), controlPoint1: CGPointMake(frame.minX + 3.57, frame.minY + 26), controlPoint2: CGPointMake(frame.minX + 3.57, frame.maxY - 27))
        ovalPath.addCurveToPoint(CGPointMake(frame.maxX - 14.29, frame.maxY - 15.29), controlPoint1: CGPointMake(frame.minX + 27, frame.maxY - 3.57), controlPoint2: CGPointMake(frame.maxX - 26, frame.maxY - 3.57))
        ovalPath.closePath()
        fillColor.setFill()
        ovalPath.fill()
        strokeColor.setStroke()
        ovalPath.lineWidth = 1
        ovalPath.stroke()


        if (visible) {
            //// Bezier Drawing
            let bezierPath = UIBezierPath()
            bezierPath.moveToPoint(CGPointMake(frame.minX + 18.5, frame.maxY - 28.5))
            bezierPath.addCurveToPoint(CGPointMake(frame.minX + 33.5, frame.maxY - 18.5), controlPoint1: CGPointMake(frame.minX + 31.5, frame.maxY - 18.5), controlPoint2: CGPointMake(frame.minX + 33.5, frame.maxY - 18.5))
            bezierPath.addLineToPoint(CGPointMake(frame.maxX - 35.2, frame.maxY - 24.27))
            bezierPath.addLineToPoint(CGPointMake(frame.maxX - 18.5, frame.minY + 18.5))
            bezierPath.lineCapStyle = CGLineCap.Round;

            fillColor.setFill()
            bezierPath.fill()
            checkmarkStrokeColor.setStroke()
            bezierPath.lineWidth = 2
            bezierPath.stroke()
        }
    }

    //// Generated Images

    class func imageOfOvalView(frame: CGRect, fillColor: UIColor, visible: Bool) -> UIImage {
        UIGraphicsBeginImageContextWithOptions(CGSizeMake(83, 83), false, 0)
        BackgroundOvalView.drawOvalView(frame, fillColor: fillColor, visible: visible)
        let imageOfOvalView = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()

        return imageOfOvalView!
    }

}