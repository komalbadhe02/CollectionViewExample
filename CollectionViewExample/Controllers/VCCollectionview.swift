///**
/**
CollectionViewExample
VCCollectionview.swift
Created by: KOMAL BADHE on 31/12/18
Copyright (c) 2019 KOMAL BADHE
*/

import UIKit

class VCCollectionview: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    
    @IBOutlet weak var collectionViewObj: UICollectionView!
    var count  = Int();
    var arrOfObjects = NSArray();
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
                
        arrOfObjects =  [["imageName":"sofa1", "sourceLink": "https://sketchfab.com/models/f426165b35b74577926b1ab44f3382ab/embed" ,"objectName":"Sofa"],["imageName":"sofa2","sourceLink":"https://sketchfab.com/models/b620f9934bf34b3193941418b99eb40e/embed","objectName":"Sofa"],["imageName":"Creus_Armchair","sourceLink":"https://sketchfab.com/models/3a41f9bf2f43411b8523904a129b5465/embed","objectName":"Creus Armchair"],["imageName":"Egyptian Table","sourceLink":"https://sketchfab.com/models/e0c4de506dac4c05897eba02932b0c27/embed","objectName":"Egyptian Table"],["imageName":"Royal_curtains","sourceLink":"https://sketchfab.com/models/a3e46bace94b4272b2d49ad686a7ba4f/embed","objectName":"Royal curtains"],["imageName":"Curtain","sourceLink":"https://sketchfab.com/models/e5b01c717dbd4244b861168eddd67375/embed","objectName":"Curtain"],["imageName":"Cushion1","sourceLink":"https://sketchfab.com/models/2cbb0dee8106480d9d3e25347b3634f8/embed","objectName":"Cushion"],["imageName":"Cushion2","sourceLink":"https://sketchfab.com/models/0614e1f1eacf45b0968a317aaf892d8f/embed","objectName":"Cushion"]];
        
        
        count = arrOfObjects.count;
        
        collectionViewObj.dataSource = self;
        collectionViewObj.delegate = self;
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
   
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int{
        return count;
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell{
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier:"cellID", for: indexPath as IndexPath) as! HomeCollectionViewCell
        
        
        //        cell.containerView.layer.borderWidth = 0.2
        //       // cell.containerView.layer.cornerRadius = 5.0
        //        // border
        //        cell.containerView.layer.borderColor = UIColor.lightGray.cgColor
        //        // drop shadow
        //        cell.containerView.layer.shadowColor = UIColor.darkGray.cgColor
        //        cell.containerView.layer.shadowOpacity = 0.5
        //        cell.containerView.layer.shadowOffset = CGSize(width: 1.0, height: 1.0)
        
        
        if count%2 == 0 {
            
            if indexPath.row == count-1 || indexPath.row == count-2{
                cell.cellBottomConstraint.constant = 10;
            }
            else{
                cell.cellBottomConstraint.constant = 0;
            }
            
        }
        else{
            if indexPath.row == count-1{
                cell.cellBottomConstraint.constant = 10;
            }
            else{
                cell.cellBottomConstraint.constant = 0;
            }
        }
        
        cell.ivObject.image = UIImage(named:((arrOfObjects.object(at: indexPath.item) as! NSDictionary).value(forKey: "imageName") as? String)!);
        
        return cell;
        
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int{
        return 1;
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        
        if count%2 == 0 {
            
            if indexPath.row == count-1 || indexPath.row == count-2{
                let cellSize = CGSize(width: collectionView.frame.size.width/2, height: collectionView.frame.size.width/2+10)
                
                return cellSize
            }
            else{
                let cellSize = CGSize(width: collectionView.frame.size.width/2, height: collectionView.frame.size.width/2)
                
                return cellSize
            }
            
        }
        else{
            if indexPath.row == count-1{
                let cellSize = CGSize(width: collectionView.frame.size.width/2, height: collectionView.frame.size.width/2+10)
                
                return cellSize
            }
            else{
                let cellSize = CGSize(width: collectionView.frame.size.width/2, height: collectionView.frame.size.width/2)
                
                return cellSize
            }
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath)
    {
        
//           let  viewObj = self.storyboard?.instantiateViewController(withIdentifier: "vcScrollerID") as? VCScroller
        
        let  vcObj = self.storyboard?.instantiateViewController(withIdentifier: "vcProductDetails") as? VCProductDetails
        
        vcObj?.navigationItem.title = (arrOfObjects.object(at: indexPath.item) as! NSDictionary).value(forKey: "objectName") as? String;
        
        
        vcObj?.dictProductDetails = arrOfObjects.object(at: indexPath.item) as! NSDictionary
        self.navigationController?.pushViewController(vcObj!, animated: true)
        
    }
    

}
