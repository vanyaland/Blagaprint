//
//  CupViewController.swift
//  Blagaprint
//
//  Created by Иван Магда on 08.12.15.
//  Copyright © 2015 Blagaprint. All rights reserved.
//

import UIKit

class CategoryItemViewController: UIViewController {
    
    //--------------------------------------
    // MARK: - Types
    //--------------------------------------
    
    private enum SegueIdentifier: String {
        case SelectDevice
        case ColorPicking
        case TextEditing
        case PhotoLibrary
        case PickType
    }
    
    /// Picked image sizes for filling in the item object.
    private struct PickedImageSize {
        static let Cup = CGSizeMake(197.0, 225.0)
        static let Plate = CGSizeMake(210.0, 210.0)
    }
    
    
    //--------------------------------------
    // MARK: - Properties -
    //--------------------------------------
    
    
    //--------------------------------------
    // MARK: Views
    //--------------------------------------
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var placeholderView: UIView!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var pageControl: UIPageControl!
    
    @IBOutlet weak var pickImageView: UIView!
    @IBOutlet weak var pickColorView: UIView!
    @IBOutlet weak var pickTypeView: UIView!
    @IBOutlet weak var pickTypeViewDetailLabel: UILabel!
    @IBOutlet weak var pickTypeViewDetailDisclosureImageView: UIImageView!
    @IBOutlet weak var pickedColorView: UIView!
    @IBOutlet weak var addToBagButton: UIButton!
    
    //--------------------------------------
    // MARK: LayoutConstraints
    //--------------------------------------
    
    @IBOutlet weak var placeholderViewHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var pageControlVerticalSpaceConstraint: NSLayoutConstraint!
    @IBOutlet weak var pickImageViewHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var pickColorViewHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var pickTypeViewHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var pickColorViewBottomSpace: NSLayoutConstraint!
    
    //--------------------------------------
    // MARK: Dimension Values
    //--------------------------------------
    
    /// Height value of view that contains UICollectionView.
    private let placeholderViewDefaultHeightValue: CGFloat = 320.0
    
    /// Height value for views that use for trigger an action.
    private let actionViewHeightValue: CGFloat = 44.0
    
    /// Minimal bottom space value.
    private let minimalSpaceValue: CGFloat = 16
    
    //--------------------------------------
    // MARK: Parse
    //--------------------------------------
    
    var parseCentral: ParseCentral?
    
    /// Category of the presenting item.
    var category: Category!
    
    /// Loaded category items of the parent category.
    private var categoryItems: [CategoryItem]?
    
    //--------------------------------------
    // MARK: Other
    //--------------------------------------
    
    /// Image picker controller to let us take/pick photo.
    private var imagePickerController: BLImagePickerController?
    
    /// Picked image by the user.
    private var pickedImage: UIImage?
    
    // Data source for collection view.
    private var images = [UIImage]()
    
    /// Picked color by the user.
    private var pickedColor = UIColor.whiteColor()
    
    /// True if user successfully added item to bag.
    private var didAddItemToBag = false
    
    private var pickedTypeIndex = 0
    
    //--------------------------------------
    // MARK: - View Life Cycle -
    //--------------------------------------
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = self.category.titleName
        
        (self.collectionView as UIScrollView).delegate = self
        
        // Working with data.
        loadCategoryItems()
        reloadData()
        
        // Setup.
        setupImagePickerController()
        setupPickedColorView()
        setupAddToBagButton()
        
        addGestureRecognizers()
        
