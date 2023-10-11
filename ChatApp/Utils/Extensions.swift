//
//  Extensions.swift
//  ChatApp
//
//  Created by Volkan Celik on 07/07/2023.
//

import UIKit


extension UIApplication{
    func endEditing(){
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
