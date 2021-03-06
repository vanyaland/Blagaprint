//
//  TShirt.swift
//  Blagaprint
//
//  Created by Иван Магда on 07.02.16.
//  Copyright © 2016 Blagaprint. All rights reserved.
//

import Foundation
import UIKit

class TShirt {
    
    //--------------------------------------
    // MARK: - Types
    //--------------------------------------
    
    struct TShirtImageLocation: OptionSetType {
        let rawValue: Int
        
        static let None   = TShirtImageLocation(rawValue: -1)
        static let Front  = TShirtImageLocation(rawValue: 1 << 0)
        static let Behind = TShirtImageLocation(rawValue: 1 << 1)
    }
    
    //--------------------------------------
    // MARK: - Properties
    //--------------------------------------
    
    /// Size of picked image.
    private let pickedImageSize = CGSize(width: 120.0, height: 170.0)
    
    /// T-Shirt image.
    var image: UIImage
    
    /// T-Shirt image location.
    var imageLocation: TShirtImageLocation = .Front
    
    /// Show or hide the image.
    var isImageVisible = false
    
    /// T-Shirt color.
    var color = UIColor.whiteColor()
    
    //--------------------------------------
    // MARK: - Init
    //--------------------------------------
    
    init(image: UIImage = UIImage(), isImageVisible visible: Bool = false, imageLocation: TShirtImageLocation = .Front, color: UIColor = UIColor.whiteColor()) {
        self.image = image
        self.imageLocation = imageLocation
        self.color = color
        isImageVisible = visible
    }
    
    //--------------------------------------
    // MARK: - T-Shirt Image
    //--------------------------------------
    
    func tShirtImages() -> [UIImage] {
        let scaledImage = (isImageVisible == true ? image.scaledImageToSize(pickedImageSize) : UIImage())
        
        let showImageInFront = imageLocation.contains(.Front)  && !imageLocation.contains(.None)
        let showImageBehind  = imageLocation.contains(.Behind) && !imageLocation.contains(.None)
        
        let frontImage = TShirtCanvas.imageOfFront(tshirtColor: color, image: (showImageInFront == true ? scaledImage : UIImage()), imageVisible: isImageVisible)
        let behindImage = TShirtCanvas.imageOfBack(tshirtColor: color, image: (showImageBehind == true ? scaledImage : UIImage()), imageVisible: isImageVisible)
        
        return [frontImage, behindImage]
    }

}