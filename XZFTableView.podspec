

Pod::Spec.new do |s|



  s.name         = "XZFTableView"
  s.version      = "0.0.1"
  s.summary      = "vertical TableView "
  s.description  = <<-DESC   

				vertical Tableview
                   DESC
  s.platform     = :ios

  s.homepage     = "https://github.com/GG-beyond/XZFTableView"

  s.license      = "MIT"
 
  s.author             = { "GG-beyond" => "872608550@qq.com" }
  s.source       = { :git => "https://github.com/GG-beyond/XZFTableView.git", :tag => "0.0.1" }
 

  s.source_files  = "XZFTableView/*.{h,m}"
  s.exclude_files = "Classes/Exclude"


end
