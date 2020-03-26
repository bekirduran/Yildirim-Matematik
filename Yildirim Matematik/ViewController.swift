//
//  ViewController.swift
//  Yildirim Matematik
//
//  Created by Bekir Duran on 26.01.2020.
//  Copyright © 2020 info. All rights reserved.
//

import UIKit


 var seviye:Int!
class ViewController: UIViewController {
    var jokerKontrol:Bool?
    var seviyeKontrol:Bool?
    var sayici:Timer?
    var sayiciCalisiyorMu = false
    var sure:Int=6
    var soruSayac = 0
    var dogruSayac = 0
    var yanlisSayac = 0
    var dogruCevap:Int?
    var random1:Int?
    var random2:Int?
    var randomOp:String?
    var operators = [String]()
    var secenekler = [Int]()
    var yanlisCevaplar = [Int]() //eklendi
    var seceneklerKaristir = Set<Int>()
    
    override func viewDidLoad() {

        super.viewDidLoad()
        self.navigationItem.hidesBackButton = true

        
        
    }

    
    override func viewWillAppear(_ animated: Bool) {

        if jokerKontrol == true {
            labelSeviye.text = "Seviye : \(seviye!)"
            soru_yukle()
            sureGetir()
            sure = 6
            dogruSayac = 0
            yanlisSayac = 0
            labelDogru.text = "Doğru : 0"
            labelYanlis.text = "Yanlış : 0"
            
        }
        else {
            if seviyeKontrol == true {
                seviye += 1
            }
            else {
                seviye = 1
            }
                   
            labelSeviye.text = "Seviye : \(seviye!)"
            soru_yukle()
            sureGetir()
            sure = 6
            dogruSayac = 0
            yanlisSayac = 0
            labelDogru.text = "Doğru : 0"
            labelYanlis.text = "Yanlış : 0"
        }
       
    }
    
    func yanlisCevapUretToplamaCikarma(dogruCevap:Int,s1:Int,s2:Int,toplama:Bool) {
        yanlisCevaplar.removeAll()
        yanlisCevaplar.append(dogruCevap+1)
        yanlisCevaplar.append(dogruCevap-1)
        if toplama {
            yanlisCevaplar.append(abs(s1-s2))
        }else {
            yanlisCevaplar.append(s1+s2)
        }
        
    }
    
