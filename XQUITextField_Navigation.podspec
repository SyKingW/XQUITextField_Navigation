Pod::Spec.new do |s|
    
    s.name         = "XQUITextField_Navigation"      #SDK名称
    s.version      = "0.1"#版本号
    s.homepage     = "https://github.com/SyKingW/XQUITextField_Navigation"  #工程主页地址
    s.summary      = "对 UITextView+Placeholder 的一些封装"  #项目的简单描述
    s.license     = "MIT"  #协议类型
    s.author       = { "sinking" => "1034439685@qq.com" } #作者及联系方式
    
    s.osx.deployment_target  = '10.13'
    s.ios.deployment_target  = "9.3" #平台及版本
    
    s.source       = { :git => "https://github.com/SyKingW/XQUITextField_Navigation", :tag => "#{s.version}"}   #工程地址及版本号
    
    s.requires_arc = true   #是否必须arc

    s.source_files = 'SDK/**/*.{swift}'    

#    s.swift_version = '5.0'
    
    s.dependency 'UITextField-Navigation'


end

