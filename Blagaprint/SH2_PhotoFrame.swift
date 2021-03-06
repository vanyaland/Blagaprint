//
//  SH2_PhotoFrame.swift
//  Blagaprint
//
//  Created by Ivan Magda on 25.11.15.
//  Copyright (c) 2015 Blagaprint. All rights reserved.
//
//  Generated by PaintCode (www.paintcodeapp.com)
//



import UIKit

public class SH2_PhotoFrame : NSObject {

    //// Drawing Methods

    public class func drawSH2(frame frame: CGRect = CGRectMake(0, 0, 515, 533), pickedImage: UIImage = UIImage()) {
        //// General Declarations
        let context = UIGraphicsGetCurrentContext()


        //// Shadow Declarations
        let outerShadow = NSShadow()
        outerShadow.shadowColor = UIColor.blackColor()
        outerShadow.shadowOffset = CGSizeMake(0.1, -0.1)
        outerShadow.shadowBlurRadius = 10

        //// Image Declarations
        let sh2_placeholderImage = UIImage(named: "sh2_placeholderImage.jpg")!

        //// PlaceholderRectangle Drawing
        let placeholderRectangleRect = CGRectMake(frame.minX, frame.minY, 515, 533)
        let placeholderRectanglePath = UIBezierPath(rect: placeholderRectangleRect)
        CGContextSaveGState(context)
        placeholderRectanglePath.addClip()
        sh2_placeholderImage.drawInRect(CGRectMake(floor(placeholderRectangleRect.minX + 0.5), floor(placeholderRectangleRect.minY + 0.5), sh2_placeholderImage.size.width, sh2_placeholderImage.size.height))
        CGContextRestoreGState(context)


