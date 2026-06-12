//
//  Models.swift
//  GymGirlie
//
//  Created by Mia Sundman on 4/18/26.
//
import Foundation

struct SpotifyPlaylist: Identifiable {
    let id: String
    let name: String
    let totalTracks: Int
    let imageUrl: URL?
}

struct UserPlaylistsResponse: Codable {
    let items: [PlaylistObject]
}

struct PlaylistObject: Codable {
    let id: String
    let name: String
    let images: [ImageObject]?
    let tracks: TracksReferenceObject
}

struct ImageObject: Codable {
    let url: String
}

struct TracksReferenceObject: Codable {
    let total: Int
}
