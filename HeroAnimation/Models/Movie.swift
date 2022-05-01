//
//  Movie.swift
//  HeroAnimation
//
//  Created by Visarut Tippun on 1/5/22.
//

import Foundation

struct Movie: Identifiable {
    var id: UUID = UUID()
    var name: String
    var image: String
}

var movies: [Movie] = [
    Movie(name: "The Batman", image: "movie1"),
    Movie(name: "Uncharted", image: "movie2"),
    Movie(name: "Halo", image: "movie3"),
    Movie(name: "Interstellar", image: "movie4"),
    Movie(name: "The Batman", image: "movie5"),
    Movie(name: "Hobb and Shaw", image: "movie6"),
    Movie(name: "Loki", image: "movie7")
]

var sampleText: String = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam cursus eros nulla, vitae ultrices lectus molestie nec. Aenean fermentum dui et nisi dapibus sagittis. Aliquam scelerisque ex nisl, at rutrum urna accumsan ac. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Curabitur lacinia enim at mollis facilisis. Aliquam in massa sit amet augue porttitor rutrum. Mauris sit amet posuere ex. In efficitur, nibh nec egestas fermentum, erat felis condimentum est, ut tincidunt leo magna vel metus. Suspendisse ipsum elit, sodales cursus justo vel, rutrum rutrum nibh.\nSed bibendum ante sit amet tellus semper commodo. Nam et nunc pharetra, euismod ante non, mollis arcu. Suspendisse vel nunc pretium, commodo purus in, efficitur ipsum. In semper vel lectus id dictum. Suspendisse urna purus, molestie quis nisi malesuada, rhoncus viverra lectus. Integer finibus hendrerit augue, sed euismod neque blandit vitae. Vivamus ultricies nibh ac est dictum lacinia. Ut pharetra mauris nec ligula rutrum, aliquet dictum nunc varius. Vivamus et libero nulla. Mauris nec enim euismod, dictum lorem non, tincidunt nunc. Fusce vehicula sodales mauris vitae pulvinar. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris semper malesuada risus in cursus. Praesent molestie congue velit in feugiat. Ut in viverra turpis. Duis congue elementum ipsum, id elementum nisi convallis laoreet."
