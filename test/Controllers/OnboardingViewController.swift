//
//  OnboardingViewController.swift
//  test
//
//  Created by Frank on 2021/7/26.
//

//两个框架融合！！
import UIKit

class OnboardingViewController: UIViewController {

    @IBOutlet var holderView: UIView!
    let scrollView = UIScrollView()
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        configure()
    }
    
    private func configure(){
        //set up scroll view
        scrollView.frame = holderView.bounds
        holderView.addSubview(scrollView)
        
        let titles = ["Welcome", "Reflect", "Profile"]
        for x in 1..<4 {
            let pageView = UIView(frame: CGRect(x: CGFloat(x) * (holderView.frame.size.width), y:0, width: holderView.frame.size.width, height: holderView.frame.size.height))
            scrollView.addSubview(pageView)
            
            //title, image, button
            let label = UILabel(frame: CGRect(x: 10, y: 10, width: pageView.frame.size.width-20, height: 120))
            
            let imageView = UIImageView(frame: CGRect(x: 10, y: 10+120+10, width: pageView.frame.size.width-20, height: pageView.frame.size.height-60-130-15))
            
            let button = UIButton(frame: CGRect(x: 10, y: pageView.frame.size.height-60 , width: pageView.frame.size.width-20, height: 50))
            
            label.textAlignment = .center
            label.font = UIFont(name:"Helvetica-Bold", size: 32)
            pageView.addSubview(label)
            label.text = titles[x]
            
            imageView.contentMode = .scaleAspectFit
            imageView.image = UIImage(named: "onboarding_\(x)")
            pageView.addSubview(imageView)
            button.setTitleColor(.white, for: .normal)
            button.backgroundColor = .blue
            button.setTitle("Next", for: .normal)
            if x == 3 {
                button.setTitle("开始使用！", for: .normal)
            }
            button.addTarget(self, action: #selector(didTapButton(button:)), for: .touchUpInside)
            button.tag = x
            pageView.addSubview(button)
        }
        
        scrollView.contentSize = CGSize(width: holderView.frame.size.width*3 , height: 0)
        scrollView.isPagingEnabled = true
    }

    
    @objc func didTapButton(button: UIButton){
        guard button.tag < 3 else{
            //dismiss
            Core.shared.setIsNotFirstTime()
            dismiss(animated: true, completion: nil)
            return
        }
        //scroll next
        scrollView.setContentOffset(CGPoint(x:holderView.frame.size.width * CGFloat(button.tag), y:0), animated: true)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
