import struct Geode.Geocode
import struct Geode.Location

extension Geocode.Geometry: Decodable {
	// MARK: Decodable
	public init(from decoder: Decoder) throws {
		let container = try decoder.container(keyedBy: CodingKeys.self)
		self.init(
			location: try container.decode(Location.self, forKey: .location)
		)
	}
}

// MARK -
private extension Geocode.Geometry {
	enum CodingKeys: String, CodingKey {
		case location
	}
}
