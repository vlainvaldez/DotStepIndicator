//
//  MainView.swift
//  DotStepIndicator
//
//  Created by alvin joseph valdez on 21/03/2019.
//  Copyright © 2019 alvin joseph valdez. All rights reserved.
//

import UIKit
import SnapKit

public final class MainView: UIView {
    
    public let stepIndicatorContainer: UIView = {
        let view: UIView = UIView()
        view.backgroundColor = UIColor.clear
        return view
    }()
    
    public let dotView1: UIView = {
        let view: UIView = UIView()
        view.backgroundColor = AppUI.Color.blue
        return view
    }()
    
    public let horizontalLineView1: UIView = {
        let view: UIView = UIView()
        view.backgroundColor = AppUI.Color.blue
        return view
    }()
    
    public let dotView2: UIView = {
        let view: UIView = UIView()
        view.backgroundColor = AppUI.Color.blue
        return view
    }()
    
    public let horizontalLineView2: UIView = {
        let view: UIView = UIView()
        view.backgroundColor = AppUI.Color.blue
        return view
    }()
    
    public let dotView3: UIView = {
        let view: UIView = UIView()
        view.backgroundColor = AppUI.Color.blue
        return view
    }()
    
    public let horizontalLineView3: UIView = {
        let view: UIView = UIView()
        view.backgroundColor = AppUI.Color.blue
        return view
    }()
    
    public let dotView4: UIView = {
        let view: UIView = UIView()
        view.backgroundColor = AppUI.Color.blue
        return view
    }()
    
    public let stepComponent: StepComponentView = {
        let view: StepComponentView = StepComponentView()
        return view
    }()
    
    
    // MARK: Stored Properties
    public var horizontalView1Width: Constraint!
    public var horizontalView2Width: Constraint!
    public var horizontalView3Width: Constraint!
    
    // Initializer
    public override init(frame: CGRect) {
        
        super.init(frame: frame)
        
        self.backgroundColor = UIColor.white
        
        self.subviews(forAutoLayout: self.stepIndicatorContainer, self.stepComponent)
        
        self.stepIndicatorContainer.snp.remakeConstraints { (make: ConstraintMaker) -> Void in
            make.top.equalToSuperview().offset(50.0)
            make.leading.equalToSuperview().offset(25.0)
            make.trailing.equalToSuperview().inset(25.0)
            make.height.equalTo(300.0)
        }
        
        self.stepComponent.snp.remakeConstraints { [unowned self] (make: ConstraintMaker) -> Void in
            make.top.equalTo(self.stepIndicatorContainer.snp.bottom)
            make.leading.equalToSuperview()
        }
        
        self.stepIndicatorContainer.subviews(forAutoLayout: [
            self.dotView1, self.horizontalLineView1,
            self.dotView2, self.horizontalLineView2,
            self.dotView3, self.horizontalLineView3,
            self.dotView4
        ])
        
        self.dotView1.snp.remakeConstraints { (make: ConstraintMaker) -> Void in
            make.top.equalToSuperview().offset(50.0)
            make.height.equalTo(20.0)
            make.width.equalTo(20.0)
            make.leading.equalToSuperview()
        }
        
        self.horizontalLineView1.snp.remakeConstraints { [unowned self] (make: ConstraintMaker) -> Void in
            make.centerY.equalTo(self.dotView1)
            make.leading.equalTo(self.dotView1.snp.trailing)
            make.height.equalTo(5.0)
            self.horizontalView1Width = make.width.equalTo(100.0).constraint
        }
        
        self.dotView2.snp.remakeConstraints { [unowned self] (make: ConstraintMaker) -> Void in
            make.top.equalToSuperview().offset(50.0)
            make.height.equalTo(20.0)
            make.width.equalTo(20.0)
            make.leading.equalTo(self.horizontalLineView1.snp.trailing)
        }
        
        self.horizontalLineView2.snp.remakeConstraints { [unowned self] (make: ConstraintMaker) -> Void in
            make.centerY.equalTo(self.dotView2)
            make.leading.equalTo(self.dotView2.snp.trailing)
            make.height.equalTo(5.0)
            self.horizontalView2Width = make.width.equalTo(100.0).constraint
        }
        
        self.dotView3.snp.remakeConstraints { [unowned self] (make: ConstraintMaker) -> Void in
            make.top.equalToSuperview().offset(50.0)
            make.height.equalTo(20.0)
            make.width.equalTo(20.0)
            make.leading.equalTo(self.horizontalLineView2.snp.trailing)
        }
        
        self.horizontalLineView3.snp.remakeConstraints { [unowned self] (make: ConstraintMaker) -> Void in
            make.centerY.equalTo(self.dotView3)
            make.leading.equalTo(self.dotView3.snp.trailing)
            make.height.equalTo(5.0)
            self.horizontalView3Width = make.width.equalTo(100.0).constraint
        }
        
        self.dotView4.snp.remakeConstraints { [unowned self] (make: ConstraintMaker) -> Void in
            make.top.equalToSuperview().offset(50.0)
            make.height.equalTo(20.0)
            make.width.equalTo(20.0)
            make.leading.equalTo(self.horizontalLineView3.snp.trailing)
        }
    }
    
    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func layoutSubviews() {
        super.layoutSubviews()
        
        let containerWidth: CGFloat = self.stepIndicatorContainer.frame.width
        
        let horizontalLineViewWidth: CGFloat = containerWidth / 3 - 25
        
        print("containerWidth \(containerWidth / 3)")
        
        self.horizontalView1Width.update(offset: horizontalLineViewWidth)
        self.horizontalView2Width.update(offset: horizontalLineViewWidth)
        self.horizontalView3Width.update(offset: horizontalLineViewWidth)
        
        self.stepComponent.setBarWith(to: horizontalLineViewWidth)
    
    }
    
    public override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        self.dotView1.setRadius()
        self.dotView2.setRadius()
        self.dotView3.setRadius()
        self.dotView4.setRadius()
    }
}
