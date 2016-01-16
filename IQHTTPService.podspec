Pod::Spec.new do |s|
	s.name = "IQHTTPService"
	s.version = "1.0.0"
	s.summary = "Asynchronous REST API Client with ease."
	s.homepage = "https://github.com/hackiftekhar/IQHTTPService"
	s.screenshots = "https://raw.githubusercontent.com/hackiftekhar/IQHTTPService/master/Screenshot/Screenshot.png"
	s.license = 'MIT'
	s.author = { "Iftekhar Qurashi" => "hack.iftekhar@gmail.com" }
	s.platform = :ios, '6.0'
	s.source = { :git => "https://github.com/hackiftekhar/IQHTTPService.git", :tag => "v1.0.0" }
	s.source_files = 'Classes', 'IQHTTPService/*.{h,m}'
    s.dependency 'IQURLConnection', '1.0.0'
	s.requires_arc = true
end
