include ActionDispatch::TestProcess

Factory.define :plist do |f|
  f.filename "com.liquid-launch.sample.plist"
  f.executable "/bin/echo"
  f.argument_1 "first"
  f.argument_2 "second"
  f.argument_3 "third"
  f.argument_4 "fourth"
  f.argument_5 "fifth"
  f.month "1" #January
  f.weekday "1" #Monday
  f.hour "1" #1AM
  f.minute "30" #:30
end