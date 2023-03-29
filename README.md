# Homebrew-Axelard

This repository is for installing the Axelard software on macOS (Darwin) systems. The supported versions are: 0.10.7, 0.13.6, 0.14.1, 0.16.1, 0.17.3, 0.18.3, 0.19.4, 0.21.1, 0.24.0, 0.26.5, 0.28.0, 0.29.1, 0.31.2, 0.32.2.

A Homebrew formula is provided for each version.

## Registering the Formula in Homebrew

To register formulaes in Homebrew, run:
```
brew tap axelarnetwork/axelard https://github.com/axelarnetwork/homebrew-axelard.git
```

## Installing a Specific Version

To install a specific version, run:
```
brew install axelarnetwork/axelard/axelard@0.10.7
```

## Alias and Default Version

An alias has been created in the `Aliases` folder. The current default version, if no specific version is specified, will be 0.32.2.
To install the default version, run:
```
brew install axelarnetwork/axelard/axelard
```
## Uninstall a Specific Version

When using Homebrew to install versioned formulas, you need to specify the version when removing them
To uninstall a specific version, run:
```
brew remove axelarnetwork/axelard/axelard@0.10.7
```