        self.pickTypeViewDetailLabel.text = nil
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        setupScrollView()
    }
    
    //--------------------------------------
    // MARK: - Navigation
    //--------------------------------------
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == SegueIdentifier.ColorPicking.rawValue {
            let navigationController = segue.destinationViewController as! UINavigationController
            
            let colorPickingVC = navigationController.topViewController as! SelectBackgroundCollectionViewController!
            colorPickingVC.selectedColor = pickedColor
            
            colorPickingVC.didSelectColorCompletionHandler = { color in
                self.pickedColor = color
                self.pickedColorView.backgroundColor = color
                self.pickedColorViewUpdateBorderLayer()
            }
        } else if segue.identifier == SegueIdentifier.PickType.rawValue {
            let pickTypeTableViewController = segue.destinationViewController as! PickTypeTableViewController
            
            pickTypeTableViewController.dataSource = self
            pickTypeTableViewController.delegate = self
            
            pickTypeTableViewController.originalTypeName = categoryItems![pickedTypeIndex].name
        }
    }
    
    //--------------------------------------
    // MARK: - Private Helper Methods -
    //--------------------------------------
    
    private func animateViewSelection(view: UIView, callback: (() -> Void)?) {
        UIView.animateWithDuration(0.25, delay: 0.0, options: UIViewAnimationOptions.CurveEaseInOut, animations: {
            view.backgroundColor = UIColor.lightGrayColor().colorWithAlphaComponent(0.2)
            }) { finished in
                if finished {
                    UIView.animateWithDuration(0.25) {
                        view.backgroundColor = UIColor.whiteColor()
                        
                        if let callback = callback {
                            callback()
                        }
                    }
                }
        }
    }
    
    private func goToShoppingCart() {
        if let tabBarController = self.tabBarController {
            tabBarController.selectedIndex = TabItemIndex.ShoppingBagViewController.rawValue
        }
    }
    
    //--------------------------------------
    // MARK: Setup
    //--------------------------------------
    
    private func addGestureRecognizers() {
        let pickImageTapGestureRecognizer = UITapGestureRecognizer(target: self, action: Selector("pickImageDidPressed"))
        self.pickImageView.addGestureRecognizer(pickImageTapGestureRecognizer)
        
        let pickColorTapGestureRecognizer = UITapGestureRecognizer(target: self, action: Selector("pickColorDidPressed"))
        self.pickColorView.addGestureRecognizer(pickColorTapGestureRecognizer)

        let pickTypeTapGestureRecognizer = UITapGestureRecognizer(target: self, action: Selector("pickTypeDidPressed"))
        self.pickTypeView.addGestureRecognizer(pickTypeTapGestureRecognizer)
    }
    
    private func setupImagePickerController() {
        weak var weakSelf = self
        
        self.imagePickerController = BLImagePickerController(rootViewController: self) { pickedImage in
            guard weakSelf != nil else {
                return
            }
            
            weakSelf!.pickedImage = pickedImage
            weakSelf!.reloadData()
        }
    }
    
    private func setupAddToBagButton() {
        self.addToBagButton.layer.insertSublayer(AppAppearance.horizontalGreenGradientLayerForRect(self.addToBagButton.bounds), atIndex: 0)
        
        self.addToBagButton.layer.shadowColor = UIColor.blackColor().colorWithAlphaComponent(0.9).CGColor
        self.addToBagButton.layer.shadowOpacity = 1.0
        self.addToBagButton.layer.shadowOffset = CGSizeZero
        self.addToBagButton.layer.shadowRadius = 3.0
    }
    
    private func setBagActionButtonTitle(title: String) {
        self.addToBagButton?.setTitle(title, forState: .Normal)
    }
    
    private func setupPickedColorView() {
        self.pickedColorView.backgroundColor = self.pickedColor
        self.pickedColorView.layer.cornerRadius = CGRectGetWidth(self.pickedColorView.bounds) / 2.0
        
        pickedColorViewUpdateBorderLayer()
    }
    
    private func pickedColorViewUpdateBorderLayer() {
        self.pickedColorView.layer.borderWidth = 0.0
        var borderColor: UIColor?
        
        if pickedColor == UIColor.whiteColor() {
            borderColor = UIColor.lightGrayColor()
        }
        
        if let borderColor = borderColor {
            self.pickedColorView.layer.borderWidth = 1.0
            self.pickedColorView.layer.borderColor = borderColor.CGColor
        }
    }
    
    private func setupScrollView() {
        //TODO: properly determinate scroll view content size.
        
        if self.navigationController == nil {
            return
        }
        
        // Set placeholder view height
        if self.pageControl.numberOfPages <= 1 {
            self.placeholderViewHeightConstraint.constant = placeholderViewDefaultHeightValue
        } else {
            self.placeholderViewHeightConstraint.constant = placeholderViewDefaultHeightValue + CGRectGetHeight(pageControl.bounds)
        }
        
        setupPickTypeView()
        
        switch self.category.getType() {
        case .phoneCase:
            self.placeholderViewHeightConstraint.constant = placeholderViewDefaultHeightValue
            self.pageControlVerticalSpaceConstraint.constant = -CGRectGetHeight(self.pageControl.bounds)
            
        case .plate, .photoFrame, .keyRing:
            self.pickColorViewHeightConstraint.constant = 0.0
            self.pickColorView.alpha = 0.0
            
        case .cup:
            self.pageControlVerticalSpaceConstraint.constant = -CGRectGetHeight(self.pageControl.bounds)
            self.placeholderViewHeightConstraint.constant = placeholderViewDefaultHeightValue
            
        default:
            self.pickImageViewHeightConstraint.constant = actionViewHeightValue
            self.pickColorViewHeightConstraint.constant = actionViewHeightValue
        }
        
        setPickColorViewBottomSpace()
        
        self.scrollView.layoutIfNeeded()
    }
    
    private func setPickColorViewBottomSpace() {
        let frameHeight = CGRectGetHeight(self.view.bounds)
        let navBarHeight = CGRectGetHeight(self.navigationController!.navigationBar.bounds)
        let statusBarHeight = CGRectGetHeight(UIApplication.sharedApplication().statusBarFrame)
        let placeholderView = self.placeholderViewHeightConstraint.constant
        let pickTypeViewHeight = self.pickTypeViewHeightConstraint.constant
        var pickImageViewHeight = self.pickImageViewHeightConstraint.constant
        
        // If we hide color picking view, then we do not need to include pick image view height.
        if self.pickColorViewHeightConstraint.constant == 0 {
            pickImageViewHeight = 0.0
        }
        
        var space = frameHeight - (statusBarHeight + navBarHeight + placeholderView + pickImageViewHeight + pickTypeViewHeight)
        
        // Check for minimal space.
        if space < minimalSpaceValue {
            space = minimalSpaceValue
        }
        
        self.pickColorViewBottomSpace.constant = space
    }
    
    private func setupPickTypeView() {
        func hidePickTypeView() {
            self.pickTypeViewHeightConstraint.constant = 0.0
            self.pickTypeView.alpha = 0.0
            self.pickTypeViewDetailLabel.text = nil
        }
        
        if let categoryItems = self.categoryItems {
            func setDefaultStateOfPickTypeView() {
                self.pickTypeViewHeightConstraint.constant = actionViewHeightValue
                self.pickTypeView.alpha = 1.0
                self.pickTypeViewDetailLabel.text = categoryItems[pickedTypeIndex].name
            }
            
            // Hide pick type view.
            if categoryItems.count == 0 {
                hidePickTypeView()
            } else if categoryItems.count == 1 {
                setDefaultStateOfPickTypeView()
                self.pickTypeViewDetailDisclosureImageView.image = UIImage()
            } else {
                setDefaultStateOfPickTypeView()
                self.pickTypeViewDetailDisclosureImageView.image = UIImage(named: "MoreThan.png")
            }
        } else {
            hidePickTypeView()
        }
        
        self.scrollView.layoutIfNeeded()
    }
    
    //--------------------------------------
    // MARK: Data
    //--------------------------------------
    
    private func reloadData() {
        reloadImages(pickedImage: pickedImage)
        collectionView.reloadData()
        
        self.pageControl.numberOfPages = images.count
    }
    
    private func reloadImages(pickedImage pickedImage: UIImage?) {
        self.images.removeAll(keepCapacity: true)
        
        // Get category.
        let category = self.category.getType()
        
        // Get catgeory item.
        var categoryItem: CategoryItem? = nil
        if let categoryItems = self.categoryItems where categoryItems.count > 0 {
            categoryItem = categoryItems[pickedTypeIndex]
        }
        
        if let pickedImage = pickedImage {
            switch category {
                
            case .cup:
                // Picked image cropping
                let imageSize = pickedImage.size
                let fortyPercentOfWidth = imageSize.width * 0.4
                
                // Left side cup view.
                let leftSideRect = CGRectMake(0.0, 0.0, fortyPercentOfWidth, imageSize.height)
                let leftCroppedImage = pickedImage.croppedImage(leftSideRect)
                let leftSideImage = leftCroppedImage.resizedImageWithContentMode(.ScaleAspectFill, bounds: PickedImageSize.Cup, interpolationQuality: .High)
                images.append(Cup.imageOfCupLeft(pickedImage: leftSideImage, imageVisible: true))
                
                // Front side cup view.
                let frontSideRect = CGRectMake(CGRectGetWidth(leftSideRect) - (CGRectGetWidth(leftSideRect) * 0.1), 0, fortyPercentOfWidth, imageSize.height)
                let frontCroppedImage = pickedImage.croppedImage(frontSideRect)
                let frontSideImage = frontCroppedImage.resizedImageWithContentMode(.ScaleAspectFill, bounds: PickedImageSize.Cup, interpolationQuality: .High)
                images.append(Cup.imageOfCupFront(pickedImage: frontSideImage, imageVisible: true))
                
                // Right side cup view.
                let rightSideRect = CGRectMake(imageSize.width * 0.6, 0, fortyPercentOfWidth, imageSize.height)
                let rightCroppedImage = pickedImage.croppedImage(rightSideRect)
                let rightSideImage = rightCroppedImage.resizedImageWithContentMode(.ScaleAspectFill, bounds: PickedImageSize.Cup, interpolationQuality: .High)
                images.append(Cup.imageOfCupRight(pickedImage: rightSideImage, imageVisible: true))
                
            case .plate:
                let resizedImage = pickedImage.resizedImageWithContentMode(.ScaleAspectFill, bounds: PickedImageSize.Plate, interpolationQuality: .High)
                self.images = [Plate.imageOfPlateCanvas(image: resizedImage, isPlateImageVisible: true)]
                
            case .photoFrame:
                let frames = PhotoFrame.seedInitialFrames()
                self.images = frames.map() { $0.frameImageWithPickedImage(pickedImage) }
                
            case .keyRing:
                var keyRings: [KeyRing]!
                
                if let categoryItem = categoryItem {
                    keyRings = KeyRing.keyRingsFromCategoryItem(categoryItem)
                } else {
                    keyRings = KeyRing.seedInitialKeyRings()
                }
                
                self.images = keyRings.map() { $0.imageOfKeyRingWithInfo(pickedImage: pickedImage) }
                
            default:
                break
            }
        } else {
            switch category {
                
            case .cup:
                images = [Cup.imageOfCupLeft(), Cup.imageOfCupFront(), Cup.imageOfCupRight()]
                
            case .plate:
                images = [Plate.imageOfPlateCanvas()]
                
            case .photoFrame:
                let frames = PhotoFrame.seedInitialFrames()
                self.images = frames.map() { $0.image }
                
            case .keyRing:
                var keyRings: [KeyRing]!
                
                if let categoryItem = categoryItem {
                    keyRings = KeyRing.keyRingsFromCategoryItem(categoryItem)
                } else {
                    keyRings = KeyRing.seedInitialKeyRings()
                }
                
                self.images = keyRings.map() { $0.image }
                
            default:
                break
            }
        }
    }
    
    //--------------------------------------
    // MARK: Parse
    //--------------------------------------
    
    private func loadCategoryItems() {
        weak var weakSelf = self
        self.category.getItemsInBackgroundWithBlock() { (items, error) in
            if let error = error {
                print(error.localizedDescription)
            } else if let items = items {
                weakSelf?.categoryItems = items
                
                weakSelf?.setupPickTypeView()
                weakSelf?.reloadData()
            }
        }
    }
    
    private func createBagItem() -> BagItem {
        // Create BagItem and save it to Parse.
        let item = BagItem()
        
        if let user = BlagaprintUser.currentUser() {
            item.userId = user.objectId!
        }
        
        item.category = self.category.objectId!
        
        // TODO: check for selection objectId.
        if let categoryItems = self.categoryItems where categoryItems.count > 0 {
            item.categoryItem = categoryItems[pickedTypeIndex].objectId!
        }
        
        // Set user picked image from media/camera.
        if let image = self.pickedImage {
            let imageData = UIImageJPEGRepresentation(image, 0.8)
            if let imageData = imageData {
                if let imageFile = PFFile(data: imageData) {
                    item.image = imageFile
                }
            }
        }
        
        let pickedItemIndex = self.pageControl.currentPage
        
        // Set thumbnail image of item.
        let size = images[pickedItemIndex].size
        let thumbnailData = UIImagePNGRepresentation(images[pickedItemIndex].resizedImage(size, interpolationQuality: .Low))
        if let thumbnailData = thumbnailData {
            if let thumbnailFile = PFFile(data: thumbnailData) {
                item.thumbnail = thumbnailFile
            }
        }
        
        // Set picked color.
        if self.pickColorViewHeightConstraint.constant != 0.0 {
            let colorInString = BagItem.colorToString(self.pickedColor)
            item.fillColor = colorInString
        }
        
        // TODO: fix with price selection.
        item.price = 500.0
        
        return item
    }
    
    //--------------------------------------
    // MARK: - Actions
    //--------------------------------------
    
    func pickImageDidPressed() {
        animateViewSelection(pickImageView) {
            self.presentImagePickingAlertController()
        }
    }
    
    func pickColorDidPressed() {
        animateViewSelection(pickColorView) {
            self.performSegueWithIdentifier(SegueIdentifier.ColorPicking.rawValue, sender: self)
        }
    }
    
    func pickTypeDidPressed() {
        animateViewSelection(pickTypeView) {
            self.performSegueWithIdentifier(SegueIdentifier.PickType.rawValue, sender: self)
        }
    }
    
    @IBAction func addToBagDidPressed(sender: AnyObject) {
        // Go to shopping cart.
        if didAddItemToBag {
            goToShoppingCart()
            
            // Add item to bag.
        } else if let parseCentral = self.parseCentral {
            parseCentral.saveItem(createBagItem(), success: {
                self.didAddItemToBag = true
                
                let alert = UIAlertController(title: NSLocalizedString("Successfully", comment: ""), message: NSLocalizedString("Item successfully added to bag. Would you like go to shopping cart?", comment: "Saved successfully item alert message"), preferredStyle: .Alert)
                alert.addAction(UIAlertAction(title: NSLocalizedString("Cancel", comment: ""), style: .Cancel, handler: nil))
                alert.addAction(UIAlertAction(title: NSLocalizedString("Go", comment: ""), style: .Default, handler: { (action) in
                    self.goToShoppingCart()
                }))
                
                self.presentViewController(alert, animated: true, completion: nil)
                
                self.setBagActionButtonTitle(NSLocalizedString("Go to Shopping Cart", comment: ""))
                
                ParseCentral.updateBagTabBarItemBadgeValue()
                }, failure: { (error) in
                    self.didAddItemToBag = false
                    
                    self.presentAlertWithTitle(NSLocalizedString("Error", comment: ""), message: error?.localizedDescription ?? NSLocalizedString("An error occured. Please try again later.", comment: "Failure alert message"))
                    
                    self.setBagActionButtonTitle(NSLocalizedString("Add to Bag", comment: ""))
            })
        } else {
            self.didAddItemToBag = false
            
            presentAlertWithTitle(NSLocalizedString("Error", comment: ""), message: NSLocalizedString("An error occured. Please try again later.", comment: "Failure alert message"))
            
            self.setBagActionButtonTitle(NSLocalizedString("Add to Bag", comment: ""))
        }
    }
    
    @IBAction func pageControlDidChangeValue(sender: UIPageControl) {
        let pageWidth = CGRectGetWidth(self.collectionView.bounds)
        let scrollTo = CGPointMake(pageWidth * CGFloat(sender.currentPage), 0)
        
        self.collectionView.setContentOffset(scrollTo, animated: true)
    }
    
    //--------------------------------------
    // MARK: - UIAlertActions
    //--------------------------------------
    
    private func presentAlertWithTitle(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .Alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .Cancel, handler: nil))
        
        self.presentViewController(alert, animated: true, completion: nil)
    }
    
    private func presentImagePickingAlertController() {
        let imagePickingAlertController = UIAlertController(title: NSLocalizedString("Choose an action", comment: "Alert action title"), message: nil, preferredStyle: .ActionSheet)
        
        /// Cancel action
        let cancelAction = UIAlertAction(title: NSLocalizedString("Cancel", comment: "Alert action title"), style: .Cancel) { action in
        }
        imagePickingAlertController.addAction(cancelAction)
        
        /// Photo from gallery(take photo) action
        let photoFromLibrary = UIAlertAction(title: NSLocalizedString("Gallery", comment: "Alert action title"), style: .Default) { action in
            if let imagePickerController = self.imagePickerController {
                imagePickerController.photoFromLibrary()
            }
        }
        imagePickingAlertController.addAction(photoFromLibrary)
        
        /// Shoot photo action
        let shoot = UIAlertAction(title: NSLocalizedString("Take photo", comment: "Alert action title"), style: .Default) { action in
            if let imagePickerController = self.imagePickerController {
                imagePickerController.shootPhoto()
            }
        }
        imagePickingAlertController.addAction(shoot)
        
        /// Clear action
        let clearAction = UIAlertAction(title: NSLocalizedString("Clear", comment: "Alert action title"), style: .Destructive) { action in
            self.pickedImage = nil
            self.reloadData()
        }
        imagePickingAlertController.addAction(clearAction)
        
        self.presentViewController(imagePickingAlertController, animated: true, completion: nil)
    }
    
}

