//
//  GalaxyNote3.swift
//  Blagaprint
//
//  Created by Ivan Magda on 30.10.15.
//  Copyright (c) 2015 Blagaprint. All rights reserved.
//
//  Generated by PaintCode (www.paintcodeapp.com)
//



import UIKit

class GalaxyNote3 : NSObject {

    //// Cache

    struct Cache {
        static var outerShadow: NSShadow = NSShadow(color: UIColor.darkGrayColor().colorWithAlphaComponent(0.7), offset: CGSizeMake(-6.1, 8.1), blurRadius: 15)
        static var innerShadow: NSShadow = NSShadow(color: UIColor.darkGrayColor(), offset: CGSizeMake(1.1, -2.1), blurRadius: 4)
    }

    //// Shadows

    class var outerShadow: NSShadow { return Cache.outerShadow }
    class var innerShadow: NSShadow { return Cache.innerShadow }

    //// Drawing Methods

    class func drawNote3(frame: CGRect, fillColor: UIColor, colorOfText: UIColor, image: UIImage, var textSize: CGFloat, textXscale: CGFloat, caseText: String, backgroundImageVisible: Bool, textYscale: CGFloat, textRectHeight: CGFloat) {
        //// General Declarations
        let context = UIGraphicsGetCurrentContext()

        //// Color Declarations
        var fillColorRedComponent: CGFloat = 1,
            fillColorGreenComponent: CGFloat = 1,
            fillColorBlueComponent: CGFloat = 1
        fillColor.getRed(&fillColorRedComponent, green: &fillColorGreenComponent, blue: &fillColorBlueComponent, alpha: nil)

        let cameraStrokeColor = UIColor(red: (fillColorRedComponent * 0.75), green: (fillColorGreenComponent * 0.75), blue: (fillColorBlueComponent * 0.75), alpha: (CGColorGetAlpha(fillColor.CGColor) * 0.75 + 0.25))
        let strokeColor = UIColor(red: 0.000, green: 0.000, blue: 0.000, alpha: 0.104)

        //// Shadow Declarations
        let cameraInnerShadow = NSShadow(color: UIColor.grayColor(), offset: CGSizeMake(0.1, -0.1), blurRadius: 10)
        let cameraOuterShadow = NSShadow(color: UIColor.grayColor(), offset: CGSizeMake(0.1, 2.1), blurRadius: 3)

        //// Image Declarations
        let galaxyNote3CameraImage = UIImage(named: "galaxyNote3CameraImage.png")

        //// Rectangle Drawing
        CGContextSaveGState(context)
        CGContextTranslateCTM(context, frame.minX + 120.5, frame.minY + 220.5)

        let rectanglePath = UIBezierPath()
        rectanglePath.moveToPoint(CGPointMake(-94.17, -185.7))
        rectanglePath.addCurveToPoint(CGPointMake(-104.88, -153.29), controlPoint1: CGPointMake(-106.92, -169.44), controlPoint2: CGPointMake(-104.88, -153.29))
        rectanglePath.addLineToPoint(CGPointMake(-104.88, 150.74))
        rectanglePath.addCurveToPoint(CGPointMake(-94.17, 189.86), controlPoint1: CGPointMake(-104.88, 150.74), controlPoint2: CGPointMake(-103.96, 176.51))
        rectanglePath.addCurveToPoint(CGPointMake(-65.25, 197.69), controlPoint1: CGPointMake(-87.26, 199.28), controlPoint2: CGPointMake(-72.63, 197.69))
        rectanglePath.addCurveToPoint(CGPointMake(62.12, 197.69), controlPoint1: CGPointMake(-54.35, 197.69), controlPoint2: CGPointMake(35.06, 197.69))
        rectanglePath.addCurveToPoint(CGPointMake(93.29, 189.86), controlPoint1: CGPointMake(70.36, 197.69), controlPoint2: CGPointMake(85.03, 200.4))
        rectanglePath.addCurveToPoint(CGPointMake(104.97, 150.18), controlPoint1: CGPointMake(102.93, 177.57), controlPoint2: CGPointMake(104.97, 150.18))
        rectanglePath.addCurveToPoint(CGPointMake(104.97, -153.29), controlPoint1: CGPointMake(104.97, 150.18), controlPoint2: CGPointMake(104.97, -140.43))
        rectanglePath.addCurveToPoint(CGPointMake(93.29, -185.7), controlPoint1: CGPointMake(104.97, -154.42), controlPoint2: CGPointMake(106.15, -168.94))
        rectanglePath.addCurveToPoint(CGPointMake(62.12, -198), controlPoint1: CGPointMake(84.24, -197.51), controlPoint2: CGPointMake(69.5, -198))
        rectanglePath.addCurveToPoint(CGPointMake(-65.25, -198), controlPoint1: CGPointMake(49.35, -198), controlPoint2: CGPointMake(-60.78, -198))
        rectanglePath.addCurveToPoint(CGPointMake(-94.17, -185.7), controlPoint1: CGPointMake(-72.93, -198), controlPoint2: CGPointMake(-84.53, -198))
        rectanglePath.closePath()
        CGContextSaveGState(context)
        CGContextSetShadowWithColor(context, GalaxyNote3.outerShadow.shadowOffset, GalaxyNote3.outerShadow.shadowBlurRadius, GalaxyNote3.outerShadow.shadowColor!.CGColor)
        fillColor.setFill()
        rectanglePath.fill()

