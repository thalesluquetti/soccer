// Generated using Sourcery 2.1.1 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
// swiftlint:disable line_length

struct Secret {
    private static func decode(_ encoded: [UInt8]) -> String {
        let length = encoded.count / 2
        let bytes: [UInt8] = zip(encoded.prefix(length), encoded.suffix(length)).map(^)
        return String(decoding: bytes, as: UTF8.self)
    }

    static var soccerApiKey: String {
        let bytes: [UInt8] = [120, 198, 155, 68, 253, 47, 246, 247, 2, 252, 103, 135, 17, 3, 44, 191, 126, 4, 211, 244, 84, 9, 126, 223, 193, 52, 108, 106, 108, 142, 174, 116, 172, 151, 71, 74, 8, 244, 73, 225, 142, 236, 6, 41, 145, 243, 91, 23, 32, 37, 30, 244, 250, 119, 152, 75, 198, 146, 103, 205, 10, 244, 121, 98, 27, 143, 24, 101, 181, 197, 99, 61, 77, 235, 247, 4, 9, 14, 28, 191, 158, 71, 153, 175, 113, 32, 123, 154, 127, 211, 237, 216, 99, 77, 169, 199, 106, 114, 22, 64]
        return decode(bytes)
    }
}
