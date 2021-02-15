//
//  PokedeView.swift
//  Prueba Tecnica
//
//  Created by LMAG on 13/02/21.
//

import SwiftUI
import SDWebImageSwiftUI
import Alamofire
import SwiftyJSON

struct PokedeView: View {
    @ObservedObject var obs = observed()
    private let griItems = [GridItem(.flexible())]
    
  
    
    var body: some View {
        NavigationView {
            ScrollView{
                List(viewModel.pokemons,id: \.id) {
                   pokemonItem in
                    Text(pokemonItem.name)
                }
            }
            .navigationTitle("Pokedex")
        }
       
    }
}

struct PokedeView_Previews: PreviewProvider {
    static var previews: some View {
        PokedeView()
    }
}

class observed : ObservableObject{
    @Published var datas = [PokeDexModel]()
    init (){
        AF.request("https://pokeapi.co/api/v2/pokemon/ditto").responseData {
            (data) in let json = try! JSON(data: data.data!)
            for i in json {self.datas.append(PokeDexModel(abilities: i.1["Ability"].array:[Ability], baseExperience: , forms: <#T##[Species]#>, gameIndices: <#T##[GameIndex]#>, height: <#T##Int#>, heldItems: <#T##[HeldItem]#>, id: <#T##Int#>, isDefault: <#T##Bool#>, locationAreaEncounters: <#T##String#>, moves: <#T##[Move]#>, name: <#T##String#>, order: <#T##Int#>, species: <#T##Species#>, sprites: <#T##Sprites#>, stats: <#T##[Stat]#>, types: <#T##[TypeElement]#>, weight: <#T##Int#>))}
        }
    }
    
}

// MARK: - PokeDexModel
struct PokeDexModel {
    let abilities: [Ability]
    let baseExperience: Int
    let forms: [Species]
    let gameIndices: [GameIndex]
    let height: Int
    let heldItems: [HeldItem]
    let id: Int
    let isDefault: Bool
    let locationAreaEncounters: String
    let moves: [Move]
    let name: String
    let order: Int
    let species: Species
    let sprites: Sprites
    let stats: [Stat]
    let types: [TypeElement]
    let weight: Int
}

// MARK: - Ability
struct Ability {
    let ability: Species
    let isHidden: Bool
    let slot: Int
}

// MARK: - Species
struct Species {
    let name: String
    let url: String
}

// MARK: - GameIndex
struct GameIndex {
    let gameIndex: Int
    let version: Species
}

// MARK: - HeldItem
struct HeldItem {
    let item: Species
    let versionDetails: [VersionDetail]
}

// MARK: - VersionDetail
struct VersionDetail {
    let rarity: Int
    let version: Species
}

// MARK: - Move
struct Move {
    let move: Species
    let versionGroupDetails: [VersionGroupDetail]
}

// MARK: - VersionGroupDetail
struct VersionGroupDetail {
    let levelLearnedAt: Int
    let moveLearnMethod, versionGroup: Species
}

// MARK: - GenerationV
struct GenerationV {
    let blackWhite: Sprites
}

// MARK: - GenerationIv
struct GenerationIv {
    let diamondPearl, heartgoldSoulsilver, platinum: Sprites
}

// MARK: - Versions
struct Versions {
    let generationI: GenerationI
    let generationIi: GenerationIi
    let generationIii: GenerationIii
    let generationIv: GenerationIv
    let generationV: GenerationV
    let generationVi: [String: GenerationVi]
    let generationVii: GenerationVii
    let generationViii: GenerationViii
}

// MARK: - Sprites
class Sprites {
    let backDefault: String
    let backFemale: NSNull
    let backShiny: String
    let backShinyFemale: NSNull
    let frontDefault: String
    let frontFemale: NSNull
    let frontShiny: String
    let frontShinyFemale: NSNull
    let other: Other?
    let versions: Versions?
    let animated: Sprites?

    init(backDefault: String, backFemale: NSNull, backShiny: String, backShinyFemale: NSNull, frontDefault: String, frontFemale: NSNull, frontShiny: String, frontShinyFemale: NSNull, other: Other?, versions: Versions?, animated: Sprites?) {
        self.backDefault = backDefault
        self.backFemale = backFemale
        self.backShiny = backShiny
        self.backShinyFemale = backShinyFemale
        self.frontDefault = frontDefault
        self.frontFemale = frontFemale
        self.frontShiny = frontShiny
        self.frontShinyFemale = frontShinyFemale
        self.other = other
        self.versions = versions
        self.animated = animated
    }
}

// MARK: - GenerationI
struct GenerationI {
    let redBlue, yellow: RedBlue
}

// MARK: - RedBlue
struct RedBlue {
    let backDefault, backGray, frontDefault, frontGray: String
}

// MARK: - GenerationIi
struct GenerationIi {
    let crystal, gold, silver: Crystal
}

// MARK: - Crystal
struct Crystal {
    let backDefault, backShiny, frontDefault, frontShiny: String
}

// MARK: - GenerationIii
struct GenerationIii {
    let emerald: Emerald
    let fireredLeafgreen, rubySapphire: Crystal
}

// MARK: - Emerald
struct Emerald {
    let frontDefault, frontShiny: String
}

// MARK: - GenerationVi
struct GenerationVi {
    let frontDefault: String
    let frontFemale: NSNull
    let frontShiny: String
    let frontShinyFemale: NSNull
}

// MARK: - GenerationVii
struct GenerationVii {
    let icons: DreamWorld
    let ultraSunUltraMoon: GenerationVi
}

// MARK: - DreamWorld
struct DreamWorld {
    let frontDefault: String
    let frontFemale: NSNull
}

// MARK: - GenerationViii
struct GenerationViii {
    let icons: DreamWorld
}

// MARK: - Other
struct Other {
    let dreamWorld: DreamWorld
    let officialArtwork: OfficialArtwork
}

// MARK: - OfficialArtwork
struct OfficialArtwork {
    let frontDefault: String
}

// MARK: - Stat
struct Stat {
    let baseStat, effort: Int
    let stat: Species
}

// MARK: - TypeElement
struct TypeElement {
    let slot: Int
    let type: Species
}
