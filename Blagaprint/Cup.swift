//
//  Cup.swift
//  Blagaprint
//
//  Created by Ivan Magda on 15.12.15.
//  Copyright (c) 2015 Blagaprint. All rights reserved.
//
//  Generated by PaintCode (www.paintcodeapp.com)
//



import UIKit

public class Cup : NSObject {

    //// Drawing Methods

    public class func drawCupLeft(frame frame: CGRect = CGRectMake(0, 0, 320, 320)) {
        //// General Declarations
        let context = UIGraphicsGetCurrentContext()


        //// Image Declarations
        let cupLeftImage = UIImage(named: "cupLeftImage.jpg")!

        //// Rectangle Drawing
        let rectangleRect = CGRectMake(frame.minX, frame.minY, 320, 320)
        let rectanglePath = UIBezierPath(rect: rectangleRect)
        CGContextSaveGState(context)
        rectanglePath.addClip()
        cupLeftImage.drawInRect(CGRectMake(floor(rectangleRect.minX + 0.5), floor(rectangleRect.minY + 0.5), cupLeftImage.size.width, cupLeftImage.size.height))
        CGContextRestoreGState(context)
    }

    public class func drawCupRight(frame frame: CGRect = CGRectMake(10, 15, 320, 320)) {
        //// General Declarations
        let context = UIGraphicsGetCurrentContext()


        //// Image Declarations
        let cupRightImage = UIImage(named: "cupRightImage.jpg")!

        //// Rectangle Drawing
        let rectangleRect = CGRectMake(frame.minX, frame.minY, 320, 320)
        let rectanglePath = UIBezierPath(rect: rectangleRect)
        CGContextSaveGState(context)
        rectanglePath.addClip()
        cupRightImage.drawInRect(CGRectMake(floor(rectangleRect.minX + 0.5), floor(rectangleRect.minY + 0.5), cupRightImage.size.width, cupRightImage.size.height))
        CGContextRestoreGState(context)
    }

    //// Generated Images

    public class func imageOfCupLeft(frame frame: CGRect = CGRectMake(0, 0, 320, 320)) -> UIImage {
        UIGraphicsBeginImageContextWithOptions(frame.size, false, 0)
            Cup.drawCupLeft(frame: CGRectMake(0, 0, frame.size.width, frame.size.height))

        let imageOfCupLeft = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()

        return imageOfCupLeft
    }

    public class func imageOfCupRight(frame frame: CGRect = CGRectMake(0, 0, 320, 320)) -> UIImage {
        UIGraphicsBeginImageContextWithOptions(frame.size, false, 0)
            Cup.drawCupRight(frame: CGRectMake(0, 0, frame.size.width, frame.size.height))

        let imageOfCupRight = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()

        return imageOfCupRight
    }

}
