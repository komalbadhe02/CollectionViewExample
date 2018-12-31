///**
/**
CollectionViewExample
VCProductDetails.swift
Created by: KOMAL BADHE on 31/12/18
Copyright (c) 2019 KOMAL BADHE
*/

import UIKit

class VCProductDetails: UIViewController,UIScrollViewDelegate {
    
    var dictProductDetails = NSDictionary();
    
    @IBOutlet weak var scrollViewContainerView: UIView!
    @IBOutlet weak var scrollViewObj: UIScrollView!
    @objc var frame: CGRect = CGRect(x:0, y:0, width:0, height:0)
    @objc var pageControl : UIPageControl = UIPageControl();
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        configurePageControl()
        scrollViewObj.delegate = self
        scrollViewObj.isPagingEnabled = true
        
        scrollViewObj.showsVerticalScrollIndicator = false;
        scrollViewObj.showsHorizontalScrollIndicator = false
        
        scrollViewObj.frame = CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: 250)
        scrollViewObj.bounces = false
        
        for index in 0..<4 {
            
            let subView = UIImageView();
            subView.image = UIImage(named: dictProductDetails.value(forKey: "imageName") as! String);
            
            frame.origin.x = self.scrollViewObj.frame.size.width * CGFloat(index)
            frame.size = self.scrollViewObj.frame.size
            
            subView.frame = frame
            self.scrollViewObj .addSubview(subView)
            
        }
        pageControl.frame = CGRect(x: self.scrollViewObj.frame.size.width/2-20, y: scrollViewObj.frame.size.height - 50, width:40 , height: 50)
        self.scrollViewContainerView.addSubview(pageControl)
        
        self.scrollViewObj.contentSize = CGSize(width:self.scrollViewObj.frame.size.width * 4,height: self.scrollViewObj.frame.size.height)
        pageControl.addTarget(self, action: #selector(self.changePage(sender:)), for: UIControl.Event.valueChanged)
        
        
    }
    
    
    
    //MARK: - customize page control
    
    @objc func configurePageControl() {
        // The total number of pages that are available is based on how many available colors we have.
        self.pageControl.numberOfPages = 4
        self.pageControl.currentPage = 0
        self.pageControl.tintColor = UIColor.red
        self.pageControl.pageIndicatorTintColor = UIColor.white
        self.pageControl.currentPageIndicatorTintColor = UIColor(red: 15.0/255.0, green: 123.0/255.0, blue: 143.0/255.0, alpha: 1);
        
    }
    
    
    //MARK: - TO CHANGE WHILE CLICKING ON PAGE CONTROL
    @objc func changePage(sender: AnyObject) -> () {
        let x = CGFloat(pageControl.currentPage) * scrollViewObj.frame.size.width
        scrollViewObj.setContentOffset(CGPoint(x:x, y:0), animated: true)
    }
    
    //MARK: Scrollview delegate
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        
        let pageNumber = round(scrollView.contentOffset.x / scrollView.frame.size.width)
        pageControl.currentPage = Int(pageNumber)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func backButtonAction(_ sender: Any) {
        
        self.navigationController?.popViewController(animated: true);
    }
    
    @IBAction func view3DButtonAction(_ sender: Any) {
        
        
        //load3DModel
        
//        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
//        let modalController = storyBoard.instantiateViewController(withIdentifier: VCM_3DMODEL) as! VCM3DModel
//        
//        modalController.dictProductDetails = NSDictionary(dictionary: dictProductDetails);
//        
//        
//        //   let modalController = storyBoard.instantiateViewController(withIdentifier: "load3DModel") as! VCMLoad3DModel
//        
//        
//        modalController.modalPresentationStyle = .overCurrentContext
//        self.present(modalController, animated: true, completion: nil)
    }
}

