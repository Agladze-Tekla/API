//
//  MovieCollection.swift
//  anything
//
//  Created by Tekla on 11/3/23.
//

import UIKit

struct MovieInfo {
    let title: String
    let image: UIImage?
    let rating: Double
    let synopsis: String
    let certificate: String
    let runtime: String
    let release: String
    let genre: String
    let director: String
    let cast: String
    
    static let movieList = [
    MovieInfo(
    title: "How To Train Your Dragon",
        image: UIImage(named: "howtotrainyourdragon.jpg"),
        rating: 8.1,
        synopsis: "A hapless young Viking who aspires to hunt dragons becomes the unlikely friend of a young dragon himself, and learns there may be more to the creatures than he assumed.",
        certificate: "PG",
        runtime: "1:38",
        release: "2010",
        genre: "Animation, Action, Adventure",
        director: "Dean DeBlois, Chris Sanders",
        cast: "Jay Baruchel, Gerard Butler, Kristen Wiig"
    ),
        MovieInfo(
        title: "Howl's Moving Castle",
            image: UIImage(named: "movingcastle.jpg"),
            rating: 8.2,
            synopsis: " When an unconfident young woman is cursed with an old body by a spiteful witch, her only chance of breaking the spell lies with a self-indulgent yet insecure young wizard and his companions in his legged, walking castle.",
            certificate: "PG",
            runtime: "1:59",
            release: "2004",
            genre: "Animation, Adventure, Family",
            director: "Hayao Miyazaki",
            cast: "Chieko Baisho, Takuya Kimura, Tatsuya Gashuin"
        ),
        
        MovieInfo(
        title: "The Mitchells VS The Machines",
            image: UIImage(named: "mitchellsvsmachines.jpg"),
            rating: 7.6,
            synopsis: "A quirky, dysfunctional family's road trip is upended when they find themselves in the middle of the robot apocalypse and suddenly become humanity's unlikeliest last hope.",
            certificate: "PG",
            runtime: "1:54",
            release: "2021",
            genre: "Animation, Action, Adventure",
            director: "Michael Rianda, Jeff Rowe",
            cast: "Abbi Jacobson, Danny McBride, Maya Rudolph"
        ),
        MovieInfo(
        title: "Spider-Man: Across the Spider-Verse",
            image: UIImage(named: "spiderverse"),
            rating: 8.7,
            synopsis: "Miles Morales catapults across the Multiverse, where he encounters a team of Spider-People charged with protecting its very existence. When the heroes clash on how to handle a new threat, Miles must redefine what it means to be a hero.",
            certificate: "PG",
            runtime: "2:20",
            release: "2023",
            genre: "Animation, Action, Adventure",
            director: "Joaquim Dos Santos, Kemp Powers, Justin K. Thompson",
            cast: "Shameik Moore, Hailee Steinfeld, Brian Tyree Henry, Luna Lauren Velez"
        ),
        
        MovieInfo(
        title: "Big Hero 6",
            image: UIImage(named: "bighero6.jpg"),
            rating: 7.8,
            synopsis: "A special bond develops between plus-sized inflatable robot Baymax and prodigy Hiro Hamada, who together team up with a group of friends to form a band of high-tech heroes.",
            certificate: "PG",
            runtime: "1:42",
            release: "2014",
            genre: "Animation, Action, Adventure",
            director: "Don Hall, Chris Williams",
            cast: "Ryan Potter, Scott Adsit, Jamie Chung"
        ),
        
        
        MovieInfo(
        title: "Brave",
            image: UIImage(named: "brave.jpg"),
            rating: 7.1,
            synopsis: "Determined to make her own path in life, Princess Merida defies a custom that brings chaos to her kingdom. Granted one wish, Merida must rely on her bravery and her archery skills to undo a beastly curse.",
            certificate: "PG",
            runtime: "1:33",
            release: "2012",
            genre: "Animation, Action, Adventure",
            director: "Mark Andrews, Brenda Chapman, Steve Purcell",
            cast: "Kelly Macdonald, Billy Connolly, Emma Thompson, Julie Walters"
        ),
        
        MovieInfo(
        title: "Kung Fu Panda",
            image: UIImage(named: "kungfupanda.jpg"),
            rating: 7.6,
            synopsis: "To everyone's surprise, including his own, Po, an overweight, clumsy panda, is chosen as protector of the Valley of Peace. His suitability will soon be tested as the valley's arch-enemy is on his way.",
            certificate: "PG",
            runtime: "1:32",
            release: "2008",
            genre: "Animation, Action, Adventure",
            director: "Mark OsborneJohn Stevenson",
            cast: "Jack Black, Ian McShane, Angelina Jolie, Jackie Chan, Lucy Liu"
        ),
        
    ]
}
