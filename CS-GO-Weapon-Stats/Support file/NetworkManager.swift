//
//  NetworkManager.swift
//  CS-GO-Weapon-Stats
//
//  Created by Vlad Lytvynets on 19.02.2022.
//

import Foundation

class NetworkManager: NetworkManagerProtocol {
    func getRequest(withSteamId steamId: String, forIndex index: Int, completionHandler:@escaping (StatsInfoModel) -> Void){
        let urlString = "https://public-api.tracker.gg/v2/csgo/standard/profile/steam/\(steamId)/segments/weapon/?TRN-Api-Key=a216fc00-32ca-4827-ad36-2725ca0831da"
        guard let url = URL(string: urlString) else { return }
        let session = URLSession(configuration: .default)
        session.dataTask(with: url) { (data, response, error) in
            if let data = data{
                if let statsCS = self.parseJson(forIndex: index, withData: data){
                    completionHandler(statsCS)
                }
            }
        }.resume()
    }
    
    
    func parseJson(forIndex index: Int,  withData data: Data) -> StatsInfoModel? {
        let decoder = JSONDecoder()
        do {
            let statsCSData = try decoder.decode(ModelCS.self, from: data)
            guard let statsCS = StatsInfoModel(CSGOStats: statsCSData, index: index) else { return nil }
            return statsCS
        } catch {
            print(error)
        }
        return nil
    }
}
