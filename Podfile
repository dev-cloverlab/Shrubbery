# open source
source 'https://github.com/CocoaPods/Specs.git'

platform :ios, '10.0'
use_frameworks!

target 'shrubbery' do
  pod 'Alamofire', '~> 4.6'

  pod 'RxSwift', '~> 4.0'
  pod 'RxCocoa', '~> 4.0'

  pod 'SwiftyJSON', '~> 4.0.0'

  target 'shrubberyTests' do
    inherit! :search_paths
    pod 'RxBlocking', '~> 4.0'
    pod 'RxTest', '~> 4.0'
  end
  target 'shrubberyUITests' do
    inherit! :search_paths
    # Pods for testing
  end
end
