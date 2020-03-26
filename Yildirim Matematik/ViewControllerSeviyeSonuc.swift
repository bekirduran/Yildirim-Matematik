//
//  ViewControllerSeviyeSonuc.swift
//  Yildirim Matematik
//
//  Created by Bekir Duran on 27.01.2020.
//  Copyright © 2020 info. All rights reserved.
//

import UIKit
var Hak:Int?
class ViewControllerSeviyeSonuc: UIViewController {

    var dogruSayisi:Int?
    var yanlisSayisi:Int?
    var seviyeYuksel:Bool?
    var sayici:Timer?
    var sure:Int = 3
   
    
    override func viewDidLoad() {
      
        super.viewDidLoad()
        self.navigationItem.hidesBackButton = true
        PopupView.layer.cornerRadius = 5
        if Hak == nil {
            Hak = 0
        }
        
    }
    
    func sureGetir(){
            sayici = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(SAY), userInfo: nil, repeats: true)
    }
    
    @objc func SAY() {
                    print("Sure: \(sure)")
                      sure-=1
                      if sure < 0 {
                        sayici?.invalidate() //sayacı durdurma
                      self.view.addSubview(PopupView)
                        PopupView.center = self.view.center
                        labelPopup.text = "\(Hak!) adet Hakkınız var. Kaldığınız seviyeden devam etmek istiyorsanız"
                        PopupView.transform = CGAffineTransform.init(scaleX: 1.3, y: 1.3)
                      }
                  }
    override func viewWillAppear(_ animated: Bool) {
        
        
        if let d = dogruSayisi, let y = yanlisSayisi {
            labelDogrusayisi.text = "Toplam Doğru :    \(String(d))"
            labelYanlissayisi.text = "Toplam Yanlış :    \(String(y))"
            if d > 2 && y < 2 * d {
                labelSonuc.text = "Tebrikler!!! yeni seviyeye geçemeye hak kazandınız"
                seviyeYuksel = true
                imageView.image = UIImage(named: "mutlu_resim")
                if Hak == nil {
                    Hak = 1
                }
                else {
                    Hak! += 1
                    if Hak! > 3 {
                        Hak = 3
                    }
                }
                print("hak sayısı:\(Hak!)")
               
            }else {
                sureGetir()
                labelSonuc.text = "Üzgünüz!!! yeni seviye için biraz daha çalışın"
                imageView.image = UIImage(named: "uzgun_resim")
                buttonGorunum.setTitle("Yeniden Başla", for: .normal)
                buttonGorunum.backgroundColor = UIColor.yellow
                seviyeYuksel = false
                ButtonKalp.isHidden = false
                if let h = Hak {
                    if h < 1 {
                         ButtonKalp.isHidden = true
                        labelHak.text = "Hiç Hakkınız Yok"
                    }
                    
                }
             
                
            }
           
        }
        if Hak == 3 {
                imageViewKalp1.image = UIImage(named: "kalp_dolu")
                  imageViewKalp2.image = UIImage(named: "kalp_dolu")
                  imageViewKalp3.image = UIImage(named: "kalp_dolu")
        }
        if Hak == 2 {
                      imageViewKalp1.image = UIImage(named: "kalp_bos")
                        imageViewKalp2.image = UIImage(named: "kalp_dolu")
                        imageViewKalp3.image = UIImage(named: "kalp_dolu")
              }
        if Hak == 1 {
                      imageViewKalp1.image = UIImage(named: "kalp_bos")
                        imageViewKalp2.image = UIImage(named: "kalp_bos")
                        imageViewKalp3.image = UIImage(named: "kalp_dolu")
              }
        
        if Hak == 0 {
                            imageViewKalp1.image = UIImage(named: "kalp_bos")
                              imageViewKalp2.image = UIImage(named: "kalp_bos")
                              imageViewKalp3.image = UIImage(named: "kalp_bos")
                    }
      
        
    }
    

   

    @IBOutlet weak var buttonGorunum: UIButton!
    @IBAction func button(_ sender: Any) {
          let VC:ViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "Mat") as! ViewController
        if buttonGorunum.titleLabel?.text == "Yeniden Başla"{
            Hak = 0
        }
        VC.seviyeKontrol = seviyeYuksel
        self.show(VC, sender: nil)
       
    }
    @IBAction func butonPopup(_ sender: Any) {
        self.PopupView.removeFromSuperview()
    }
    @IBOutlet weak var labelPopup: UILabel!
    @IBOutlet var PopupView: UIView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var labelSonuc: UILabel!
    @IBOutlet weak var labelDogrusayisi: UILabel!
    @IBOutlet weak var imageViewKalp2: UIImageView!
    @IBOutlet weak var imageViewKalp3: UIImageView!
    @IBOutlet weak var imageViewKalp1: UIImageView!
    @IBOutlet weak var labelYanlissayisi: UILabel!
    @IBOutlet weak var labelHak: UILabel!
    @IBAction func ButtonKalp(_ sender: Any) {
      
        
        let VC:ViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "Mat") as! ViewController
             VC.jokerKontrol = true
             self.show(VC, sender: nil)
             print("kalp sayısı : \(Hak!)")
            Hak! -= 1
             if Hak == 2 {
                  imageViewKalp1.image = UIImage(named: "kalp_bos")
             }
             else if Hak == 1 {
                  imageViewKalp1.image = UIImage(named: "kalp_bos")
                 imageViewKalp2.image = UIImage(named: "kalp_bos")

             }
             else if Hak == 0 {
                 imageViewKalp1.image = UIImage(named: "kalp_bos")
                 imageViewKalp2.image = UIImage(named: "kalp_bos")
                 imageViewKalp3.image = UIImage(named: "kalp_bos")

             }
     
     
 
        
     
        
    }
    @IBOutlet weak var ButtonKalp: UIButton!
}
