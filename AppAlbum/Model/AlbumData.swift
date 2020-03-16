

import Foundation
struct AlbumData : Codable {
//	let albumId : Any?
//	let id : Any?
	let title : String?
	let url : String?
	let thumbnailUrl : String?

	enum CodingKeys: String, CodingKey {

//		case albumId = "albumId"
//		case id = "id"
		case title = "title"
		case url = "url"
		case thumbnailUrl = "thumbnailUrl"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
//		albumId = try values.decodeIfPresent(Any.self, forKey: .albumId)
//		id = try values.decodeIfPresent(Any.self, forKey: .id)
		title = try values.decodeIfPresent(String.self, forKey: .title)
		url = try values.decodeIfPresent(String.self, forKey: .url)
		thumbnailUrl = try values.decodeIfPresent(String.self, forKey: .thumbnailUrl)
	}

}
