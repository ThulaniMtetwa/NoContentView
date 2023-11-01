//
//  ErrorContentView.swift
//  NoContentStates
//
//  Created by Thulani Mtetwa on 2023/10/31.
//

import UIKit

class ErrorContentView: UIView {
    
    @IBOutlet weak var retryButton: UIButton!
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    private var action:(() -> Void)?
    
    convenience init(title:String, description: String, iconImage: UIImage?, handler: (() -> Void)? = nil) {
              self.init(frame: CGRect.zero)
        titleLabel.text = title
        action = handler
        
          }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    private func commonInit() {
        Bundle.main.loadNibNamed(String(describing: ErrorContentView.self), owner: self, options: nil)
        addSubview(contentView)
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    }
    @IBAction func pressed(_ sender: Any) {
        action?()
    }
}
