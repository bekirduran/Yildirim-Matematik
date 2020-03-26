//
//  SoruYukle.swift
//  Yildirim Matematik
//
//  Created by Bekir Duran on 30.01.2020.
//  Copyright © 2020 info. All rights reserved.
//

import Foundation
class SoruYukle {
    var random1:Int?
    var random2:Int?
    var randomOp:String?
    var dogruCevap:Int?
    var yanlisCevaplar = [Int]()
    var operators = [String]()
    var secenekler = [Int]()
    var seceneklerKaristir = Set<Int>()
    
    
    
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
    
    
}
