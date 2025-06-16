//
//  Models.swift
//  HaipaiSaiten
//
//  Created by 黒田拓杜 on 2022/07/01.
//

import Foundation

class Haipai{
    let mlist:[Int]
    let plist:[Int]
    let slist:[Int]
    var mentsuCount = 0
    var toitsuCount = 0
    var tatsuCount = 0
    let jMentsuCount:Int
    let jToitsuCount:Int
//    var shanten = 8
    init(mlist:[Int], plist:[Int], slist:[Int],jihai:[Int]){
        self.mlist = mlist
        self.plist = plist
        self.slist = slist
        
        var jihaiToitsu = 0
        var jihaiMentsu = 0
        jihai.forEach { haiCount in
            if haiCount >= 3{
                jihaiMentsu += 1
            }else if haiCount == 2{
                jihaiToitsu += 1
            }
        }
        self.jMentsuCount = jihaiMentsu
        self.jToitsuCount = jihaiToitsu
    }
    func calcShanten() -> Int{
        var toitsuExist = false
        var mlist = self.mlist
        var plist = self.plist
        var slist = self.slist
        var mToitsuIdx:[Int] = []
        var pToitsuIdx:[Int] = []
        var sToitsuIdx:[Int] = []
        
        for i in 0..<9{
            if mlist[i] > 1{
                mToitsuIdx.append(i)
                toitsuExist = true
            }
            if plist[i] > 1{
                pToitsuIdx.append(i)
                toitsuExist = true
            }
            if slist[i] > 1{
                sToitsuIdx.append(i)
                toitsuExist = true
            }
        }
        
        var shanten = 8
        
        mToitsuIdx.forEach { idx in
            mlist[idx] -= 2
            
            mlist = deleteMentsu(list: mlist)
            plist = deleteMentsu(list: plist)
            slist = deleteMentsu(list: slist)

            
            self.mentsuCount += self.jMentsuCount
            self.tatsuCount += self.jToitsuCount
            
            let maxMentsu = self.mentsuCount + self.tatsuCount
            if maxMentsu > 4{
                self.tatsuCount -= maxMentsu-4
            }
            
            let shantenTmp = 8 - 2*self.mentsuCount - self.tatsuCount - 1
            
            if shanten > shantenTmp {
                shanten = shantenTmp
            }
            
            
            self.mentsuCount = 0
            self.tatsuCount = 0
            self.toitsuCount = 0
            
            mlist = self.mlist
            plist = self.plist
            slist = self.slist
        }
        pToitsuIdx.forEach { idx in
            plist[idx] -= 2
            
            mlist = deleteMentsu(list: mlist)
            plist = deleteMentsu(list: plist)
            slist = deleteMentsu(list: slist)
            
            self.mentsuCount += self.jMentsuCount
            self.tatsuCount += self.jToitsuCount
            
            let maxMentsu = self.mentsuCount + self.tatsuCount
            if maxMentsu > 4{
                self.tatsuCount -= maxMentsu-4
            }
            
            let shantenTmp = 8 - 2*self.mentsuCount - self.tatsuCount - 1
            
            if shanten > shantenTmp {
                shanten = shantenTmp
            }
            
            self.mentsuCount = 0
            self.tatsuCount = 0
            self.toitsuCount = 0
            
            mlist = self.mlist
            plist = self.plist
            slist = self.slist
        }
        sToitsuIdx.forEach { idx in
            slist[idx] -= 2
            
            mlist = deleteMentsu(list: mlist)
            plist = deleteMentsu(list: plist)
            slist = deleteMentsu(list: slist)
            
            self.mentsuCount += self.jMentsuCount
            self.tatsuCount += self.jToitsuCount
            
            let maxMentsu = self.mentsuCount + self.tatsuCount
            if maxMentsu > 4{
                self.tatsuCount -= maxMentsu-4
            }
            
            let shantenTmp = 8 - 2*self.mentsuCount - self.tatsuCount - 1
            
            if shanten > shantenTmp {
                shanten = shantenTmp
            }
            
            self.mentsuCount = 0
            self.tatsuCount = 0
            self.toitsuCount = 0
            
            mlist = self.mlist
            plist = self.plist
            slist = self.slist
        }

        mlist = deleteMentsu(list: mlist)
        plist = deleteMentsu(list: plist)
        slist = deleteMentsu(list: slist)

        self.mentsuCount += self.jMentsuCount
        if self.jToitsuCount != 0{
            self.tatsuCount += self.jToitsuCount - 1
        }
        let maxMentsu = self.mentsuCount + self.tatsuCount
        if maxMentsu > 4{
            self.tatsuCount -= maxMentsu-4
        }
        
        var shantenTmp = 8 - 2*self.mentsuCount - self.tatsuCount
        if self.jToitsuCount != 0{
            shantenTmp -= 1
            print("jihaitoitsu")
        }
        if shanten > shantenTmp {
            shanten = shantenTmp
        }
        //        }
        return shanten
        
    }
    private func deleteMentsu(list:[Int]) -> [Int]{
        var list = list
        var kotsuIndex:[Int] = []
        for i in 0..<9{
            let haiCount = list[i]
            if haiCount > 2{
                kotsuIndex.append(i)
            }
        }
        let kotsuCount = kotsuIndex.count
        
        switch kotsuCount{
        case 0:

            kotsuIndex.append(99)
            kotsuIndex.append(99)
            kotsuIndex.append(99)
            kotsuIndex.append(99)

            let perKotsu = permutation(kotsuIndex)
            list = subDeletementsu(list: list, per: perKotsu)
            
        case 1:
            kotsuIndex.append(99)
            kotsuIndex.append(99)
            kotsuIndex.append(99)
            let perKotsu = permutation(kotsuIndex)
            list = subDeletementsu(list: list, per: perKotsu)
            
        case 2:
            kotsuIndex.append(99)
            kotsuIndex.append(99)

            let perKotsu = permutation(kotsuIndex)
            list = subDeletementsu(list: list, per: perKotsu)
       

        case 3:

            kotsuIndex.append(99)
            let perKotsu = permutation(kotsuIndex)
            list = subDeletementsu(list: list, per: perKotsu)

        case 4:
            list = [1,0,0,0,0,0,0,0,0]
            self.mentsuCount  += 4
        default:
            break
        }
        return list
    }
    
