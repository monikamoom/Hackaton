//
//  GraphIncomeViewController.swift
//  Procket
//
//  Created by s89506 on 25/7/2562 BE.
//  Copyright © 2562 s89506. All rights reserved.
//

import UIKit
import PieCharts

class GraphIncomeViewController: UIViewController {
    
    @IBOutlet weak var graphView: UIView!
    let chartView: PieChart = PieChart(frame: CGRect(x: 0, y: 50, width: 343, height: 307 ))

    override func viewDidLoad() {
        super.viewDidLoad()
        self.graphView.addSubview(chartView)

        
    }
    override func viewWillDisappear(_ animated: Bool) {
        chartView.clear()
        self.chartView.removeFromSuperview()
        
    }
    override func viewDidAppear(_ animated: Bool) {
        

        chartView.layers = [createCustomViewsLayer(), createTextLayer()]
        //chartView.delegate = self
        chartView.models = createModels() // order is important - models have to be set at the end
    }
    
    override func viewWillAppear(_ animated: Bool) {
        viewDidLoad()
    }
//    override func viewWillDisappear(_ animated: Bool) {
//        chartView.layers = []
//    }
//    override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(animated)
//        viewDidLoad()
//
//        chartView.layers = [createCustomViewsLayer(), createTextLayer()]
////        chartView.delegate = self
//        chartView.models = createModels() // order is important - models have to be set at the end
//
//    }

    fileprivate func createModels() -> [PieSliceModel] {
        let alpha: CGFloat = 0.5
        
        return [
            PieSliceModel(value: 2.1, color: #colorLiteral(red: 1, green: 0.8941176471, blue: 0.5647058824, alpha: 1)),
            PieSliceModel(value: 3, color: #colorLiteral(red: 0.5294117647, green: 1, blue: 0.7176470588, alpha: 1)),
            PieSliceModel(value: 1, color: #colorLiteral(red: 0.5333333333, green: 0.8588235294, blue: 0.9764705882, alpha: 1))
        ]
    }
    fileprivate func createCustomViewsLayer() -> PieCustomViewsLayer {
        let viewLayer = PieCustomViewsLayer()
        
        let settings = PieCustomViewsLayerSettings()
        settings.viewRadius = 100
        settings.hideOnOverflow = false
        viewLayer.settings = settings
        
        viewLayer.viewGenerator = createViewGenerator()
        
        return viewLayer
    }
    
    fileprivate func createTextLayer() -> PiePlainTextLayer {
        let textLayerSettings = PiePlainTextLayerSettings()
        textLayerSettings.viewRadius = 65
        textLayerSettings.hideOnOverflow = true
        textLayerSettings.label.font = UIFont.systemFont(ofSize: 12)
         textLayerSettings.label.font = UIFont.boldSystemFont(ofSize: 12.0)

        
        let formatter = NumberFormatter()
        formatter.maximumFractionDigits = 1
        textLayerSettings.label.textGenerator = {slice in
            return formatter.string(from: slice.data.percentage * 100 as NSNumber).map{"\($0)%"} ?? ""
        }
        
        let textLayer = PiePlainTextLayer()
        textLayer.settings = textLayerSettings
        return textLayer
    }
    
    fileprivate func createViewGenerator() -> (PieSlice, CGPoint) -> UIView {
        return {slice, center in
            
            let container = UIView()
            container.frame.size = CGSize(width: 30, height: 30)
            container.center = center
            let view = UIImageView()
            view.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
            container.addSubview(view)
            
            
            
            let imageName: String? = {
                switch slice.data.id {
                case 0: return "salaryIcon"
                case 1: return "giftIcon"
                case 2: return "otherInIcon"
                default: return nil
                }
            }()
            
            view.image = imageName.flatMap{UIImage(named: $0)}
            
            return container
        }
    }

}
