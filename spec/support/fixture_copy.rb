def read_fixture_file(filename)
  IO.read(File.join(File.dirname(__FILE__), '../fixtures', filename))
end

def write_fixture_file(filename, content)
  File.open(filename, 'w') { |f| f.write(content) }
end

def create_horatio_json
  File.open('horatio.json', 'w') { |f| f.write({name: 'docker-project', version: '0.0.1'}.to_json) }
end

def create_maven_pom
  write_fixture_file('pom.xml', read_fixture_file('pom.xml'))
end

def create_ruby_gemspec
  write_fixture_file('test.gemspec', read_fixture_file('test.gemspec'))
end

def create_package_json
  write_fixture_file('package.json', read_fixture_file('package.json'))
end

def create_gem_version
  FileUtils.mkdir_p('lib/test')
  File.open('lib/test/version.rb', 'w') { |f| f.write("module\n0.0.5\nend") }
end
