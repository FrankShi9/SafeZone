//
//  ViewController.swift
//  test
//
//  Created by Frank on 2021/7/26.
//

import UIKit

class ViewController: UIViewController {
    override func viewDidLoad(){
        super.viewDidLoad()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        if Core.shared.isFirstTime(){
            //show onboarding
            let vc = storyboard?.instantiateViewController(identifier: "onboarding") as! OnboardingViewController
            vc.modalPresentationStyle = .fullScreen
            present(vc, animated: true)
        }
    }
}

class Core {
    static let shared = Core()
    
    func isFirstTime() -> Bool {
        return !UserDefaults.standard.bool(forKey: "isFirstTime")
    }
    func setIsNotFirstTime(){
        UserDefaults.standard.set(true, forKey: "isFirstTime")
    }
}
