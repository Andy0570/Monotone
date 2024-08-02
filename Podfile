# Uncomment the next line to define a global platform for your project
platform :ios, '12.0'

target 'Monotone' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

  # Pods for Monotone
  pod 'RxSwift', '~> 6.7.1'
  pod 'RxCocoa', '~> 6.7.1'
  pod 'Action', '~> 5.0.0'
  pod 'RxDataSources', '~> 5.0.0' # UITableView 和 UICollectionView 数据源
  pod 'RxSwiftExt', '~> 6.2.1' # <https://github.com/RxSwiftCommunity/RxSwiftExt>
  pod 'Alamofire', '~> 5.9.1'
  pod 'SwiftyJSON', '~> 5.0.2'
  pod 'ObjectMapper', '~> 4.2.0'
  pod 'Kingfisher', '~> 7.12.0'
  pod 'SnapKit', '~> 5.7.1'
  pod 'Hue', '~> 5.0.0'
  pod 'anim', '~> 1.2.10' # 页面内动画
  pod 'ViewAnimator', '~> 3.1.0' # 页面转场动画
  # pod 'Hero'
  pod 'BEMCheckBox', '~> 1.4.1'
  pod 'SwiftMessages', '~> 9.0.9'
  pod 'MJRefresh', '~> 3.7.9'
  pod 'NVActivityIndicatorView', '~> 5.2.0' # <https://github.com/ninjaprox/NVActivityIndicatorView>
  pod 'HMSegmentedControl', '~> 1.5.6' # <https://github.com/HeshamMegid/HMSegmentedControl>

end

# 更改所有第三方框架 Target 版本
post_install do |installer|
    installer.pods_project.targets.each do |target|
        target.build_configurations.each do |config|
            config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '12.0'
        end
    end
end