    private func subDeletementsu(list:[Int],per:[[Int]]) -> [Int]{
        var outList:[Int] = list
        
        let perCount = per.count
        
        var mentsuCount = 0
        var tatsuCount = 0
        var judge = 0
        for pidx in 0..<perCount{
            let indexs = per[pidx]
            var listTmp = list
    
            var mentsuCountTemp = 0
            var tatsuCountTemp = 0
            for j in 0..<indexs.count{
                let idx = indexs[j]
                
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
            tatsuCountTemp = deleteTatsu(list: listTmp)
            if mentsuCountTemp*2 + tatsuCountTemp > judge{
            
                mentsuCount = mentsuCountTemp
                tatsuCount = tatsuCountTemp
                judge = mentsuCountTemp*2 + tatsuCountTemp
                outList = listTmp
            }
            listTmp = list
            tatsuCountTemp = 0
            mentsuCountTemp = 0
            for j in 0..<indexs.count{
                let idx = indexs[j]
                
                if idx == 99{
                fori:for i in (2...8).reversed() {
                    if listTmp[i] != 0 && listTmp[i-1] != 0 && listTmp[i-2] != 0{
                        listTmp[i] -= 1
                        listTmp[i-1] -= 1
                        listTmp[i-2] -= 1
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
            tatsuCountTemp = deleteTatsu(list: listTmp)
            if mentsuCountTemp*2 + tatsuCountTemp > judge{
            
                mentsuCount = mentsuCountTemp
                tatsuCount = tatsuCountTemp
                outList = listTmp
                judge = mentsuCountTemp*2 + tatsuCountTemp
            }
            
        }
        self.mentsuCount += mentsuCount
        self.tatsuCount += tatsuCount
        return outList
        
    }
    
    func deleteTatsu(list:[Int])-> Int{
        var list = list
        var tatsuCount = 0
        for idx in 0..<9{
            if list[idx] > 2{
                print("メンツが抜き出せていません")
            }else if list[idx] == 2{
                list[idx] -= 2
                tatsuCount += 1
            }
        }
        for idx in 0..<8{
            if list[idx] != 0 && list[idx+1] != 0{
                
                list[idx] -= 1
                list[idx+1] -= 1
                tatsuCount += 1

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

