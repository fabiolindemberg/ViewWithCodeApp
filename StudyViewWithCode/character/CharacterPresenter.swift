//
//  Presenter.swift
//  StudyViewWithCode
//
//  Created by Fabio Lindemberg on 11/06/20.
//  Copyright © 2020 Fabio Lindemberg. All rights reserved.
//

import Foundation

protocol CharacterPresenterDelegate {
    func loadData()
    func loadDataFail(message: String)
}

class CharacterPresenter {
    
    var delegate: CharacterPresenterDelegate?
    var characters: [Character] = []
    
    init(delegate: CharacterPresenterDelegate?) {
        self.delegate = delegate
        loadData()
    }
    
    func loadData() {
        CharacterService().loadCharacter() { [weak self] (characters, error) in
            
            guard error == nil else {
                self?.delegate?.loadDataFail(message: error.debugDescription)
                return
            }
            
            self?.characters = characters ?? []
            self?.delegate?.loadData()
        }
    }
}

class CharacterService{
    func loadCharacter(completion: @escaping (_ characters: [Character]?,_ error: Error?)->Void ){
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
            do {
                let decoder = JSONDecoder()
                decoder.dateDecodingStrategy = .iso8601
                
                guard let data = json.data(using: .utf8) else { return }
                    
                let characters = try JSONDecoder().decode([Character].self, from: data)
                
                completion(characters, nil)
            } catch {
                print(error)
                completion(nil, error)
            }
        }
    }
}
