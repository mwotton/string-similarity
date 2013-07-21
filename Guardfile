# A sample Guardfile
# More info at https://github.com/guard/guard#readme


guard :shell do

#  def build_command(files)
#    "ghc -fno-code #{files.join(' ')} -isrc -e 'return 0' && cabal build && cabal test"
#  end
#  watch(%r{.*\.cabal$}) do
#    `cabal build && cabal test`
#  end

#  watch(%r{src/.*(?<!flymake)\.hs$}) do |files|
#    `#{build_command(files)}`
#  end

  watch(%r{test/.*(?<!flymake)\.hs$}) do |files|
    cmd = files.collect do |f|
      "ghc -isrc -itest -e 'hspec spec' #{f} test/dummy.hs"
    end.join(' && ')
    `#{cmd}`
  end

end
