//
//  WREventCell.swift
//  Pods
//
//  Created by wayfinder on 2017. 4. 30..
//
//

import UIKit

class WREventCell: UICollectionViewCell {
    @IBOutlet weak var borderView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    
    var contentColor: UIColor = UIColor.blue
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = CGSize(width: 0, height: 4)
        layer.shadowRadius = 5
        layer.shadowOpacity = 0
        
        updateColors()
    }
    
    override var isSelected: Bool {
        didSet {
            if isSelected && isSelected != oldValue {
                UIView.animate(withDuration: TimeInterval(0.2), animations: { [unowned self] in
                    self.transform = CGAffineTransform.init(scaleX: 1.025, y: 1.025)
                    self.layer.shadowOpacity = 0.2
                    }, completion: { [unowned self] _ in
                        self.transform = CGAffineTransform.identity
                })
            } else if isSelected {
                layer.shadowOpacity = 0.2
            } else {
                layer.shadowOpacity = 0.0
            }
            updateColors()
        }
    }
    
    var event: WREvent? {
        didSet {
            if let event = event {
                titleLabel.font = UIFont(name: "Montserrat-Light", size: 11)
                titleLabel.text = event.title
                contentColor = event.color
                updateColors()
            }
        }
    }
    
    func updateColors() {
        contentView.backgroundColor = backgroundColorHighlighted(isSelected)
        //borderView.backgroundColor = borderColor()
        //titleLabel.textColor = textColorHighlighted(isSelected)
    }
    
    func backgroundColorHighlighted(_ selected: Bool) -> UIColor {
        return selected ? contentColor.withAlphaComponent(0.9) : contentColor.withAlphaComponent(0.6)
    }
    
    func textColorHighlighted(_ selected: Bool) -> UIColor {
        return selected ? UIColor.white : UIColor(hexString: "21729c")!
    }
    
    func borderColor() -> UIColor {
        return self.backgroundColorHighlighted(false).withAlphaComponent(1.0)
    }
}