        //// PickedImageRectangle Drawing
        let pickedImageRectangleRect = CGRectMake(frame.minX + 24.56, frame.minY + 35, 468, 450)
        let pickedImageRectanglePath = UIBezierPath()
        pickedImageRectanglePath.moveToPoint(CGPointMake(frame.minX + 153.05, frame.minY + 82))
        pickedImageRectanglePath.addCurveToPoint(CGPointMake(frame.minX + 140.05, frame.minY + 92), controlPoint1: CGPointMake(frame.minX + 149.89, frame.minY + 83.8), controlPoint2: CGPointMake(frame.minX + 146.56, frame.minY + 87.27))
        pickedImageRectanglePath.addCurveToPoint(CGPointMake(frame.minX + 135.15, frame.minY + 95.71), controlPoint1: CGPointMake(frame.minX + 139, frame.minY + 92.76), controlPoint2: CGPointMake(frame.minX + 136.65, frame.minY + 94.17))
        pickedImageRectanglePath.addCurveToPoint(CGPointMake(frame.minX + 131.04, frame.minY + 101), controlPoint1: CGPointMake(frame.minX + 133.27, frame.minY + 97.62), controlPoint2: CGPointMake(frame.minX + 133.15, frame.minY + 99.72))
        pickedImageRectanglePath.addCurveToPoint(CGPointMake(frame.minX + 124.04, frame.minY + 104), controlPoint1: CGPointMake(frame.minX + 128.54, frame.minY + 102.52), controlPoint2: CGPointMake(frame.minX + 126.07, frame.minY + 100.51))
        pickedImageRectanglePath.addCurveToPoint(CGPointMake(frame.minX + 114.87, frame.minY + 119.42), controlPoint1: CGPointMake(frame.minX + 123.67, frame.minY + 104.63), controlPoint2: CGPointMake(frame.minX + 119.77, frame.minY + 111.94))
        pickedImageRectanglePath.addCurveToPoint(CGPointMake(frame.minX + 108.03, frame.minY + 136), controlPoint1: CGPointMake(frame.minX + 109.71, frame.minY + 127.28), controlPoint2: CGPointMake(frame.minX + 108.46, frame.minY + 135.32))
        pickedImageRectanglePath.addCurveToPoint(CGPointMake(frame.minX + 111.03, frame.minY + 145), controlPoint1: CGPointMake(frame.minX + 105.41, frame.minY + 140.18), controlPoint2: CGPointMake(frame.minX + 113.43, frame.minY + 139.84))
        pickedImageRectanglePath.addCurveToPoint(CGPointMake(frame.minX + 98.61, frame.minY + 164.25), controlPoint1: CGPointMake(frame.minX + 108.49, frame.minY + 150.5), controlPoint2: CGPointMake(frame.minX + 103.15, frame.minY + 157.31))
        pickedImageRectanglePath.addCurveToPoint(CGPointMake(frame.minX + 91.59, frame.minY + 179.02), controlPoint1: CGPointMake(frame.minX + 95.32, frame.minY + 169.26), controlPoint2: CGPointMake(frame.minX + 94.22, frame.minY + 174.34))
        pickedImageRectanglePath.addCurveToPoint(CGPointMake(frame.minX + 84.02, frame.minY + 190), controlPoint1: CGPointMake(frame.minX + 89.32, frame.minY + 183.07), controlPoint2: CGPointMake(frame.minX + 85.4, frame.minY + 186.83))
        pickedImageRectanglePath.addCurveToPoint(CGPointMake(frame.minX + 89.21, frame.minY + 198.69), controlPoint1: CGPointMake(frame.minX + 82.73, frame.minY + 192.97), controlPoint2: CGPointMake(frame.minX + 90.46, frame.minY + 195.68))
        pickedImageRectanglePath.addCurveToPoint(CGPointMake(frame.minX + 84.02, frame.minY + 206), controlPoint1: CGPointMake(frame.minX + 87.66, frame.minY + 202.41), controlPoint2: CGPointMake(frame.minX + 85.27, frame.minY + 202.24))
        pickedImageRectanglePath.addCurveToPoint(CGPointMake(frame.minX + 81.02, frame.minY + 222), controlPoint1: CGPointMake(frame.minX + 82.7, frame.minY + 210.01), controlPoint2: CGPointMake(frame.minX + 82.52, frame.minY + 217.96))
        pickedImageRectanglePath.addCurveToPoint(CGPointMake(frame.minX + 84.02, frame.minY + 240), controlPoint1: CGPointMake(frame.minX + 78.28, frame.minY + 229.39), controlPoint2: CGPointMake(frame.minX + 86.6, frame.minY + 232.51))
        pickedImageRectanglePath.addCurveToPoint(CGPointMake(frame.minX + 78.13, frame.minY + 272.54), controlPoint1: CGPointMake(frame.minX + 80.31, frame.minY + 250.81), controlPoint2: CGPointMake(frame.minX + 78.49, frame.minY + 261.73))
        pickedImageRectanglePath.addCurveToPoint(CGPointMake(frame.minX + 76.02, frame.minY + 295), controlPoint1: CGPointMake(frame.minX + 77.87, frame.minY + 280.11), controlPoint2: CGPointMake(frame.minX + 78.34, frame.minY + 287.62))
        pickedImageRectanglePath.addCurveToPoint(CGPointMake(frame.minX + 83.41, frame.minY + 309.92), controlPoint1: CGPointMake(frame.minX + 74.42, frame.minY + 300.09), controlPoint2: CGPointMake(frame.minX + 84.99, frame.minY + 304.95))
        pickedImageRectanglePath.addCurveToPoint(CGPointMake(frame.minX + 69.02, frame.minY + 355), controlPoint1: CGPointMake(frame.minX + 78.39, frame.minY + 325.8), controlPoint2: CGPointMake(frame.minX + 73.54, frame.minY + 341.01))
        pickedImageRectanglePath.addCurveToPoint(CGPointMake(frame.minX + 76.02, frame.minY + 365), controlPoint1: CGPointMake(frame.minX + 66.87, frame.minY + 361.66), controlPoint2: CGPointMake(frame.minX + 73.09, frame.minY + 362.98))
        pickedImageRectanglePath.addCurveToPoint(CGPointMake(frame.minX + 76.02, frame.minY + 375), controlPoint1: CGPointMake(frame.minX + 77.8, frame.minY + 366.23), controlPoint2: CGPointMake(frame.minX + 77.3, frame.minY + 371.5))
        pickedImageRectanglePath.addCurveToPoint(CGPointMake(frame.minX + 52.01, frame.minY + 401), controlPoint1: CGPointMake(frame.minX + 71.72, frame.minY + 386.77), controlPoint2: CGPointMake(frame.minX + 60.17, frame.minY + 393.16))
        pickedImageRectanglePath.addCurveToPoint(CGPointMake(frame.minX + 25, frame.minY + 428), controlPoint1: CGPointMake(frame.minX + 37.37, frame.minY + 415.08), controlPoint2: CGPointMake(frame.minX + 25.16, frame.minY + 426.28))
        pickedImageRectanglePath.addCurveToPoint(CGPointMake(frame.minX + 25, frame.minY + 484.5), controlPoint1: CGPointMake(frame.minX + 24, frame.minY + 439), controlPoint2: CGPointMake(frame.minX + 25, frame.minY + 484.5))
        pickedImageRectanglePath.addLineToPoint(CGPointMake(frame.minX + 111.03, frame.minY + 484.5))
        pickedImageRectanglePath.addLineToPoint(CGPointMake(frame.minX + 111.03, frame.minY + 461))
        pickedImageRectanglePath.addLineToPoint(CGPointMake(frame.minX + 142.05, frame.minY + 461))
        pickedImageRectanglePath.addLineToPoint(CGPointMake(frame.minX + 142.05, frame.minY + 484.5))
        pickedImageRectanglePath.addLineToPoint(CGPointMake(frame.minX + 356.13, frame.minY + 484.5))
        pickedImageRectanglePath.addLineToPoint(CGPointMake(frame.minX + 356.13, frame.minY + 461))
        pickedImageRectanglePath.addLineToPoint(CGPointMake(frame.minX + 386.14, frame.minY + 461))
        pickedImageRectanglePath.addLineToPoint(CGPointMake(frame.minX + 385.78, frame.minY + 484.5))
        pickedImageRectanglePath.addLineToPoint(CGPointMake(frame.minX + 424.16, frame.minY + 485))
        pickedImageRectanglePath.addCurveToPoint(CGPointMake(frame.minX + 474.18, frame.minY + 485), controlPoint1: CGPointMake(frame.minX + 424.16, frame.minY + 485), controlPoint2: CGPointMake(frame.minX + 448.17, frame.minY + 485))
        pickedImageRectanglePath.addCurveToPoint(CGPointMake(frame.minX + 492.19, frame.minY + 485), controlPoint1: CGPointMake(frame.minX + 477.34, frame.minY + 485), controlPoint2: CGPointMake(frame.minX + 492.19, frame.minY + 485))
        pickedImageRectanglePath.addCurveToPoint(CGPointMake(frame.minX + 492.19, frame.minY + 450), controlPoint1: CGPointMake(frame.minX + 492.19, frame.minY + 485), controlPoint2: CGPointMake(frame.minX + 493.02, frame.minY + 459.33))
        pickedImageRectanglePath.addCurveToPoint(CGPointMake(frame.minX + 492.19, frame.minY + 436), controlPoint1: CGPointMake(frame.minX + 491.88, frame.minY + 446.52), controlPoint2: CGPointMake(frame.minX + 492.19, frame.minY + 441))
        pickedImageRectanglePath.addCurveToPoint(CGPointMake(frame.minX + 481.74, frame.minY + 430.9), controlPoint1: CGPointMake(frame.minX + 492.19, frame.minY + 434.16), controlPoint2: CGPointMake(frame.minX + 484.54, frame.minY + 432.65))
        pickedImageRectanglePath.addCurveToPoint(CGPointMake(frame.minX + 474.18, frame.minY + 422), controlPoint1: CGPointMake(frame.minX + 477.77, frame.minY + 428.42), controlPoint2: CGPointMake(frame.minX + 474.02, frame.minY + 422.63))
        pickedImageRectanglePath.addCurveToPoint(CGPointMake(frame.minX + 455.17, frame.minY + 378), controlPoint1: CGPointMake(frame.minX + 477.22, frame.minY + 409.64), controlPoint2: CGPointMake(frame.minX + 453.71, frame.minY + 388.64))
        pickedImageRectanglePath.addCurveToPoint(CGPointMake(frame.minX + 451.91, frame.minY + 354.87), controlPoint1: CGPointMake(frame.minX + 456.2, frame.minY + 370.54), controlPoint2: CGPointMake(frame.minX + 454.26, frame.minY + 360.98))
        pickedImageRectanglePath.addCurveToPoint(CGPointMake(frame.minX + 444.17, frame.minY + 342), controlPoint1: CGPointMake(frame.minX + 449.29, frame.minY + 348.03), controlPoint2: CGPointMake(frame.minX + 444.17, frame.minY + 343.01))
        pickedImageRectanglePath.addCurveToPoint(CGPointMake(frame.minX + 442.99, frame.minY + 325.26), controlPoint1: CGPointMake(frame.minX + 444.17, frame.minY + 339.84), controlPoint2: CGPointMake(frame.minX + 443.25, frame.minY + 333.3))
        pickedImageRectanglePath.addCurveToPoint(CGPointMake(frame.minX + 442.91, frame.minY + 308.69), controlPoint1: CGPointMake(frame.minX + 442.81, frame.minY + 320.1), controlPoint2: CGPointMake(frame.minX + 443.49, frame.minY + 314.32))
        pickedImageRectanglePath.addCurveToPoint(CGPointMake(frame.minX + 439.17, frame.minY + 290), controlPoint1: CGPointMake(frame.minX + 442.19, frame.minY + 301.75), controlPoint2: CGPointMake(frame.minX + 439.53, frame.minY + 295.04))
        pickedImageRectanglePath.addCurveToPoint(CGPointMake(frame.minX + 440.17, frame.minY + 281), controlPoint1: CGPointMake(frame.minX + 438.79, frame.minY + 284.83), controlPoint2: CGPointMake(frame.minX + 440.17, frame.minY + 281))
        pickedImageRectanglePath.addLineToPoint(CGPointMake(frame.minX + 440.17, frame.minY + 253))
        pickedImageRectanglePath.addCurveToPoint(CGPointMake(frame.minX + 433.16, frame.minY + 239), controlPoint1: CGPointMake(frame.minX + 440.17, frame.minY + 253), controlPoint2: CGPointMake(frame.minX + 435.08, frame.minY + 246.76))
        pickedImageRectanglePath.addCurveToPoint(CGPointMake(frame.minX + 432.52, frame.minY + 221.94), controlPoint1: CGPointMake(frame.minX + 431.25, frame.minY + 231.24), controlPoint2: CGPointMake(frame.minX + 432.52, frame.minY + 221.94))
        pickedImageRectanglePath.addLineToPoint(CGPointMake(frame.minX + 426.7, frame.minY + 206.44))
        pickedImageRectanglePath.addLineToPoint(CGPointMake(frame.minX + 424.16, frame.minY + 188))
        pickedImageRectanglePath.addCurveToPoint(CGPointMake(frame.minX + 415.16, frame.minY + 181), controlPoint1: CGPointMake(frame.minX + 424.16, frame.minY + 188), controlPoint2: CGPointMake(frame.minX + 420.26, frame.minY + 188.2))
        pickedImageRectanglePath.addCurveToPoint(CGPointMake(frame.minX + 407.15, frame.minY + 166), controlPoint1: CGPointMake(frame.minX + 412.67, frame.minY + 177.49), controlPoint2: CGPointMake(frame.minX + 409.78, frame.minY + 169.61))
        pickedImageRectanglePath.addCurveToPoint(CGPointMake(frame.minX + 400.15, frame.minY + 160), controlPoint1: CGPointMake(frame.minX + 405.05, frame.minY + 163.11), controlPoint2: CGPointMake(frame.minX + 401.92, frame.minY + 163.27))
        pickedImageRectanglePath.addCurveToPoint(CGPointMake(frame.minX + 391.15, frame.minY + 132), controlPoint1: CGPointMake(frame.minX + 395.97, frame.minY + 152.29), controlPoint2: CGPointMake(frame.minX + 394.21, frame.minY + 141.91))
        pickedImageRectanglePath.addCurveToPoint(CGPointMake(frame.minX + 383.14, frame.minY + 114), controlPoint1: CGPointMake(frame.minX + 389.24, frame.minY + 125.83), controlPoint2: CGPointMake(frame.minX + 386.7, frame.minY + 120.62))
        pickedImageRectanglePath.addCurveToPoint(CGPointMake(frame.minX + 375.89, frame.minY + 107.26), controlPoint1: CGPointMake(frame.minX + 380.95, frame.minY + 109.91), controlPoint2: CGPointMake(frame.minX + 378.68, frame.minY + 111.19))
        pickedImageRectanglePath.addCurveToPoint(CGPointMake(frame.minX + 369.14, frame.minY + 98), controlPoint1: CGPointMake(frame.minX + 373.7, frame.minY + 104.17), controlPoint2: CGPointMake(frame.minX + 371.45, frame.minY + 101.07))
        pickedImageRectanglePath.addCurveToPoint(CGPointMake(frame.minX + 339.13, frame.minY + 59), controlPoint1: CGPointMake(frame.minX + 359.39, frame.minY + 85.01), controlPoint2: CGPointMake(frame.minX + 351.19, frame.minY + 69.37))
        pickedImageRectanglePath.addCurveToPoint(CGPointMake(frame.minX + 308.11, frame.minY + 45), controlPoint1: CGPointMake(frame.minX + 330.74, frame.minY + 51.79), controlPoint2: CGPointMake(frame.minX + 318.68, frame.minY + 47.23))
        pickedImageRectanglePath.addCurveToPoint(CGPointMake(frame.minX + 292.11, frame.minY + 43), controlPoint1: CGPointMake(frame.minX + 302.2, frame.minY + 43.75), controlPoint2: CGPointMake(frame.minX + 298.1, frame.minY + 44.17))
        pickedImageRectanglePath.addCurveToPoint(CGPointMake(frame.minX + 255.09, frame.minY + 35), controlPoint1: CGPointMake(frame.minX + 278.94, frame.minY + 40.43), controlPoint2: CGPointMake(frame.minX + 266.27, frame.minY + 35))
        pickedImageRectanglePath.addCurveToPoint(CGPointMake(frame.minX + 227.43, frame.minY + 36.29), controlPoint1: CGPointMake(frame.minX + 245.75, frame.minY + 35), controlPoint2: CGPointMake(frame.minX + 234.2, frame.minY + 34.95))
        pickedImageRectanglePath.addCurveToPoint(CGPointMake(frame.minX + 218.17, frame.minY + 40.43), controlPoint1: CGPointMake(frame.minX + 222.75, frame.minY + 37.22), controlPoint2: CGPointMake(frame.minX + 222.44, frame.minY + 39.33))
        pickedImageRectanglePath.addCurveToPoint(CGPointMake(frame.minX + 207.07, frame.minY + 43), controlPoint1: CGPointMake(frame.minX + 214.71, frame.minY + 41.32), controlPoint2: CGPointMake(frame.minX + 210.38, frame.minY + 42.21))
        pickedImageRectanglePath.addCurveToPoint(CGPointMake(frame.minX + 182.51, frame.minY + 49.66), controlPoint1: CGPointMake(frame.minX + 198.69, frame.minY + 45), controlPoint2: CGPointMake(frame.minX + 188.55, frame.minY + 47.29))
        pickedImageRectanglePath.addCurveToPoint(CGPointMake(frame.minX + 167.08, frame.minY + 58.79), controlPoint1: CGPointMake(frame.minX + 174.66, frame.minY + 52.73), controlPoint2: CGPointMake(frame.minX + 171.05, frame.minY + 55.94))
        pickedImageRectanglePath.addCurveToPoint(CGPointMake(frame.minX + 156.05, frame.minY + 68), controlPoint1: CGPointMake(frame.minX + 159.86, frame.minY + 63.97), controlPoint2: CGPointMake(frame.minX + 156.05, frame.minY + 68))
        pickedImageRectanglePath.addCurveToPoint(CGPointMake(frame.minX + 153.05, frame.minY + 82), controlPoint1: CGPointMake(frame.minX + 156.05, frame.minY + 68), controlPoint2: CGPointMake(frame.minX + 156.86, frame.minY + 79.82))
        pickedImageRectanglePath.closePath()
        CGContextSaveGState(context)
        CGContextSetShadowWithColor(context, outerShadow.shadowOffset, outerShadow.shadowBlurRadius, (outerShadow.shadowColor as! UIColor).CGColor)
        CGContextBeginTransparencyLayer(context, nil)
        CGContextSaveGState(context)
        pickedImageRectanglePath.addClip()
        pickedImage.drawInRect(CGRectMake(floor(pickedImageRectangleRect.minX + 0.5), floor(pickedImageRectangleRect.minY + 0.5), pickedImage.size.width, pickedImage.size.height))
        CGContextRestoreGState(context)
        CGContextEndTransparencyLayer(context)
        CGContextRestoreGState(context)
    }

    //// Generated Images

    public class func imageOfSH2(frame frame: CGRect = CGRectMake(0, 0, 515, 533), pickedImage: UIImage = UIImage()) -> UIImage {
        UIGraphicsBeginImageContextWithOptions(frame.size, false, 0)
            SH2_PhotoFrame.drawSH2(frame: CGRectMake(0, 0, frame.size.width, frame.size.height), pickedImage: pickedImage)

        let imageOfSH2 = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()

        return imageOfSH2
    }

}
