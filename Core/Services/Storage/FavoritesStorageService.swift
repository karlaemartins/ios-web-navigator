//
//  FavoritesStorageService.swift
//  WebNavigator
//
//  Created by Karla E. Martins Fernandes on 14/04/26.
//

import Foundation


final class FavoritesStorageService: StorageServiceProtocol {
    
    private let defaults = UserDefaults.standard
    private let sitesKey = "favorite_sites"
    private let deletedSitesKey = "last_deleted_sites"
    
    
    func saveSites(_ sites: [Site]) {
        do {
            let data = try JSONEncoder().encode(sites)
            defaults.set(data, forKey: sitesKey)
        } catch {
            print("Erro ao salvar sites:", error)
        }
    }
    
    func loadSites() -> [Site] {
        guard let data = defaults.data(forKey: sitesKey) else {
            return []
        }
        
        do {
            let sites = try JSONDecoder().decode([Site].self, from: data)
            return sites
        } catch {
            print("Erro ao carregar sites:", error)
            return []
        }
    }
    
    //recovery
    func saveLastDeletedSites(_ sites: [Site]) {
        do {
            let data = try JSONEncoder().encode(sites)
            defaults.set(data, forKey: deletedSitesKey)
        } catch {
            print("Erro ao salvar sites:", error)
        }
    }
    
    //recovery
    func loadLastDeletedSites() -> [Site] {
        guard let data = defaults.data(forKey: deletedSitesKey) else {
            return []
        }
        
        do {
            let sites = try JSONDecoder().decode([Site].self, from: data)
            return sites
        } catch {
            print("Erro ao carregar sites:", error)
            return []
        }
    }
}
