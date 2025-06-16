//
//  ImageName.swift
//  HaipaiSaiten
//
//  Created by 黒田拓杜 on 2022/06/20.
//

import Foundation

class Asset{
    class func ImageName(haiNumber:Int) -> String{
        var name = "p_rev"
        switch haiNumber{
        case 0:
            name = "p_ms1_1"
        case 1:
            name = "p_ms2_1"
        case 2:
            name = "p_ms3_1"
        case 3:
            name = "p_ms4_1"
        case 4:
            name = "p_ms5_1"
        case 5:
            name = "p_ms6_1"
        case 6:
            name = "p_ms7_1"
        case 7:
            name = "p_ms8_1"
        case 8:
            name = "p_ms9_1"
            
        case 9:
            name = "p_ps1_1"
        case 10:
            name = "p_ps2_1"
        case 11:
            name = "p_ps3_1"
        case 12:
            name = "p_ps4_1"
        case 13:
            name = "p_ps5_1"
        case 14:
            name = "p_ps6_1"
        case 15:
            name = "p_ps7_1"
        case 16:
            name = "p_ps8_1"
        case 17:
            name = "p_ps9_1"
        
        case 18:
            name = "p_ss1_1"
        case 19:
            name = "p_ss2_1"
        case 20:
            name = "p_ss3_1"
        case 21:
            name = "p_ss4_1"
        case 22:
            name = "p_ss5_1"
        case 23:
            name = "p_ss6_1"
        case 24:
            name = "p_ss7_1"
        case 25:
            name = "p_ss8_1"
        case 26:
            name = "p_ss9_1"
            
        case 27:
            name = "p_ji_e_1"
        case 28:
            name = "p_ji_s_1"
        case 29:
            name = "p_ji_w_1"
        case 30:
            name = "p_ji_n_1"
        case 31:
            name = "p_no_1"
        case 32:
            name = "p_ji_h_1"
        case 33:
            name = "p_ji_c_1"
            
        case 36:
            name = "p_ms5_1r"
        case 37:
            name = "p_ps5_1r"
        case 38:
            name = "p_ss5_1r"
        default:
            name = "p_rev"
        }
        
        return name
        
    }
}