        ////// Rectangle Inner Shadow
        CGContextSaveGState(context)
        CGContextClipToRect(context, rectanglePath.bounds)
        CGContextSetShadow(context, CGSizeMake(0, 0), 0)
        CGContextSetAlpha(context, CGColorGetAlpha(GalaxyNote3.innerShadow.shadowColor!.CGColor))
        CGContextBeginTransparencyLayer(context, nil)
        let rectangleOpaqueShadow = GalaxyNote3.innerShadow.shadowColor!.colorWithAlphaComponent(1)
        CGContextSetShadowWithColor(context, GalaxyNote3.innerShadow.shadowOffset, GalaxyNote3.innerShadow.shadowBlurRadius, rectangleOpaqueShadow.CGColor)
        CGContextSetBlendMode(context, .SourceOut)
        CGContextBeginTransparencyLayer(context, nil)

        rectangleOpaqueShadow.setFill()
        rectanglePath.fill()

        CGContextEndTransparencyLayer(context)
        CGContextEndTransparencyLayer(context)
        CGContextRestoreGState(context)

        CGContextRestoreGState(context)

        strokeColor.setStroke()
        rectanglePath.lineWidth = 1
        rectanglePath.stroke()

        CGContextRestoreGState(context)


        if (backgroundImageVisible) {
            //// Background Image Rectangle Drawing
            CGContextSaveGState(context)
            CGContextTranslateCTM(context, frame.minX + 120.5, frame.minY + 220.5)

            let backgroundImageRectangleRect: CGRect = CGRectMake(-105, -198, 210, 396)
            let backgroundImageRectanglePath = UIBezierPath()
            backgroundImageRectanglePath.moveToPoint(CGPointMake(-94.17, -185.7))
            backgroundImageRectanglePath.addCurveToPoint(CGPointMake(-104.88, -153.29), controlPoint1: CGPointMake(-106.92, -169.44), controlPoint2: CGPointMake(-104.88, -153.29))
            backgroundImageRectanglePath.addLineToPoint(CGPointMake(-104.88, 150.74))
            backgroundImageRectanglePath.addCurveToPoint(CGPointMake(-94.17, 189.86), controlPoint1: CGPointMake(-104.88, 150.74), controlPoint2: CGPointMake(-103.96, 176.51))
            backgroundImageRectanglePath.addCurveToPoint(CGPointMake(-65.25, 197.69), controlPoint1: CGPointMake(-87.26, 199.28), controlPoint2: CGPointMake(-72.63, 197.69))
            backgroundImageRectanglePath.addCurveToPoint(CGPointMake(62.12, 197.69), controlPoint1: CGPointMake(-54.35, 197.69), controlPoint2: CGPointMake(35.06, 197.69))
            backgroundImageRectanglePath.addCurveToPoint(CGPointMake(93.29, 189.86), controlPoint1: CGPointMake(70.36, 197.69), controlPoint2: CGPointMake(85.03, 200.4))
            backgroundImageRectanglePath.addCurveToPoint(CGPointMake(104.97, 150.18), controlPoint1: CGPointMake(102.93, 177.57), controlPoint2: CGPointMake(104.97, 150.18))
            backgroundImageRectanglePath.addCurveToPoint(CGPointMake(104.97, -153.29), controlPoint1: CGPointMake(104.97, 150.18), controlPoint2: CGPointMake(104.97, -140.43))
            backgroundImageRectanglePath.addCurveToPoint(CGPointMake(93.29, -185.7), controlPoint1: CGPointMake(104.97, -154.42), controlPoint2: CGPointMake(106.15, -168.94))
            backgroundImageRectanglePath.addCurveToPoint(CGPointMake(62.12, -198), controlPoint1: CGPointMake(84.24, -197.51), controlPoint2: CGPointMake(69.5, -198))
            backgroundImageRectanglePath.addCurveToPoint(CGPointMake(-65.25, -198), controlPoint1: CGPointMake(49.35, -198), controlPoint2: CGPointMake(-60.78, -198))
            backgroundImageRectanglePath.addCurveToPoint(CGPointMake(-94.17, -185.7), controlPoint1: CGPointMake(-72.93, -198), controlPoint2: CGPointMake(-84.53, -198))
            backgroundImageRectanglePath.closePath()
            CGContextSaveGState(context)
            CGContextSetShadowWithColor(context, GalaxyNote3.outerShadow.shadowOffset, GalaxyNote3.outerShadow.shadowBlurRadius, GalaxyNote3.outerShadow.shadowColor!.CGColor)
            CGContextBeginTransparencyLayer(context, nil)
            CGContextSaveGState(context)
            backgroundImageRectanglePath.addClip()
            image.drawInRect(CGRectMake(floor(backgroundImageRectangleRect.minX + 0.5), floor(backgroundImageRectangleRect.minY + 0.5), image.size.width, image.size.height))
            CGContextRestoreGState(context)
            CGContextEndTransparencyLayer(context)

            ////// Background Image Rectangle Inner Shadow
            CGContextSaveGState(context)
            CGContextClipToRect(context, backgroundImageRectanglePath.bounds)
            CGContextSetShadow(context, CGSizeMake(0, 0), 0)
            CGContextSetAlpha(context, CGColorGetAlpha(GalaxyNote3.innerShadow.shadowColor!.CGColor))
            CGContextBeginTransparencyLayer(context, nil)
            let backgroundImageRectangleOpaqueShadow = GalaxyNote3.innerShadow.shadowColor!.colorWithAlphaComponent(1)
            CGContextSetShadowWithColor(context, GalaxyNote3.innerShadow.shadowOffset, GalaxyNote3.innerShadow.shadowBlurRadius, backgroundImageRectangleOpaqueShadow.CGColor)
            CGContextSetBlendMode(context, .SourceOut)
            CGContextBeginTransparencyLayer(context, nil)

            backgroundImageRectangleOpaqueShadow.setFill()
            backgroundImageRectanglePath.fill()

            CGContextEndTransparencyLayer(context)
            CGContextEndTransparencyLayer(context)
            CGContextRestoreGState(context)

            CGContextRestoreGState(context)

            strokeColor.setStroke()
            backgroundImageRectanglePath.lineWidth = 1
            backgroundImageRectanglePath.stroke()

            CGContextRestoreGState(context)
        }


