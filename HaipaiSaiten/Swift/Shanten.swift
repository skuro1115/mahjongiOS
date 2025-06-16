//
//  Shanten.swift
//  Haipai_Saiten
//
//  Created by 黒田拓杜 on 2022/03/26.
//
//
import Foundation

extension Main2VC{
    func calcShanten(haiList:[Int])->Int{
        let listForChitoitsu = haiList
        let listForKokushi = haiList
        let manzu = Array(haiList[0..<9])
        let pinzu = Array(haiList[9..<18])
        let souzu = Array(haiList[18..<27])
        let jihai = Array(haiList[27..<34])
        
        let sum = manzu.reduce(0, +) + souzu.reduce(0, +) + pinzu.reduce(0, +) + jihai.reduce(0, +)
        if sum != 13{
            print("not 13mai!!!!!!!!")
            
        }
        
        let haipai = Haipai(mlist: manzu, plist: pinzu, slist: souzu, jihai: jihai)
//
        var shanten = haipai.calcShanten()
        
        var chitoiShanten = 6
        listForChitoitsu.forEach { haiCount in
            if haiCount > 1{
                chitoiShanten -= 1
            }
        }
        let yaochuHai = [0,8,9,17,18,26,27,28,29,30,31,32,33]
        var kokushiToitsu = 0
        var kokushiShanten = 13
        yaochuHai.forEach { idx in
            if listForKokushi[idx] > 0{
                kokushiShanten -= 1
            }
            if listForKokushi[idx] > 1{
                kokushiToitsu = 1
            }
        }
        kokushiShanten -= kokushiToitsu
        
        shanten = min(shanten,kokushiShanten,chitoiShanten)
        
    
        return shanten
        
    }
    
    private func deleteMentsu(list:[Int]) -> ([Int],Int){
        var list = list
        var kotsuIndex:[Int] = []
        for i in 0..<9{
            let haiCount = list[i]
            if haiCount > 2{
                kotsuIndex.append(i)
            }
        }
        let kotsuCount = kotsuIndex.count
        
        var mentsuCount = 0
        switch kotsuCount{
        case 0:
            for _ in 0..<4{
                for i in 0..<7{
                    if list[i] != 0 && list[i+1] != 0 && list[i+2] != 0{
                        list[i] -= 1
                        list[i+1] -= 1
                        list[i+2] -= 1
                        mentsuCount += 1
                    }
                }
            }
            
        case 1:
            kotsuIndex.append(99)
            kotsuIndex.append(99)
            kotsuIndex.append(99)
            let perKotsu = permutation(kotsuIndex)
            let subReturn = subDeletementsu(list: list, per: perKotsu)
            list = subReturn.0
            mentsuCount = subReturn.1
        case 2:
            kotsuIndex.append(99)
            kotsuIndex.append(99)

            let perKotsu = permutation(kotsuIndex)
            let subReturn = subDeletementsu(list: list, per: perKotsu)
            list = subReturn.0
            mentsuCount = subReturn.1

        case 3:

            kotsuIndex.append(99)
            let perKotsu = permutation(kotsuIndex)
            let subReturn = subDeletementsu(list: list, per: perKotsu)
            list = subReturn.0
            mentsuCount = subReturn.1
        case 4:
            list = [1,0,0,0,0,0,0,0,0]
            mentsuCount = 4
        default:
            break
        }
        return(list,mentsuCount)
        
        
    }
    private func subDeletementsu(list:[Int],per:[[Int]]) ->([Int],Int){
        var outList:[Int] = list
        
        let perCount = per.count
        
        var mentsuCount = 0
        for pidx in 0..<perCount{
            let indexs = per[pidx]
            var listTmp = list
    
            var mentsuCountTemp = 0
            for i in 0..<indexs.count{
                let idx = indexs[i]
                
                if idx == 99{
                fori:for i in 0..<7{
                    if listTmp[i] != 0 && listTmp[i+1] != 0 && listTmp[i+2] != 0{
                        listTmp[i] -= 1
                        listTmp[i+1] -= 1
                        listTmp[i+2] -= 1
                        mentsuCountTemp += 1
                        break fori
                    }
                    
                }
                }else{
                    if listTmp[idx] >= 3{
                        listTmp[idx] -= 3
                        mentsuCountTemp += 1
                    }
                    
                }
            }
            if mentsuCountTemp > mentsuCount{
                mentsuCount = mentsuCountTemp
                outList = listTmp
            }
        }
        return (outList,mentsuCount)
        
    }
    
    
    func deleteToitsu(list:[Int]) -> ([Int],Int){
        var toitsuCount = 0
        var list = list
        for idx in 0..<9{
            if list[idx] > 2{
                print("メンツが抜き出せていません")
            }else if list[idx] == 2{
                list[idx] -= 2
                toitsuCount += 1
            }
        }
        return ( list ,toitsuCount)
    }
    func deleteTatsu(list:[Int]) -> Int{
        var tatsuCount = 0
        var list = list
        for idx in 0..<8{
            if list[idx] != 0 && list[idx+1] != 0{
                
                list[idx] -= 1
                list[idx+1] -= 1
                tatsuCount += 1
//                if list[idx+2] != 0{
//                    print("メンツが抜き出せていません")
//                }
            }
            if idx == 7{
                continue
            }
            if list[idx] != 0 && list[idx+2] != 0{
                list[idx] -= 1
                list[idx+2] -= 1
                tatsuCount += 1
                
            }
            
        }
        return tatsuCount
    }
    
    
    
    
    func permutation(_ args: [Int]) -> [[Int]] {
      guard args.count > 1 else { return [args] }
      func rotate(_ arr: [Int]) -> [Int] { [arr.last!] + arr.dropLast() }
      var rotatedValue = args
      var result: [[Int]] = []
        for _ in 0..<args.count {
          let head = rotatedValue.first!
          let tail = rotatedValue.dropFirst().map { Int($0) }
          permutation(tail).forEach {
            result.append([head] + $0)
          }
          rotatedValue = rotate(rotatedValue)
        }
        return result
    }
}
