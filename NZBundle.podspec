Pod::Spec.new do |s|
  s.name         = 'NSUserDefaults-AESEncryptor'
  s.version      = '0.0.1'
  s.summary    = 'Save user data using AES encryption'
  s.author = {
	'Bruno Tortato Furtado' => 'bruno.furtado@gruponzn.com'
  }
  s.source = {
	:git => 'https://github.com/NZN/NSUserDefaults-AESEncryptor.git',
	:tag => '0.0.1'
  }
  s.source_files = 'NSUserDefaults-AESEncryptor/*.{h,m}'
  s.dependency 'CocoaSecurity'
end