//
//  ContentView.swift
//  Pokemons
//
//  Created by User on 10/02/25.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var viewModel = PokemonViewModel()
    
    private let adaptiveColumns = [
        GridItem(.adaptive(minimum: 250)),
        GridItem(.adaptive(minimum: 250)),
    ]
    
    var body: some View {
        NavigationView {
            ZStack {
                Color("bg").ignoresSafeArea()
                ScrollView {
                    LazyVGrid(columns: adaptiveColumns, spacing: 10) {
                        ForEach(viewModel.filteredPokemon) { pokemon in
                            NavigationLink(destination: PokemonDetailView(pokemon: pokemon)) {
                                PokemonView(pokemon: pokemon)
                            }.foregroundColor(Color("font"))
                        }
                    }
                    .animation(.easeIn(duration: 0.3), value: viewModel.filteredPokemon.count)
                    .navigationTitle("Pokedex")
                    .padding()
                }.searchable(text: $viewModel.searchText)
                .shadow(color: Color("font"), radius: 5)
            }
        }.environmentObject(viewModel)
            .accentColor(Color("font"))
    }
}

#Preview {
    ContentView()
}