    func sureGetir(){
      
        if sayiciCalisiyorMu == false {
            sayici = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(SAY), userInfo: nil, repeats: true)
             sayiciCalisiyorMu = true
          
           hepsiniGoster()
            
        }
        else {
            sayici?.invalidate()
            sayiciCalisiyorMu = false
            ButtonTimerText.setTitle("Duraklatıldı \(String(sure))", for: .normal)
           
          hepsiniGizle()
        }
          
       
    }
    
    @objc func SAY() {
                    
        ButtonTimerText.setTitle("\(String(sure))", for: .normal)
         imageViewDY.image = nil
                      sure-=1
                      if sure < 0 {
                        sayiciCalisiyorMu = false
                         sayici?.invalidate() //sayacı durdurma
                        ButtonTimerText.titleLabel?.text = "SÜRE BİTTİ"
                        ButtonTimerText.titleLabel?.text = ""
                        performSegue(withIdentifier: "toSonuc", sender: nil)
                      }
                  }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toSonuc"{
            let vc = segue.destination as! ViewControllerSeviyeSonuc
            vc.dogruSayisi = dogruSayac
            vc.yanlisSayisi = yanlisSayac
          
        }
    }
    
    
    
    func soru_yukle () { // seviye ye göre soru yükleme ekranı
        
       
        
    if seviye == 1 { // sadece topla
            
        random1 = Int(arc4random_uniform(20)+1)
        random2 = Int(arc4random_uniform(20)+1)
         
        dogruCevap=random1!+random2!
        labelNum1.text = String(random1!)
        labelNum2.text = String(random2!)
        labelOp.text = "+"
        yanlisCevapUretToplamaCikarma(dogruCevap: dogruCevap!, s1: random1!, s2: random2!, toplama: true)
            
        }
        
    else if seviye == 2 { // sadece çıkar
            random1 = Int(arc4random_uniform(20)+1)
            random2 = Int(arc4random_uniform(20)+1)
            if random1! > random2! {
                dogruCevap = random1!-random2!
                labelNum1.text = String(random1!)
                labelNum2.text = String(random2!)
                yanlisCevapUretToplamaCikarma(dogruCevap: dogruCevap!, s1: random1!, s2: random2!, toplama: false)
                labelOp.text = "-"
            }
            else  {
                dogruCevap = random2!-random1!
                labelNum1.text = String(random2!)
                labelNum2.text = String(random1!)
                labelOp.text = "-"
                yanlisCevapUretToplamaCikarma(dogruCevap: dogruCevap!, s1: random2!, s2: random1!, toplama: false)
            }
            
        }
        
    else if seviye == 3 { // topla ve çıkar karışık
            random1 = Int(arc4random_uniform(20)+1)
            random2 = Int(arc4random_uniform(20)+1)
            operators.append("topla")
            operators.append("çıkar")
            randomOp = operators.randomElement()
            
            if randomOp == "topla" {
                dogruCevap=random1!+random2!
                labelNum1.text = String(random1!)
                labelNum2.text = String(random2!)
                labelOp.text = "+"
                yanlisCevapUretToplamaCikarma(dogruCevap: dogruCevap!, s1: random1!, s2: random2!, toplama: true)
                
            }
            else {
                if random1! > random2! {
                    dogruCevap = random1!-random2!
                    labelNum1.text = String(random1!)
                    labelNum2.text = String(random2!)
                    yanlisCevapUretToplamaCikarma(dogruCevap: dogruCevap!, s1: random1!, s2: random2!, toplama: false)
                    labelOp.text = "-"
                          }
                else  {
                    dogruCevap = random2!-random1!
                    labelNum1.text = String(random2!)
                    labelNum2.text = String(random1!)
                    labelOp.text = "-"
                    yanlisCevapUretToplamaCikarma(dogruCevap: dogruCevap!, s1: random2!, s2: random1!, toplama: false)
                          }
            }
        }
            
    else if seviye == 4 { // sadece topla 40 ile 10
                      
            random1 = Int(arc4random_uniform(40)+10)
            random2 = Int(arc4random_uniform(40)+10)
                   
            dogruCevap=random1!+random2!
            labelNum1.text = String(random1!)
            labelNum2.text = String(random2!)
            labelOp.text = "+"
            yanlisCevapUretToplamaCikarma(dogruCevap: dogruCevap!, s1: random1!, s2: random2!, toplama: true)
            
            }
        
    else if seviye == 5 { // sadece çıkar 40 ile 10
            random1 = Int(arc4random_uniform(40)+10)
            random2 = Int(arc4random_uniform(40)+10)
            if random1! > random2! {
                dogruCevap = random1!-random2!
                labelNum1.text = String(random1!)
                labelNum2.text = String(random2!)
                yanlisCevapUretToplamaCikarma(dogruCevap: dogruCevap!, s1: random1!, s2: random2!, toplama: false)
                labelOp.text = "-"
                }
            else  {
                dogruCevap = random2!-random1!
                labelNum1.text = String(random2!)
                labelNum2.text = String(random1!)
                labelOp.text = "-"
                yanlisCevapUretToplamaCikarma(dogruCevap: dogruCevap!, s1: random2!, s2: random1!, toplama: false)
                }
            
        }
        else if seviye == 6 { // topla ve çıkar karışık 40 ile 10
                random1 = Int(arc4random_uniform(40)+10)
                random2 = Int(arc4random_uniform(40)+10)
                operators.append("topla")
                operators.append("çıkar")
                randomOp = operators.randomElement()
                
                if randomOp == "topla" {
                    dogruCevap=random1!+random2!
                    labelNum1.text = String(random1!)
                    labelNum2.text = String(random2!)
                    labelOp.text = "+"
                    yanlisCevapUretToplamaCikarma(dogruCevap: dogruCevap!, s1: random1!, s2: random2!, toplama: true)
                    
                }
                else {
                    if random1! > random2! {
                        dogruCevap = random1!-random2!
                        labelNum1.text = String(random1!)
                        labelNum2.text = String(random2!)
                        yanlisCevapUretToplamaCikarma(dogruCevap: dogruCevap!, s1: random1!, s2: random2!, toplama: false)
                        labelOp.text = "-"
                              }
                    else  {
                        dogruCevap = random2!-random1!
                        labelNum1.text = String(random2!)
                        labelNum2.text = String(random1!)
                        labelOp.text = "-"
                        yanlisCevapUretToplamaCikarma(dogruCevap: dogruCevap!, s1: random2!, s2: random1!, toplama: false)
                              }
                }
            }
    else {
        print("Yeni seviye yüklenecek, programcı ile görüşün")
        }
        
        
      
       
        secenekler.removeAll()
        seceneklerKaristir.removeAll()
        
        seceneklerKaristir.insert(dogruCevap!)
        seceneklerKaristir.insert(yanlisCevaplar[0])
        seceneklerKaristir.insert(yanlisCevaplar[1])
        seceneklerKaristir.insert(yanlisCevaplar[2])
        
        for s in seceneklerKaristir {
            print(s)
            secenekler.append(s)
        }
        chA.setTitle(String(secenekler[0]), for: .normal)
        chB.setTitle(String(secenekler[1]), for: .normal)
        chC.setTitle(String(secenekler[2]), for: .normal)
        chD.setTitle(String(secenekler[3]), for: .normal)
    }
    
    func dogruKontrol (buton : UIButton) {
        let chtitle = buton.titleLabel?.text
        let dogru = String(dogruCevap!)
        if dogru == chtitle {
            dogruSayac += 1
             imageViewDY.image = UIImage(named: "dogru.png")
          
        }
        else {
            yanlisSayac += 1
            imageViewDY.image = UIImage(named: "yanlis.png")
        }
        print("dogru : \(dogruSayac)")
        print("yanlis : \(yanlisSayac)")
        labelDogru.text = "Doğru : \(dogruSayac)"
        labelYanlis.text = "Yanlış : \(yanlisSayac)"
        
    }
   
    func hepsiniGizle() {
        labelNum1.isHidden = true
        labelNum2.isHidden = true
        labelOp.isHidden = true
        chA.isHidden = true
        chB.isHidden = true
        chC.isHidden = true
        chD.isHidden = true
    }
    func hepsiniGoster() {
        labelNum1.isHidden = false
        labelNum2.isHidden = false
        labelOp.isHidden = false
        chA.isHidden = false
        chB.isHidden = false
        chC.isHidden = false
        chD.isHidden = false
    }
   
    
    @IBOutlet weak var labelYanlis: UILabel!
    @IBOutlet weak var labelDogru: UILabel!
    @IBOutlet weak var labelSeviye: UILabel!
    @IBOutlet weak var chD: UIButton!
    @IBOutlet weak var labelTimer: UILabel!
    @IBOutlet weak var chC: UIButton!
    @IBOutlet weak var chB: UIButton!
    @IBOutlet weak var chA: UIButton!
    @IBOutlet weak var labelOp: UILabel!
    @IBOutlet weak var labelNum2: UILabel!
    @IBOutlet weak var labelNum1: UILabel!
    
    @IBOutlet weak var imageViewDY: UIImageView!
    @IBOutlet weak var ButtonTimerText: UIButton!
    @IBAction func buttonTimerText(_ sender: Any) {
        sureGetir()
    }
    @IBAction func chD(_ sender: Any) {
        dogruKontrol(buton: chD)
        soru_yukle()
    
    }
    
    @IBAction func chC(_ sender: Any) {
        dogruKontrol(buton: chC)
        soru_yukle()
    }
    
    @IBAction func chB(_ sender: Any) {
        dogruKontrol(buton: chB)
        soru_yukle()
    }
    
    @IBAction func chA(_ sender: Any) {
        dogruKontrol(buton: chA)
        soru_yukle()
    }
}