//--------------------------------------
// MARK: - UIScrollViewDelegate -
//--------------------------------------

extension CategoryItemViewController: UIScrollViewDelegate {
    func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
        // Calculate current page.
        if !scrollView.isKindOfClass(UICollectionView) {
            return
        } else {
            let pageWidth: CGFloat = CGRectGetWidth(self.collectionView.bounds)
            let currentPage = self.collectionView.contentOffset.x / pageWidth
            
            //let needToReloadData = pageControl.currentPage != Int(currentPage)
            
            if (0.0 != fmodf(Float(currentPage), 1.0)) {
                self.pageControl.currentPage = Int(currentPage) + 1
            } else {
                self.pageControl.currentPage = Int(currentPage)
            }
        }
    }
}

//--------------------------------------
// MARK: - UICollectionView Extensions -
//--------------------------------------

extension CategoryItemViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    //--------------------------------------
    // MARK: - UICollectionViewDataSource
    //--------------------------------------
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return images.count
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(ImageCollectionViewCell.cellReuseIdentifier, forIndexPath: indexPath) as! ImageCollectionViewCell
        
        let cup = images[indexPath.section]
        cell.imageView?.image = cup
        
        return cell
    }
    
    //--------------------------------------
    // MARK: - UICollectionViewDelegate
    //--------------------------------------
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        print("Did select item at section: \(indexPath.section)")
    }
    
    //--------------------------------------------
    // MARK: - UICollectionViewDelegateFlowLayout
    //--------------------------------------------
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        let width = CGRectGetWidth(collectionView.bounds)
        let height = CGRectGetHeight(collectionView.bounds)
        
        return CGSizeMake(width, height)
    }
}

//--------------------------------------------------------
// MARK: - PickTypeTableViewControllerDataSourceProtocol -
//--------------------------------------------------------

extension CategoryItemViewController: PickTypeTableViewControllerDataSourceProtocol {
    func numberOfSections() -> Int {
        guard let items = self.categoryItems where items.count > 0 else {
            return 0
        }
        
        return 1
    }
    
    func numberOfRowsInSection(section: Int) -> Int {
        return self.categoryItems!.count
    }
    
    func itemForIndexPath(indexPath: NSIndexPath) -> String {
        return self.categoryItems![indexPath.row].name
    }
    
}

//------------------------------------------------------
// MARK: - PickTypeTableViewControllerDelegateProtocol -
//------------------------------------------------------

extension CategoryItemViewController: PickTypeTableViewControllerDelegateProtocol {
    func pickTypeTableViewController(controller: PickTypeTableViewController, didSelectItem item: String, atIndexPath indexPath: NSIndexPath) {
        print("Did select item: \(item) at section: \(indexPath.section) and row: \(indexPath.row)")
        
        self.pickedTypeIndex = indexPath.row
        
        reloadImages(pickedImage: pickedImage)
        self.pageControl.numberOfPages = images.count
        
        setupScrollView()
        reloadData()
    }
}

