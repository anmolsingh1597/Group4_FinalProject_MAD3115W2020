//
//  String+Extension.swift
//  Group4_FinalProject_MAD3115W2020
//
//  Created by Anmol singh on 2020-03-25.
//  Copyright © 2020 Swift Project. All rights reserved.
//

import Foundation

extension String{
    func toDouble() -> Double? {
        return NumberFormatter().number(from: self)?.doubleValue
     }
    }