        //// Text Drawing
        CGContextSaveGState(context)
        CGContextTranslateCTM(context, frame.minX + 16, frame.minY + 100)
        CGContextRotateCTM(context, CGFloat(90 * M_PI / 180))
        CGContextScaleCTM(context, textXscale, textYscale)
        
        let textRect: CGRect = CGRectMake(0, -textRectHeight, 280, textRectHeight)
        let textStyle = NSMutableParagraphStyle.defaultParagraphStyle().mutableCopy() as! NSMutableParagraphStyle
        textStyle.alignment = NSTextAlignment.Left;
        
        // Calculate font size
        let fontSizeThatFitsRect = CaseView.fontSizeThatFitsRect(textRect, withText: caseText, maxFontSize: 225.0, minFontSize: 46.0)
        if fontSizeThatFitsRect != textSize && fontSizeThatFitsRect > textSize {
            let adjustedFontSize: CGFloat = round(fontSizeThatFitsRect - textSize)
            textSize += adjustedFontSize
        }
        
        print("Text size = \(textSize)")
        
        
        let textFontAttributes = [NSFontAttributeName: AppAppearance.andersonSupercarFontWithSize(textSize), NSForegroundColorAttributeName: colorOfText, NSParagraphStyleAttributeName: textStyle]

        NSString(string: caseText).drawInRect(CGRectOffset(textRect, 0, (textRect.height - NSString(string: caseText).boundingRectWithSize(textRect.size, options: NSStringDrawingOptions.UsesLineFragmentOrigin, attributes: textFontAttributes, context: nil).size.height) / 2), withAttributes: textFontAttributes);

        CGContextRestoreGState(context)


