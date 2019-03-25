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
        view.backgroundColor = UIColor.lightGray
        return view
    }()
    
    public let horizontalLineView: UIView = {
        let view: UIView = UIView()
        view.backgroundColor = UIColor.lightGray
        return view
    }()
    
    public let endDotView: UIView = {
        let view: UIView = UIView()
        view.backgroundColor = UIColor.lightGray
        return view
    }()
    
    private lazy var horizontalLayer: CALayer = {
        let layer: CALayer = CALayer()
        layer.backgroundColor = AppUI.Color.blue.cgColor
        layer.frame = CGRect(
            x: self.horizontalLineView.bounds.minX,
            y: self.horizontalLineView.bounds.minY,
            width: 0.0,
            height: self.horizontalLineView.frame.height
        )
        return layer
    }()
    
    public let dotSize: CGFloat = 20.0
    
    // MARK: Stored Properties
    private var horizontalLineWidth: Constraint!
    private var horizontalLayerWidth: CGFloat = 0.0
    private var dotViewHeight: Constraint!
    private var dotViewWidth: Constraint!
    // MARK: Initializer
    public override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.subviews(forAutoLayout: [
            self.dotView, self.horizontalLineView
        ])
        
        self.dotView.snp.remakeConstraints { [unowned self] (make: ConstraintMaker) -> Void in
            make.top.equalToSuperview()
            make.leading.equalToSuperview()
            self.dotViewHeight = make.height.equalTo(self.dotSize).constraint
            self.dotViewWidth =  make.width.equalTo(self.dotSize).constraint
        }
        
        self.horizontalLineView.snp.remakeConstraints { [unowned self] (make: ConstraintMaker) -> Void in
            make.leading.equalTo(self.dotView.snp.trailing)
            make.trailing.equalToSuperview()
            make.centerY.equalTo(self.dotView)
            make.height.equalTo(2.5)
        }
    }
    
    public override func layoutSubviews() {
        super.layoutSubviews()        
        self.dotView.setRadius()
        self.endDotView.setRadius()
        
        self.horizontalLineView.layer.addSublayer(self.horizontalLayer)
    }
    
    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: Public API's
extension StepComponentView {
    public func setBarWith(to width: CGFloat) {
        self.horizontalLineWidth.update(offset: width)
    }
    
    public func withEnd() {
        self.subview(forAutoLayout: self.endDotView)
        self.endDotView.snp.remakeConstraints { [unowned self] (make: ConstraintMaker) -> Void in
            make.top.equalToSuperview()
            make.leading.equalTo(self.horizontalLineView.snp.trailing)
            self.dotViewHeight = make.height.equalTo(self.dotSize).constraint
            self.dotViewWidth = make.width.equalTo(self.dotSize).constraint
        }
    }
    
    func setPassed(){
        UIView.animate(withDuration: 2.0) { [weak self] in
            guard let self = self else { return }
            self.horizontalLayer.frame.size.width = self.horizontalLineView.frame.width
        }
        
        self.dotView.backgroundColor = AppUI.Color.blue
        self.endDotView.backgroundColor = AppUI.Color.blue
    }
    
    public func setCurrent() {
        self.dotView.backgroundColor = AppUI.Color.blue
        
//        UIView.animate(withDuration: 2.0) { [weak self] in
//            guard let self = self else { return }
//            self.dotViewWidth.update(offset: 20.0)
//            self.dotViewHeight.update(offset: 20.0)
//        }
                
    }
    
}
