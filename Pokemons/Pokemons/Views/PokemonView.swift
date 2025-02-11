//
//  PokemonView.swift
//  Pokemons
//
//  Created by User on 10/02/25.
//

import SwiftUI

struct PokemonView: View {
    @EnvironmentObject var viewModel: PokemonViewModel
    let pokemon: Pokemon
    let dimension: Double = 140
    
    var body: some View {
        VStack(spacing: 8) {
            ZStack {
                RoundedRectangle(cornerRadius: 20)
                    .fill(Color.white.opacity(0.2))
                    .frame(width: dimension + 30, height: dimension + 30)
                
                AsyncImage(url: URL(string: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/\(viewModel.getPokemonIndex(pokemon: pokemon)).png")) { image in
                    image
                        .resizable()
                        .interpolation(.high)
                        .scaledToFit()
                        .frame(width: dimension, height: dimension)
                        .padding(15)
                } placeholder: {
                    ProgressView()
                        .frame(width: dimension, height: dimension)
                }
            }
            .background(.ultraThinMaterial)
            .clipShape(RoundedRectangle(cornerRadius: 20))
            .overlay(
                RoundedRectangle(cornerRadius: 20)
                    .strokeBorder(Color("font").opacity(0.2), lineWidth: 1)
            )
            .shadow(color: Color("font").opacity(0.3), radius: 8, x: 0, y: 4)
            
            Text(pokemon.name.capitalized)
                .font(.system(size: 16, weight: .semibold, design: .rounded))
                .foregroundColor(Color("font"))
                .padding(.vertical, 8)
                .padding(.horizontal, 16)
                .background(
                    Capsule()
                        .fill(Color("font").opacity(0.1))
                )
        }
        .padding(.vertical, 8)
    }
}

#Preview {
    PokemonView(pokemon: Pokemon.samplePokemon)
        .environmentObject(PokemonViewModel())
        .preferredColorScheme(.dark)
}
