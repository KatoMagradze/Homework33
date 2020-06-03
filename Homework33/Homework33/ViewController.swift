//
//  ViewController.swift
//  Homework33
//
//  Created by Kato on 6/3/20.
//  Copyright © 2020 TBC. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        drawSquare()
    }
    
    func drawSquare() {
        let renderer = UIGraphicsImageRenderer(size: CGSize(width: imageView.frame.width, height: imageView.frame.height))
        
        let image = renderer.image { (ctx) in
            let square = CGRect(x: 0, y: 0, width: imageView.frame.width, height: imageView.frame.height)
            
            let yellowColor = hexStringToUIColor(hex: "#f8e71c")
            let blueColor = hexStringToUIColor(hex: "#51e1c0")
            
            ctx.cgContext.setFillColor(yellowColor.cgColor)
            ctx.cgContext.setStrokeColor(blueColor.cgColor)
            ctx.cgContext.setLineWidth(35)
            
            ctx.cgContext.addRect(square)
            ctx.cgContext.drawPath(using: .fillStroke)
        }
        
        imageView.image = image
    }
}

func hexStringToUIColor (hex:String) -> UIColor {
    var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()

    if (cString.hasPrefix("#")) {
        cString.remove(at: cString.startIndex)
    }

    if ((cString.count) != 6) {
        return UIColor.gray
    }

    var rgbValue:UInt64 = 0
    Scanner(string: cString).scanHexInt64(&rgbValue)

    return UIColor(
        red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
        green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
        blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
        alpha: CGFloat(1.0)
    )
}

