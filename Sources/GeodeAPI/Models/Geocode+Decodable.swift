import struct Geode.Geocode

extension Geocode: Decodable {
	// MARK: Decodable
	public init(from decoder: Decoder) throws {
		let container = try decoder.container(keyedBy: CodingKeys.self)
		self.init(
			formattedAddress: try container.decode(String.self, forKey: .formattedAddress)
		)
	}
}

// MARK -
private extension Geocode {
	enum CodingKeys: String, CodingKey {
		case formattedAddress
	}
}