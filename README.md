[![License][license badge]][license]

# chime-swift
A [Chime][chime] extension for Swift.

## Overview

This Chime extension supports the [Swift][swift] programming language. It integrates [sourcekit-lsp][sourcekit-lsp] with [ChimeKit][chimekit]'s `ExtensionProtocol`.

This project is featured as a tutorial in ChimeKit's reference [documentation][documentation tutorial].

## Future Development

A language server is not required to provide semantic languages features to Chime. A way to expand this extension would be to directly integrate with SourceKit, possibly via [SourceKitten][sourcekitten]. This could offer a lower-overhead implementation, while also providing additional features not directly exposed via Language Server Protocol. Also would be pretty cool.

## Suggestions or Feedback

We'd love to hear from you! Get in touch via [twitter](https://twitter.com/chimehq), an issue, or a pull request.

Please note that this project is released with a [Contributor Code of Conduct](CODE_OF_CONDUCT.md). By participating in this project you agree to abide by its terms.

[license]: https://opensource.org/licenses/BSD-3-Clause
[license badge]: https://img.shields.io/github/license/ChimeHQ/chime-swift
[chime]: https://www.chimehq.com
[swift]: https://www.swift.org
[sourcekit-lsp]: https://github.com/apple/sourcekit-lsp
[sourcekitten]: https://github.com/jpsim/SourceKitten
[chimekit]: https://github.com/ChimeHQ/ChimeKit
[documentation tutorial]: https://swiftpackageindex.com/chimehq/chimekit/main/documentation
