//
//  ViewController.swift
//  DraggableButton
//
//  Created by Adhitya Surya Pratama on 11/8/17.
//  Copyright © 2017 Adhitya Surya Pratama. All rights reserved.
//

import UIKit
import DragDropiOS

class ViewController: UIViewController {
    
    @IBOutlet weak var button : UIButton!

    @IBOutlet weak var dragDropView: DroppableView!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var tableView: UITableView!
    var dragDropManager : DragDropManager!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        button.center = self.view.center
        button.layer.cornerRadius = 3
        button.layer.masksToBounds = true
        button.backgroundColor = UIColor.yellow
        button.setTitle("NORMAL", for: .normal)
        button.setTitle("Floating", for: .highlighted)
        button.addTarget(self,
                         action: #selector(drag(control:event:)),
                         for: UIControlEvents.touchDragInside)
        button.addTarget(self,
                         action: #selector(drag(control:event:)),
                         for: [UIControlEvents.touchDragExit,
                               UIControlEvents.touchDragOutside])
        dragDropManager = DragDropManager(canvas: self.view, views: [dragDropView])

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @objc func drag(control: UIControl, event: UIEvent) {
        if let center = event.allTouches?.first?.location(in: self.view) {
            control.center = center
        }
    }
}

