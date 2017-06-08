# Changelog

All Notable changes to `php-psr` will be documented in this file.

Updates should follow the [Keep a CHANGELOG](http://keepachangelog.com/) principles.

## [Unreleased]

### Added
- PSR-11 Container support
- PSR-13 Link support
- PSR-16 Simple Cache support

### Removed
- No longer test against PHP 5.5 or earlier

## [0.2.3] - 2016-05-05

### Changed
- Changed the license from `LGPLv3` to `Simplified BSD License`
- Move PHP5/7 compatibility macros into separate header

## [0.2.2] - 2016-03-16

### Added
- arginfo for interfaces in headers

### Fixed 
- Memory leak in Psr\Log\AbstractLogger::log()
 
## [0.2.1] - 2015-12-15

### Changed
- PSR-6 [psr/cache](https://github.com/php-fig/cache) v1.0.0 is released without changes to interfaces since commit [4908941](https://github.com/php-fig/cache/commit/4908941)
- Test PSR-6 interfaces against Stash v1.0.0-dev branch

### Fixed
- Memory leak in Psr\Log\AbstractLogger::log() with PHP7

## [0.2.0] - 2015-12-09

### Changed
- Update PSR-6 interfaces for commits up to [4908941](https://github.com/php-fig/cache/commit/4908941)

### Fixed
- Invalid read in Psr\Log\AbstractLogger::log()

## 0.1.0 - 2015-08-07

### Added
- PSR-3 [psr/log](https://github.com/php-fig/log) v1.0.0 interfaces and classes
- PSR-6 [commit 2b812a4](https://github.com/php-fig/fig-standards/commit/2b812a4) interfaces
- PSR-7 [psr/http-message](https://github.com/php-fig/http-message) v1.0.0 interfaces


[Unreleased]: https://github.com/jbboehr/php-psr/compare/v0.2.3...HEAD
[0.2.3]: https://github.com/jbboehr/php-psr/compare/v0.2.2...v0.2.3
[0.2.2]: https://github.com/jbboehr/php-psr/compare/v0.2.1...v0.2.2
[0.2.1]: https://github.com/jbboehr/php-psr/compare/v0.2.0...v0.2.1
[0.2.0]: https://github.com/jbboehr/php-psr/compare/v0.1.0...v0.2.0
