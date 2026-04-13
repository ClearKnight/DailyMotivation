import Foundation

struct Quote: Codable {
    let text: String
    let author: String
}

final class QuoteManager {
    static let shared = QuoteManager()

    private var quotes: [Quote] = []

    private init() {
        loadQuotes()
    }

    private func loadQuotes() {
        guard let url = Bundle.main.url(forResource: "quotes", withExtension: "json"),
              let data = try? Data(contentsOf: url),
              let decoded = try? JSONDecoder().decode([Quote].self, from: data) else {
            quotes = defaultQuotes()
            return
        }
        quotes = decoded
    }

    func getRandomQuote() -> Quote {
        return quotes.randomElement() ?? defaultQuotes().first!
    }

    private func defaultQuotes() -> [Quote] {
        return [
            Quote(text: "纵有狂风拔地起，我亦乘风破万里", author: "李白"),
            Quote(text: "长风破浪会有时，直挂云帆济沧海", author: "李白"),
            Quote(text: "会当凌绝顶，一览众山小", author: "杜甫"),
            Quote(text: "路漫漫其修远兮，吾将上下而求索", author: "屈原"),
            Quote(text: "天行健，君子以自强不息", author: "周易"),
            Quote(text: "地势坤，君子以厚德载物", author: "周易"),
            Quote(text: "业精于勤，荒于嬉；行成于思，毁于随", author: "韩愈"),
            Quote(text: "不积跬步，无以至千里；不积小流，无以成江海", author: "荀子"),
            Quote(text: "千淘万漉虽辛苦，吹尽狂沙始到金", author: "刘禹锡"),
            Quote(text: "纸上得来终觉浅，绝知此事要躬行", author: "陆游")
        ]
    }
}
