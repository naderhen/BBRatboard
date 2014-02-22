if RUBY_VERSION < "1.9"
  require "rubygems"
  require "faster_csv"
  CSV = FCSV
else
  require "csv"
end
