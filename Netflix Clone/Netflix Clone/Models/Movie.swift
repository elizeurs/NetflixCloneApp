//
//  Movie.swift
//  Netflix Clone
//
//  Created by Elizeu RS on 15/06/23.
//

import Foundation

struct TrendingMoviesResponse: Codable {
  let results: [Movie]
}

struct Movie: Codable {
  let id: Int
  let media_type: String?
  let original_name: String?
  let original_title: String?
  let  poster_path: String?
  let overview: String?
  let vote_count: Int
  let release_date: String?
  let vote_average: Double
}


/*
 
 {
     page = 1;
     results =     (
                 {
             adult = 0;
             "backdrop_path" = "/7e9MVGg8efOhoA2R9XhZcGWTC5Z.jpg";
             "genre_ids" =             (
                 878,
                 28,
                 12
             );
             id = 298618;
             "media_type" = movie;
             "original_language" = en;
             "original_title" = "The Flash";
             overview = "When his attempt to save his family inadvertently alters the future, Barry Allen becomes trapped in a reality in which General Zod has returned and there are no Super Heroes to turn to. In order to save the world that he is in and return to the future that he knows, Barry's only hope is to race for his life. But will making the ultimate sacrifice be enough to reset the universe?";
             popularity = "837.201";
             "poster_path" = "/rktDFPbfHfUbArZ6OOOKsXcv0Bm.jpg";
             "release_date" = "2023-06-13";
             title = "The Flash";
             video = 0;
             "vote_average" = "6.747";
             "vote_count" = 81;
         },
                 {
             adult = 0;
             "backdrop_path" = "/4XM8DUTQb3lhLemJC51Jx4a2EuA.jpg";
             "genre_ids" =             (
                 28,
                 80,
                 53
             );
             id = 385687;
             "media_type" = movie;
             "original_language" = en;
             "original_title" = "Fast X";
             overview = "Over many missions and against impossible odds, Dom Toretto and his family have outsmarted, out-nerved and outdriven every foe in their path. Now, they confront the most lethal opponent they've ever faced: A terrifying threat emerging from the shadows of the past who's fueled by blood revenge, and who is determined to shatter this family and destroy everything\U2014and everyone\U2014that Dom loves, forever.";
             popularity = "13114.65";
             "poster_path" = "/fiVW06jE7z9YnO4trhaMEdclSiC.jpg";
             "release_date" = "2023-05-17";
             title = "Fast X";
             video = 0;
             "vote_average" = "7.369";
             "vote_count" = 1509;
         },
                 {
             adult = 0;
             "backdrop_path" = "/q7XOgkp0NfjqVRYxzU0eGg7wSrm.jpg";
             "first_air_date" = "2011-12-04";
             "genre_ids" =             (
                 10765,
                 18,
                 9648
             );
             id = 42009;
             "media_type" = tv;
             name = "Black Mirror";
             "origin_country" =             (
                 GB
             );
             "original_language" = en;
             "original_name" = "Black Mirror";
             overview = "A contemporary British re-working of The Twilight Zone with stories that tap into the collective unease about our modern world.\U00a0\n\nOver the last ten years, technology has transformed almost every aspect of our lives before we've had time to stop and question it. In every home; on every desk; in every palm - a plasma screen; a monitor; a smartphone - a black mirror of our 21st Century existence.";
             popularity = "277.431";
             "poster_path" = "/5UaYsGZOFhjFDwQh6GuLjjA1WlF.jpg";
             "vote_average" = "8.300000000000001";
             "vote_count" = 4071;
         },
                 {
             adult = 0;
             "backdrop_path" = "/l8z9gP7mAa7fIQql8KeeDX8n0at.jpg";
             "genre_ids" =             (
                 35,
                 12,
                 14
             );
             id = 798286;
             "media_type" = movie;
             "original_language" = en;
             "original_title" = "Beau Is Afraid";
             overview = "A paranoid man embarks on an epic odyssey to get home to his mother.";
             popularity = "79.27200000000001";
             "poster_path" = "/wgVkkjigF31r1nZV80uV0xNIoun.jpg";
             "release_date" = "2023-03-11";
             title = "Beau Is Afraid";
             video = 0;
             "vote_average" = "7.2";
             "vote_count" = 290;
         },
                 {
             adult = 0;
             "backdrop_path" = "/2I5eBh98Q4aPq8WdQrHdTC8ARhY.jpg";
             "genre_ids" =             (
                 28,
                 12,
                 16,
                 878
             );
             id = 569094;
             "media_type" = movie;
             "original_language" = en;
             "original_title" = "Spider-Man: Across the Spider-Verse";
             overview = "After reuniting with Gwen Stacy, Brooklyn\U2019s full-time, friendly neighborhood Spider-Man is catapulted across the Multiverse, where he encounters the Spider Society, a team of Spider-People charged with protecting the Multiverse\U2019s very existence. But when the heroes clash on how to handle a new threat, Miles finds himself pitted against the other Spiders and must set out on his own to save those he loves most.";
             popularity = "2471.835";
             "poster_path" = "/8Vt6mWEReuy4Of61Lnj5Xj704m8.jpg";
             "release_date" = "2023-05-31";
             title = "Spider-Man: Across the Spider-Verse";
             video = 0;
             "vote_average" = "8.726000000000001";
             "vote_count" = 1310;
         },
 
 ...
 */
