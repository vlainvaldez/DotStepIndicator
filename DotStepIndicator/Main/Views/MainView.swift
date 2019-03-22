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
        view.backgroundColor = UIColor.gray
        return view
    }()
//
//    public let dotView1: UIView = {
//        let view: UIView = UIView()
//        view.backgroundColor = AppUI.Color.blue
//        return view
//    }()
//
//    public let horizontalLineView1: UIView = {
//        let view: UIView = UIView()
//        view.backgroundColor = AppUI.Color.blue
//        return view
//    }()
//
//    public let dotView2: UIView = {
//        let view: UIView = UIView()
//        view.backgroundColor = AppUI.Color.blue
//        return view
//    }()
//
//    public let horizontalLineView2: UIView = {
//        let view: UIView = UIView()
//        view.backgroundColor = AppUI.Color.blue
//        return view
//    }()
//
//    public let dotView3: UIView = {
//        let view: UIView = UIView()
//        view.backgroundColor = AppUI.Color.blue
//        return view
//    }()
//
//    public let horizontalLineView3: UIView = {
//        let view: UIView = UIView()
//        view.backgroundColor = AppUI.Color.blue
//        return view
//    }()
//
//    public let dotView4: UIView = {
//        let view: UIView = UIView()
//        view.backgroundColor = AppUI.Color.blue
//        return view
//    }()
    
    public lazy var stepComponent1: StepComponentView = {
        let view: StepComponentView = StepComponentView()
        return view
    }()
    
    public lazy var stepComponent2: StepComponentView = {
        let view: StepComponentView = StepComponentView()
        return view
    }()
    
    public lazy var stepComponent3: StepComponentView = {
        let view: StepComponentView = StepComponentView()
        view.withEnd()
        return view
    }()
    
    // MARK: Stored Properties
    public var stepComponentViewWidth1: Constraint!
    public var stepComponentViewWidth2: Constraint!
    public var stepComponentViewWidth3: Constraint!
    
    public var stepComponentViewLeading1: Constraint!
    public var stepComponentViewLeading2: Constraint!
    public var stepComponentViewLeading3: Constraint!
    
    // Initializer
    public override init(frame: CGRect) {
        
        super.init(frame: frame)
        
        self.backgroundColor = UIColor.white
        
        self.subviews(forAutoLayout: self.stepIndicatorContainer)
        
        self.stepIndicatorContainer.snp.remakeConstraints { (make: ConstraintMaker) -> Void in
            make.top.equalToSuperview().offset(50.0)
            make.leading.equalToSuperview().offset(25.0)
            make.trailing.equalToSuperview().inset(25.0)
            make.height.equalTo(300.0)
        }

        self.stepIndicatorContainer.subviews(forAutoLayout: [
            self.stepComponent1, self.stepComponent2, self.stepComponent3
        ])
        
//        self.stepComponent1.snp.remakeConstraints { (make: ConstraintMaker) -> Void in
//            make.top.equalToSuperview().offset(50.0)
//            self.stepComponentViewLeading1 = make.leading.equalToSuperview().constraint
//            self.stepComponentViewWidth1 = make.width.equalTo(20.0).constraint
//
//        }
//
//        self.stepComponent2.snp.remakeConstraints { [unowned self] (make: ConstraintMaker) -> Void in
//            self.stepComponentViewLeading2 = make.leading.equalTo(self.stepComponent1.snp.trailing).constraint
//            make.centerY.equalTo(self.stepComponent1)
//            self.stepComponentViewWidth2 = make.width.equalTo(20.0).constraint
//        }
//
//        self.stepComponent3.snp.remakeConstraints { [unowned self] (make: ConstraintMaker) -> Void in
//            make.top.equalToSuperview().offset(50.0)
//            self.stepComponentViewLeading3 = make.leading.equalTo(self.stepComponent2.snp.trailing).constraint
//            self.stepComponentViewWidth3 = make.width.equalTo(20.0).constraint
//
//        }
        
//
//        self.dotView1.snp.remakeConstraints { (make: ConstraintMaker) -> Void in
//            make.top.equalToSuperview().offset(50.0)
//            make.height.equalTo(20.0)
//            make.width.equalTo(20.0)
//            make.leading.equalToSuperview()
//        }
//
//        self.horizontalLineView1.snp.remakeConstraints { [unowned self] (make: ConstraintMaker) -> Void in
//            make.centerY.equalTo(self.dotView1)
//            make.leading.equalTo(self.dotView1.snp.trailing)
//            make.height.equalTo(5.0)
//            self.horizontalView1Width = make.width.equalTo(100.0).constraint
//        }
//
//        self.dotView2.snp.remakeConstraints { [unowned self] (make: ConstraintMaker) -> Void in
//            make.top.equalToSuperview().offset(50.0)
//            make.height.equalTo(20.0)
//            make.width.equalTo(20.0)
//            make.leading.equalTo(self.horizontalLineView1.snp.trailing)
//        }
//
//        self.horizontalLineView2.snp.remakeConstraints { [unowned self] (make: ConstraintMaker) -> Void in
//            make.centerY.equalTo(self.dotView2)
//            make.leading.equalTo(self.dotView2.snp.trailing)
//            make.height.equalTo(5.0)
//            self.horizontalView2Width = make.width.equalTo(100.0).constraint
//        }
//
//        self.dotView3.snp.remakeConstraints { [unowned self] (make: ConstraintMaker) -> Void in
//            make.top.equalToSuperview().offset(50.0)
//            make.height.equalTo(20.0)
//            make.width.equalTo(20.0)
//            make.leading.equalTo(self.horizontalLineView2.snp.trailing)
//        }
//
//        self.horizontalLineView3.snp.remakeConstraints { [unowned self] (make: ConstraintMaker) -> Void in
//            make.centerY.equalTo(self.dotView3)
//            make.leading.equalTo(self.dotView3.snp.trailing)
//            make.height.equalTo(5.0)
//            self.horizontalView3Width = make.width.equalTo(100.0).constraint
//        }
//
//        self.dotView4.snp.remakeConstraints { [unowned self] (make: ConstraintMaker) -> Void in
//            make.top.equalToSuperview().offset(50.0)
//            make.height.equalTo(20.0)
//            make.width.equalTo(20.0)
//            make.leading.equalTo(self.horizontalLineView3.snp.trailing)
//        }
    }
    
    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func layoutSubviews() {
        super.layoutSubviews()
        
//        let stepComponentsWidths: [Constraint] = [
//            self.stepComponentViewWidth1, self.stepComponentViewWidth2,
//            self.stepComponentViewWidth3
//        ]
        
        let containerWidth: CGFloat = self.stepIndicatorContainer.frame.width
        
        let horizontalLineViewWidth: CGFloat = containerWidth / 3 - 25
        
//        self.stepComponent1.horizontalLineWidth.update(offset: horizontalLineViewWidth).activate()
//        self.stepComponent2.horizontalLineWidth.update(offset: horizontalLineViewWidth).activate()
//        self.stepComponent3.horizontalLineWidth.update(offset: horizontalLineViewWidth).activate()
//        self.stepComponent1.setNeedsLayout()
//        self.stepComponent2.setNeedsLayout()
//        self.setNeedsLayout()
        
        
        self.stepComponent1.snp.remakeConstraints { (make: ConstraintMaker) -> Void in
            make.top.equalToSuperview().offset(50.0)
            self.stepComponentViewLeading1 = make.leading.equalToSuperview().constraint
            self.stepComponentViewWidth1 = make.width.equalTo(horizontalLineViewWidth).constraint
            
        }
        
        self.stepComponent2.snp.remakeConstraints { [unowned self] (make: ConstraintMaker) -> Void in
            self.stepComponentViewLeading2 = make.leading.equalTo(self.stepComponent1.snp.trailing).constraint
            make.centerY.equalTo(self.stepComponent1)
            self.stepComponentViewWidth2 = make.width.equalTo(horizontalLineViewWidth).constraint
        }
        
        self.stepComponent3.snp.remakeConstraints { [unowned self] (make: ConstraintMaker) -> Void in
            make.top.equalToSuperview().offset(50.0)
            self.stepComponentViewLeading3 = make.leading.equalTo(self.stepComponent2.snp.trailing).constraint
            self.stepComponentViewWidth3 = make.width.equalTo(horizontalLineViewWidth).constraint
            
        }
        
        self.stepComponent1.setBarWidth(to: horizontalLineViewWidth)
        self.stepComponent2.setBarWidth(to: horizontalLineViewWidth)
        self.stepComponent3.setBarWidth(to: horizontalLineViewWidth)
        
        self.layoutIfNeeded()
//
//        self.stepComponent1.setNeedsLayout()
        
        print("self.stepComponent1.frame.width \(self.stepComponent1.frame.width)")
        print("self.stepComponent2.frame.width \(self.stepComponent2.frame.width)")
        print("self.stepComponent3.frame.width \(self.stepComponent3.frame.width)")
    }
}
