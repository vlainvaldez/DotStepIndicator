//
//  ViewController.swift
//  DotStepIndicator
//
//  Created by alvin joseph valdez on 21/03/2019.
//  Copyright © 2019 alvin joseph valdez. All rights reserved.
//

import UIKit

public final class MainVC: UIViewController {
    
    // MARK: LifeCycle Methods
    public override func loadView() {
        super.loadView()
        self.view = MainView()
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension MainVC {
    public unowned var rootView: MainView { return self.view as! MainView }
}

