
#时间：2019年1月4日 周五

Pod::Spec.new do |s|
  s.name         = "GGPods"
  s.version      = "1.0.0"
  s.summary      = "自建管理第三方库"
  s.description  = "自建管理第三方库"
  s.author    = "lignpeng"
  s.license      = { :type => "Apache License", :file => "LICENSE" }
  s.homepage     = "https://github.com/lignpeng/GGPods"   #代码仓库主页
  s.source       = { :git => "git@github.com:lignpeng/GGPods.git", :branch => "master" }

  s.platform     = :ios, "8.0"  #平台及最低支持版本
  s.ios.deployment_target = '8.0'
  #用到的第三方库
  s.subspec 'Masonry' do |ss|
    ss.dependency 'Masonry', '0.6.4'
  end

  s.subspec 'JSONModel' do |ss|
    ss.dependency 'JSONModel', '1.6.0'
  end

  s.subspec 'AFNetworking' do |ss|
    ss.dependency 'AFNetworking', '3.1.0'
  end
end
