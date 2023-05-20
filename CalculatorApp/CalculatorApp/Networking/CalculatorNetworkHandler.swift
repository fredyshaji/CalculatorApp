//
//  CalculatorNetworkHandler.swift
//  Calculator
//
//  Created by Fredy Shaji on 2023-05-20.
//

import Foundation
import Coinpaprika

class CalculatorNetworkHandler {
    func fetchBitcoinValue(completion: @escaping (Decimal?, Error?) -> Void) {
        Coinpaprika.API.ticker(id: "btc-bitcoin", quotes: [.usd]).perform { (response) in
            switch response {
            case .success(let ticker):
                let price = ticker[.usd].price
                completion(price, nil)
            case .failure(let error):
                completion(nil, error)
            }
        }
    }
}
