Changelog
=========
#### Version 2.1.1
* Upgrade AWC version to 2.1.2

#### Version 2.1.0
* Upgrade AWC version to 2.1.0

#### Version 2.0.0
* BREAKING CHANGES: Introduce the Environment type

#### Version 1.3.1
* Fix bug: `CoinPriceProvider` : Return 0 when ucid doesn't exist for a token
* Fix typo: fix method `startTimer` instead of `starTimer` in `CoinPriceNotifier`

#### Version 1.3.0
* BREAKING CHANGES: `TransactionUtil` - Add `apiService` param for each method
* BREAKING CHANGES: Changing the way you load providers: `UcidsTokensProviders` & `CoinPriceProviders` 
* Move coin price management to an infrastructure repository
* Add a generic token model and associated def

#### Version 1.2.14
* Add timestamp in debug logs

#### Version 1.2.13
* Add Bitcoin in ucids_tokens config file

#### Version 1.2.12
* Update dependencies

#### Version 1.2.11
* Add `precision` param in ArchethicOracleUco widget

#### Version 1.2.10
* Update dependencies

#### Version 1.2.9
* Add `TransactionUtil.isSCCallExecuted` method to check is a SC has been executed 

#### Version 1.2.8
* Update dependencies

#### Version 1.2.7
* Update dependencies

#### Version 1.2.6
* Add color params in SingleCard widget

#### Version 1.2.5
* Add description in RPC sign tx method
* Fix PeriodicFuture class

#### Version 1.2.4
* Update dependencies

#### Version 1.2.3
* Migration to flutter 3.22

#### Version 1.2.2
* Update dependencies

#### Version 1.2.1
* refactor: Use archethic_wallet_client 2.0.0

#### Version 1.2.0
* BREAKING CHANGES: Handle custom errors codes/messages in Dart SDK
* UI Adjustements

#### Version 1.1.25
* Add aeEURe mainnet in ucids_tokens config file

#### Version 1.1.24
* `Result` class. Support asynchronous callbacks in map method 

#### Version 1.1.23
* Update dependencies

#### Version 1.1.22
* Fix aeEURe address in ucids_tokens config file

#### Version 1.1.21
* Add aeEURe in ucids_tokens config file

#### Version 1.1.20
* Add token EURe info + coin name fixed

#### Version 1.1.19
* Update Archethic Dart SDK version 3.3.16

#### Version 1.1.18
* Add useUnifyDecimalSeparator param in AmountTextInputFormatter

#### Version 1.1.17
* Adjust logs
 
#### Version 1.1.16
* Fix bugs

#### Version 1.1.15
* VerifiedTokensNotifier & UcidsTokensNotifier init - Add network in param
* Fix bugs

#### Version 1.1.14
* Add new Failures

#### Version 1.1.13
* Add aeETH UCID

#### Version 1.1.12
* Update Archethic Dart SDK version 3.3.15

#### Version 1.1.11
* Add icon param in InProgressCircularStepProgressIndicator Widget
* Fix onPress action when AppButton is disabled

#### Version 1.1.10
* Fix consentement local db management

#### Version 1.1.9
* Fix crash with PopupCloseButton widget

#### Version 1.1.8
* Update Archethic Dart SDK version 3.3.14

#### Version 1.1.7
* Widgets UI Improvements
 
#### Version 1.1.6
* Add UDSC market price (for testnet usage)
* Update Archethic Dart SDK version 3.3.13

#### Version 1.1.5
* Fix legal consentement management

#### Version 1.1.4
* Add legal consentement management

#### Version 1.1.3
* Upgrade dependencies

#### Version 1.1.2
* Improve AmountTextInputFormatter behavior

#### Version 1.1.1
* Upgrade dependencies

#### Version 1.1.0
* Upgrade dependencies (AWC web extension support)

#### Version 1.0.0
* Stable version

#### Version 0.0.9
* Fix responsive
* Fix popup navigation

#### Version 0.0.8
* Upgrade dependencies

#### Version 0.0.7
* Upgrade dependencies

#### Version 0.0.6
* Upgrade dependencies

#### Version 0.0.5
* Get Verified tokens from blockchain

#### Version 0.0.4
* Responsive: Add tools

#### Version 0.0.3
* Fix bug

#### Version 0.0.2
* Migrate to Dart 3.3 and Flutter 3.19
* Upgrade dependencies

#### Version 0.0.1
* First version