//
//  DroppableView.swift
//  DraggableButton
//
//  Created by Adhitya Surya Pratama on 11/8/17.
//  Copyright © 2017 Adhitya Surya Pratama. All rights reserved.
//

import UIKit
import DragDropiOS

class DroppableView : UIView, Droppable{
    var model:Model!
    
    func moveOverStatus(){
        backgroundColor = UIColor.orange.withAlphaComponent(0.5)
    }
    
    func nomoralStatus(){
        backgroundColor = UIColor.white
    }
    
    func selectedStatus(){
        backgroundColor = UIColor.blue.withAlphaComponent(0.5)
    }
    
    func canDropWithDragInfo(_ dragInfo: AnyObject, inRect rect: CGRect) -> Bool {
        if model == nil {
            moveOverStatus()
        }else{
            nomoralStatus()
        }
        return model == nil
    }
    
    func dropOverInfoInRect(_ rect: CGRect) -> AnyObject? {
        debugPrint("View：dropOverInfoInRect：\(rect.origin.x),\(rect.origin.y)_|\(rect.width),\(rect.height)")
        
        return model
    }
    
    func dropComplete(_ dragInfo: AnyObject, dropInfo: AnyObject?, atRect: CGRect) {
        print("drop")
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        backgroundColor = UIColor.white
        layer.borderColor = UIColor.lightGray.cgColor
        layer.borderWidth = 0.5
    }
}
