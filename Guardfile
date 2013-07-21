# A sample Guardfile
# More info at https://github.com/guard/guard#readme


guard :shell do

  def build_command(files)
   "ghc -fno-code #{files.join(' ')} -isrc -e 'return 0' && cabal build && cabal test"
  end

  watch(%r{.*\.cabal$}) do
    puts `cabal build && cabal test`
    $? == 0
  end

  watch(%r{^Data/.*(?<!flymake)\.hs$}) do |files|
    puts "found source code stuff: #{files.inspect}"
    check_compilation(files) &&
      run_specs(files.collect{|x| spec_for_file(x)}) &&
      `cabal build && cabal test`
  end

  watch(%r{^test/.*(?<!flymake)\.hs$}) do |files|
    run_specs(files.reject{|x| x =~ /dummy.hs/ || x=~ /test\/Spec.hs/})
  end

  def check_compilation(files)
    `ghc -fno-code #{files.join(' ')} -isrc -e 'return 0'`
  end

  def run_specs(tests)
    tests.inject(true) do |result, f|
      puts spec_cmd(f)
      puts `#{spec_cmd(f)}`
      result && $? == 0
    end
  end

  def spec_for_file(file)
    puts "spec_for_file: #{file}"
    test = file.gsub('.hs', 'Spec.hs')
    puts test
    "./test/#{test}"
  end

  def spec_cmd(specfile)
    "ghc -isrc -itest -e 'hspec spec' #{specfile} test/dummy.hs"
  end


end
