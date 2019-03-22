//
//  StepComponentView.swift
//  DotStepIndicator
//
//  Created by Novare Account on 22/03/2019.
//  Copyright © 2019 alvin joseph valdez. All rights reserved.
//

import UIKit
import SnapKit

public class StepComponentView: UIView {
    
    // MARK: Subviews
    public let dotView: UIView = {
        let view: UIView = UIView()
        view.backgroundColor = AppUI.Color.blue
        return view
    }()
    
    public let horizontalLineView: UIView = {
        let view: UIView = UIView()
        view.backgroundColor = AppUI.Color.blue
        return view
    }()
    
    public let endDotView: UIView = {
        let view: UIView = UIView()
        view.backgroundColor = AppUI.Color.blue
        return view
    }()
    
    // MARK: Stored Properties
    public var horizontalLineWidth: Constraint!
    
    
    // MARK: Initializer
    public override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.subviews(forAutoLayout: [
            self.dotView, self.horizontalLineView
        ])
        
        self.dotView.snp.remakeConstraints { (make: ConstraintMaker) -> Void in
            make.top.equalToSuperview()
            make.leading.equalToSuperview()
            make.height.equalTo(20.0)
            make.width.equalTo(20.0)
        }
        
        self.horizontalLineView.snp.remakeConstraints { [unowned self] (make: ConstraintMaker) -> Void in
            make.leading.equalTo(self.dotView.snp.trailing)
            make.centerY.equalTo(self.dotView)
            make.height.equalTo(5.0)
            self.horizontalLineWidth = make.width.equalTo(100.0).constraint
        }
        
    }
    
    public override func layoutSubviews() {
        super.layoutSubviews()        
        self.dotView.setRadius()
        self.endDotView.setRadius()
    }
    
    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: Public API's
extension StepComponentView {
    public func setBarWidth(to width: CGFloat) {
        print("setBarWidth \(width)")
        
        self.horizontalLineWidth.update(offset: width).activate()
        self.horizontalLineView.setNeedsLayout()
    }
    
    public func withEnd() {
        self.subview(forAutoLayout: self.endDotView)
        self.endDotView.snp.remakeConstraints { (make: ConstraintMaker) -> Void in
            make.top.equalToSuperview()
            make.leading.equalTo(self.horizontalLineView.snp.trailing)
            make.height.equalTo(20.0)
            make.width.equalTo(20.0)
        }
    }
}
