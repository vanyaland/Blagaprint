//
//  ViewController.swift
//  Blagaprint
//
//  Created by Ivan Magda on 27.09.15.
//  Copyright © 2015 Blagaprint. All rights reserved.
//

import UIKit
import CoreData

/// CategoryTableViewCell height value.
private let categoryTableViewCellHeight: CGFloat = 200.0

/// Height for tableView header view.
private let headerViewHeight: CGFloat = 44.0

class MainQueryTableViewController: PFQueryTableViewController {
    // MARK: - Types
    
    private enum SegueIdentifier: String {
        case PhoneCaseConstructor
        case FrameConstructor
        case PlateConstructor
    }
    
    private enum CellIdentifier: String {
        case CategoryCell
    }
    
    // MARK: - Properties
    
    var parse: Parse?
    
    // MARK: - Init
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        // The className to query on
        self.parseClassName = CategoryParseClassName
        
        // Whether the built-in pull-to-refresh is enabled
        self.pullToRefreshEnabled = true
        
        // Whether the built-in pagination is enabled
        self.paginationEnabled = false
    }
    
    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.rowHeight = categoryTableViewCellHeight
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    // MARK: - Navigation
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == SegueIdentifier.PhoneCaseConstructor.rawValue {
            print("Segue to PhoneCase")
        } else if segue.identifier == SegueIdentifier.FrameConstructor.rawValue {
            print("Segue to FrameConstructor")
        } else if segue.identifier == SegueIdentifier.PlateConstructor.rawValue {
            print("Segue to PlateConstructor")
        }
    }
    
    // MARK: - PFQueryTableViewController -
    
    // MARK: Responding to Events
    
    /// Called when objects will loaded from Parse.
    override func objectsWillLoad() {
        super.objectsWillLoad()
        
        print("Objects will load.")
    }
    
    /// Called when objects have loaded from Parse.
    override func objectsDidLoad(error: NSError?) {
        super.objectsDidLoad(error)
        
        if let error = error {
            print("Error with objects downloading: \(error.localizedDescription)")
        } else {
            print("Objects have loaded from Parse.")
        }
    }
    
    // MARK: Querying
    
    /// Construct custom PFQuery to get the objects.
    override func queryForTable() -> PFQuery {
        let query = PFQuery(className: self.parseClassName!)
        
        query.orderByDescending(Category.CoderKeys.name.rawValue)
        
        return query
    }
    
    // MARK: Data Source Methods
    
    /// Customize each cell given a PFObject that is loaded.
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath, object: PFObject?) -> PFTableViewCell? {
        let categoryCell = self.tableView.dequeueReusableCellWithIdentifier(CellIdentifier.CategoryCell.rawValue) as! CategoryTableViewCell
        
        if let objects = self.objects {
            let category = objects[indexPath.section] as! Category
            categoryCell.categoryImageView?.file = category.image
            categoryCell.categoryImageView?.loadInBackground()
        }
        
        return categoryCell
    }

    // MARK: - UITableView -
    // MARK: UITableViewDataSource
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        if let objects = self.objects {
            return objects.count
        } else {
            return 0
        }
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let headerView = UIView(frame: CGRectMake(0.0, 0.0, CGRectGetWidth(tableView.bounds), headerViewHeight))
        headerView.backgroundColor = AppAppearance.AppColors.tuna
        
        let labelHeight: CGFloat = 18.0
        let labelLeadingSpace: CGFloat = 15.0
        let labelTrailingSpace: CGFloat = labelLeadingSpace + 8.0
        let label = UILabel(frame: CGRectMake(labelLeadingSpace, CGRectGetHeight(headerView.bounds) / 2 - labelHeight / 2.0, CGRectGetWidth(tableView.bounds) - labelTrailingSpace, labelHeight))
        let category = self.objects![section]
        label.text = category.name
        label.textColor = UIColor.whiteColor()
        
        headerView.addSubview(label)
        
        return headerView
    }

    // MARK: UITableViewDelegate

    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let category = self.objects![indexPath.section] as! Category
        switch category.getType() {
        case .cases:
            self.performSegueWithIdentifier(SegueIdentifier.PhoneCaseConstructor.rawValue, sender: nil)
            return
        case .frames:
            self.performSegueWithIdentifier(SegueIdentifier.FrameConstructor.rawValue, sender: nil)
            return
        case .plates:
            self.performSegueWithIdentifier(SegueIdentifier.PlateConstructor.rawValue, sender: nil)
            return
        default:
            break
        }
    }
    
    override func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return headerViewHeight
    }
}
