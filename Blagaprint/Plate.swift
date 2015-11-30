//
//  Plate.swift
//  Blagaprint
//
//  Created by Ivan Magda on 30.11.15.
//  Copyright (c) 2015 Blagaprint. All rights reserved.
//
//  Generated by PaintCode (www.paintcodeapp.com)
//



import UIKit

public class Plate : NSObject {

    //// Drawing Methods

    public class func drawPlateCanvas(frame frame: CGRect = CGRectMake(10, 10, 320, 220), image: UIImage = UIImage(), isPlateImageVisible: Bool = true) {
        //// General Declarations
        let context = UIGraphicsGetCurrentContext()

        //// Color Declarations
        let shadowColor = UIColor(red: 0.667, green: 0.675, blue: 0.663, alpha: 1.000)
        let color = UIColor(red: 1.000, green: 1.000, blue: 1.000, alpha: 0.000)

        //// Shadow Declarations
        let innerShadow = NSShadow()
        innerShadow.shadowColor = shadowColor
        innerShadow.shadowOffset = CGSizeMake(3.1, 3.1)
        innerShadow.shadowBlurRadius = 15
        let outerShadow = NSShadow()
        outerShadow.shadowColor = UIColor.grayColor()
        outerShadow.shadowOffset = CGSizeMake(4.1, 4.1)
        outerShadow.shadowBlurRadius = 11

        //// Oval Drawing
        let ovalPath = UIBezierPath(ovalInRect: CGRectMake(frame.minX + 60, frame.minY + 10, 200, 200))
        CGContextSaveGState(context)
        CGContextSetShadowWithColor(context, outerShadow.shadowOffset, outerShadow.shadowBlurRadius, (outerShadow.shadowColor as! UIColor).CGColor)
        UIColor.whiteColor().setFill()
        ovalPath.fill()
        CGContextRestoreGState(context)

        shadowColor.setStroke()
        ovalPath.lineWidth = 0.1
        ovalPath.stroke()


        if (isPlateImageVisible) {
            //// Oval 2 Drawing
            let oval2Rect = CGRectMake(frame.minX + 60, frame.minY + 10, 200, 200)
            let oval2Path = UIBezierPath(ovalInRect: oval2Rect)
            CGContextSaveGState(context)
            CGContextSetShadowWithColor(context, outerShadow.shadowOffset, outerShadow.shadowBlurRadius, (outerShadow.shadowColor as! UIColor).CGColor)
            CGContextBeginTransparencyLayer(context, nil)
            CGContextSaveGState(context)
            oval2Path.addClip()
            image.drawInRect(CGRectMake(floor(oval2Rect.minX + 0.5), floor(oval2Rect.minY + 0.5), image.size.width, image.size.height))
            CGContextRestoreGState(context)
            CGContextEndTransparencyLayer(context)
            CGContextRestoreGState(context)

            shadowColor.setStroke()
            oval2Path.lineWidth = 0.1
            oval2Path.stroke()
        }


        //// Depth Drawing
        CGContextSaveGState(context)
        CGContextTranslateCTM(context, frame.minX + 159.79, frame.minY + 110.21)

        let depthPath = UIBezierPath(ovalInRect: CGRectMake(-59.79, -60.21, 120, 120))
        color.setFill()
        depthPath.fill()

        ////// Depth Inner Shadow
        CGContextSaveGState(context)
        CGContextClipToRect(context, depthPath.bounds)
        CGContextSetShadow(context, CGSizeMake(0, 0), 0)
        CGContextSetAlpha(context, CGColorGetAlpha((innerShadow.shadowColor as! UIColor).CGColor))
        CGContextBeginTransparencyLayer(context, nil)
        let depthOpaqueShadow = (innerShadow.shadowColor as! UIColor).colorWithAlphaComponent(1)
        CGContextSetShadowWithColor(context, innerShadow.shadowOffset, innerShadow.shadowBlurRadius, depthOpaqueShadow.CGColor)
        CGContextSetBlendMode(context, .SourceOut)
        CGContextBeginTransparencyLayer(context, nil)

        depthOpaqueShadow.setFill()
        depthPath.fill()

        CGContextEndTransparencyLayer(context)
        CGContextEndTransparencyLayer(context)
        CGContextRestoreGState(context)

        shadowColor.setStroke()
        depthPath.lineWidth = 0.1
        depthPath.stroke()

        CGContextRestoreGState(context)
    }

    //// Generated Images

    public class func imageOfPlateCanvas(frame frame: CGRect = CGRectMake(10, 10, 320, 220), image: UIImage = UIImage(), isPlateImageVisible: Bool = true) -> UIImage {
        UIGraphicsBeginImageContextWithOptions(frame.size, false, 0)
            Plate.drawPlateCanvas(frame: CGRectMake(0, 0, frame.size.width, frame.size.height), image: image, isPlateImageVisible: isPlateImageVisible)

        let imageOfPlateCanvas = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()

        return imageOfPlateCanvas
    }

}
