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
    tests = files.reject{|x| x =~ /dummy.hs/ || x=~ /test\/Spec.hs/}
    tests.inject(true) do |result, f|
      puts f
      cmd="ghc -isrc -itest -e 'hspec spec' #{f} test/dummy.hs"
      puts cmd
      puts `#{cmd}`

      result && $? == 0
    end

  end

end
