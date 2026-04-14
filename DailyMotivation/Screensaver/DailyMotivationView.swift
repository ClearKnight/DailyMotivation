import ScreenSaver
import AppKit

final class DailyMotivationView: ScreenSaverView {
    private var timeLabel: NSTextField!
    private var quoteTextField: NSTextField!
    private var authorTextField: NSTextField!
    private var wallpaperImageView: NSImageView!

    private let quoteManager = QuoteManager.shared

    override init?(frame: NSRect, isPreview: Bool) {
        super.init(frame: frame, isPreview: isPreview)
        setupViews()
        loadWallpaper()
        displayRandomQuote()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupViews()
        loadWallpaper()
        displayRandomQuote()
    }

    private func loadWallpaper() {
        guard let screen = NSScreen.screens.first,
              let wallpaperPath = NSWorkspace.shared.desktopImageURL(for: screen)?.path else {
            return
        }
        wallpaperImageView.image = NSImage(contentsOfFile: wallpaperPath)
    }

    private func setupViews() {
        wantsLayer = true

        // 背景图片层
        wallpaperImageView = NSImageView(frame: bounds)
        wallpaperImageView.imageScaling = .scaleAxesIndependently
        wallpaperImageView.autoresizingMask = [.width, .height]
        addSubview(wallpaperImageView)

        // Time label - upper center
        timeLabel = NSTextField(labelWithString: "")
        timeLabel.font = NSFont.systemFont(ofSize: 48, weight: .light)
        timeLabel.textColor = .white
        timeLabel.alignment = .center
        timeLabel.translatesAutoresizingMaskIntoConstraints = false
        addSubview(timeLabel)

        // Quote text - center
        quoteTextField = NSTextField(labelWithString: "")
        quoteTextField.font = NSFont.systemFont(ofSize: 48, weight: .medium)
        quoteTextField.textColor = .white
        quoteTextField.alignment = .center
        quoteTextField.lineBreakMode = .byWordWrapping
        quoteTextField.maximumNumberOfLines = 0
        quoteTextField.translatesAutoresizingMaskIntoConstraints = false
        addSubview(quoteTextField)

        // Author text - below quote
        authorTextField = NSTextField(labelWithString: "")
        authorTextField.font = NSFont.systemFont(ofSize: 20, weight: .regular)
        authorTextField.textColor = NSColor.white.withAlphaComponent(0.7)
        authorTextField.alignment = .center
        authorTextField.translatesAutoresizingMaskIntoConstraints = false
        addSubview(authorTextField)

        // Add shadow to all text fields for readability
        addTextShadow(to: timeLabel)
        addTextShadow(to: quoteTextField)
        addTextShadow(to: authorTextField)

        NSLayoutConstraint.activate([
            timeLabel.topAnchor.constraint(equalTo: topAnchor, constant: 260),
            timeLabel.centerXAnchor.constraint(equalTo: centerXAnchor),

            quoteTextField.centerXAnchor.constraint(equalTo: centerXAnchor),
            quoteTextField.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 120),
            quoteTextField.leadingAnchor.constraint(greaterThanOrEqualTo: leadingAnchor, constant: 60),
            quoteTextField.trailingAnchor.constraint(lessThanOrEqualTo: trailingAnchor, constant: -60),

            authorTextField.topAnchor.constraint(equalTo: quoteTextField.bottomAnchor, constant: 20),
            authorTextField.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])

        updateTime()
    }

    private func addTextShadow(to label: NSTextField) {
        label.wantsLayer = true
        let shadow = NSShadow()
        shadow.shadowColor = NSColor.black.withAlphaComponent(0.6)
        shadow.shadowBlurRadius = 6
        shadow.shadowOffset = NSSize(width: 2, height: 2)
        label.shadow = shadow
    }

    private func updateTime() {
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm:ss"
        timeLabel.stringValue = formatter.string(from: Date())
    }

    private func displayRandomQuote() {
        let quote = quoteManager.getRandomQuote()
        quoteTextField.stringValue = "「\(quote.text)」"
        authorTextField.stringValue = "—— \(quote.author)"
    }

    override func startAnimation() {
        super.startAnimation()
        displayRandomQuote()
    }

    override func animateOneFrame() {
        updateTime()
    }

    override var hasConfigureSheet: Bool {
        return false
    }

    override var configureSheet: NSWindow? {
        return nil
    }
}