        //// Camera Drawing
        let cameraRect: CGRect = CGRectMake(frame.minX + 100, frame.minY + 33, 40, 60)
        let cameraPath = UIBezierPath()
        cameraPath.moveToPoint(CGPointMake(frame.minX + 140, frame.maxY - 357.02))
        cameraPath.addCurveToPoint(CGPointMake(frame.maxX - 100, frame.maxY - 395.42), controlPoint1: CGPointMake(frame.minX + 140, frame.maxY - 370.92), controlPoint2: CGPointMake(frame.maxX - 100, frame.maxY - 379.44))
        cameraPath.addCurveToPoint(CGPointMake(frame.minX + 120.05, frame.minY + 33), controlPoint1: CGPointMake(frame.maxX - 100, frame.maxY - 403.39), controlPoint2: CGPointMake(frame.minX + 130.03, frame.minY + 32.88))
        cameraPath.addCurveToPoint(CGPointMake(frame.maxX - 140, frame.minY + 44.58), controlPoint1: CGPointMake(frame.minX + 110.03, frame.minY + 33.13), controlPoint2: CGPointMake(frame.maxX - 140, frame.minY + 37.12))
        cameraPath.addCurveToPoint(CGPointMake(frame.minX + 100, frame.minY + 82.98), controlPoint1: CGPointMake(frame.maxX - 140, frame.minY + 59.48), controlPoint2: CGPointMake(frame.minX + 100, frame.minY + 70.17))
        cameraPath.addCurveToPoint(CGPointMake(frame.minX + 140, frame.maxY - 357.02), controlPoint1: CGPointMake(frame.minX + 100, frame.minY + 95.79), controlPoint2: CGPointMake(frame.minX + 140, frame.maxY - 343.12))
        cameraPath.closePath()
        CGContextSaveGState(context)
        CGContextSetShadowWithColor(context, cameraOuterShadow.shadowOffset, cameraOuterShadow.shadowBlurRadius, cameraOuterShadow.shadowColor!.CGColor)
        CGContextBeginTransparencyLayer(context, nil)
        CGContextSaveGState(context)
        cameraPath.addClip()
        CGContextScaleCTM(context, 1, -1)
        
        if galaxyNote3CameraImage != nil {
            CGContextDrawTiledImage(context, CGRectMake(cameraRect.minX, -cameraRect.minY, galaxyNote3CameraImage!.size.width, galaxyNote3CameraImage!.size.height), galaxyNote3CameraImage!.CGImage)
        }
        
        CGContextRestoreGState(context)
        CGContextEndTransparencyLayer(context)

        ////// Camera Inner Shadow
        CGContextSaveGState(context)
        CGContextClipToRect(context, cameraPath.bounds)
        CGContextSetShadow(context, CGSizeMake(0, 0), 0)
        CGContextSetAlpha(context, CGColorGetAlpha(cameraInnerShadow.shadowColor!.CGColor))
        CGContextBeginTransparencyLayer(context, nil)
        let cameraOpaqueShadow = cameraInnerShadow.shadowColor!.colorWithAlphaComponent(1)
        CGContextSetShadowWithColor(context, cameraInnerShadow.shadowOffset, cameraInnerShadow.shadowBlurRadius, cameraOpaqueShadow.CGColor)
        CGContextSetBlendMode(context, .SourceOut)
        CGContextBeginTransparencyLayer(context, nil)

        cameraOpaqueShadow.setFill()
        cameraPath.fill()

        CGContextEndTransparencyLayer(context)
        CGContextEndTransparencyLayer(context)
        CGContextRestoreGState(context)

        CGContextRestoreGState(context)

        cameraStrokeColor.setStroke()
        cameraPath.lineWidth = 1
        cameraPath.stroke()
    }

    //// Generated Images

    class func imageOfNote3(frame: CGRect, fillColor: UIColor, colorOfText: UIColor, image: UIImage, textSize: CGFloat, textXscale: CGFloat, caseText: String, backgroundImageVisible: Bool, textYscale: CGFloat, textRectHeight: CGFloat) -> UIImage {
        UIGraphicsBeginImageContextWithOptions(CGSizeMake(320, 568), false, 0)
        GalaxyNote3.drawNote3(frame, fillColor: fillColor, colorOfText: colorOfText, image: image, textSize: textSize, textXscale: textXscale, caseText: caseText, backgroundImageVisible: backgroundImageVisible, textYscale: textYscale, textRectHeight: textRectHeight)
        let imageOfNote3 = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()

        return imageOfNote3!
    }

}
