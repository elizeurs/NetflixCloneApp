//
//  YoutubeSearchResponse.swift
//  Netflix Clone
//
//  Created by Elizeu RS on 24/06/23.
//

import Foundation

struct YoutubeSearchResponse: Codable {
    let etag: String
    let items: [VideoElement]
    let kind: String
    let nextPageToken: String
    let pageInfo: PageInfo
    let regionCode: String
}

struct VideoElement: Codable {
    let etag: String
    let id: IdVideoElement
    let kind: String
}

struct IdVideoElement: Codable {
    let kind: String
    let videoId: String?
    let playlistId: String?
}

struct PageInfo: Codable {
    let resultsPerPage: Int
    let totalResults: Int
}


//struct YoutubeSearchResponse: Codable {
//  let items: [VideoElement]
//}
//
//struct VideoElement: Codable {
//  let id: IdVideoElement
//}
//
//struct IdVideoElement: Codable {
//  let kind: String
//  let videoId: String
//}

//{
//    etag = "HfbvwfjHDiHxTQ-CbbOYQWBrx_k";
//    items =     (
//                {
//            etag = UjX6nYp7e6MAH9bNyznG2F1I04o;
//            id =             {
//                kind = "youtube#playlist";
//                playlistId = PLtaUENgpLiNxX73JW1sflhW5sxawELwt2;
//            };
//            kind = "youtube#searchResult";
//        },
//                {
//            etag = AXfWuSRg3BcuP22cgw0AmoauUKk;
//            id =             {
//                kind = "youtube#video";
//                videoId = BjaKUmmzlXI;
//            };
//            kind = "youtube#searchResult";
//        },
//                {
//            etag = "lk8409-m28s-u0WqMRhDC0vgfsE";
//            id =             {
//                kind = "youtube#video";
//                videoId = 0Dj2kq5Neus;
//            };
//            kind = "youtube#searchResult";
//        },
//                {
//            etag = KxXTNPBxd0s24a9w5WLV9oHdTy8;
//            id =             {
//                kind = "youtube#video";
//                videoId = "7CfEZ6_oic8";
//            };
//            kind = "youtube#searchResult";
//        },
//                {
//            etag = "zVUdYoYNuccpXIyV-RwWwPa05mE";
//            id =             {
//                kind = "youtube#video";
//                videoId = "_dJH0RxSQK4";
//            };
//            kind = "youtube#searchResult";
//        }
//    );
//    kind = "youtube#searchListResponse";
//    nextPageToken = CAUQAA;
//    pageInfo =     {
//        resultsPerPage = 5;
//        totalResults = 1000000;
//    };
//    regionCode = BR;
//}
