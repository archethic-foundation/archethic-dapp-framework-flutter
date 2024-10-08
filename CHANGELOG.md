## Version 3.0.0
* Use Logging library for [LogManager]

### Breaking changes
* [LogManager.logsActived] replaced by [LogManager.remoteLogsEnabled]

## 2.1.3
* Upgrade archethic_wallet_client to 2.1.3

## 2.1.2
* Upgrade package_info_plus to 8.0.2
* Add textStyle param in Consent Widgets
 
## 2.1.1
* Upgrade AWC version to 2.1.2

## 2.1.0
* Upgrade AWC version to 2.1.0

## 2.0.0
* BREAKING CHANGES: Introduce the Environment type

## 1.3.1
* Fix bug: `CoinPriceProvider` : Return 0 when ucid doesn't exist for a token
* Fix typo: fix method `startTimer` instead of `starTimer` in `CoinPriceNotifier`

## 1.3.0
* BREAKING CHANGES: `TransactionUtil` - Add `apiService` param for each method
* BREAKING CHANGES: Changing the way you load providers: `UcidsTokensProviders` & `CoinPriceProviders` 
* Move coin price management to an infrastructure repository
* Add a generic token model and associated def

## 1.2.14
* Add timestamp in debug logs

## 1.2.13
* Add Bitcoin in ucids_tokens config file

## 1.2.12
* Update dependencies

## 1.2.11
* Add `precision` param in ArchethicOracleUco widget

## 1.2.10
* Update dependencies

## 1.2.9
* Add `TransactionUtil.isSCCallExecuted` method to check is a SC has been executed 

## 1.2.8
* Update dependencies

## 1.2.7
* Update dependencies

## 1.2.6
* Add color params in SingleCard widget

## 1.2.5
* Add description in RPC sign tx method
* Fix PeriodicFuture class

## 1.2.4
* Update dependencies

## 1.2.3
* Migration to flutter 3.22

## 1.2.2
* Update dependencies

## 1.2.1
* refactor: Use archethic_wallet_client 2.0.0

## 1.2.0
* BREAKING CHANGES: Handle custom errors codes/messages in Dart SDK
* UI Adjustements

## 1.1.25
* Add aeEURe mainnet in ucids_tokens config file

## 1.1.24
* `Result` class. Support asynchronous callbacks in map method 

## 1.1.23
* Update dependencies

## 1.1.22
* Fix aeEURe address in ucids_tokens config file

## 1.1.21
* Add aeEURe in ucids_tokens config file

## 1.1.20
* Add token EURe info + coin name fixed

## 1.1.19
* Update Archethic Dart SDK version 3.3.16

## 1.1.18
* Add useUnifyDecimalSeparator param in AmountTextInputFormatter

## 1.1.17
* Adjust logs
 
## 1.1.16
* Fix bugs

## 1.1.15
* VerifiedTokensNotifier & UcidsTokensNotifier init - Add network in param
* Fix bugs

## 1.1.14
* Add new Failures

## 1.1.13
* Add aeETH UCID

## 1.1.12
* Update Archethic Dart SDK version 3.3.15

## 1.1.11
* Add icon param in InProgressCircularStepProgressIndicator Widget
* Fix onPress action when AppButton is disabled

## 1.1.10
* Fix consentement local db management

## 1.1.9
* Fix crash with PopupCloseButton widget

## 1.1.8
* Update Archethic Dart SDK version 3.3.14

## 1.1.7
* Widgets UI Improvements
 
## 1.1.6
* Add UDSC market price (for testnet usage)
* Update Archethic Dart SDK version 3.3.13

## 1.1.5
* Fix legal consentement management

## 1.1.4
* Add legal consentement management

## 1.1.3
* Upgrade dependencies

## 1.1.2
* Improve AmountTextInputFormatter behavior

## 1.1.1
* Upgrade dependencies

## 1.1.0
* Upgrade dependencies (AWC web extension support)

## 1.0.0
* Stable version

## 0.0.9
* Fix responsive
* Fix popup navigation

## 0.0.8
* Upgrade dependencies

## 0.0.7
* Upgrade dependencies

## 0.0.6
* Upgrade dependencies

## 0.0.5
* Get Verified tokens from blockchain

## 0.0.4
* Responsive: Add tools

## 0.0.3
* Fix bug

## 0.0.2
* Migrate to Dart 3.3 and Flutter 3.19
* Upgrade dependencies

## 0.0.1
* First version