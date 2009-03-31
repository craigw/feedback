require 'spec/rake/spectask'

task :default => :spec

desc "Test code behaves like specification examples"
Spec::Rake::SpecTask.new do |t|
  t.spec_opts = ['--options', "\"#{File.dirname(__FILE__)}/spec/spec.opts\""]
  t.spec_files = FileList['spec/**/*/*_spec.rb']
end

namespace :spec do
  desc "Test code behaves like specification examples and check code coverage"
  Spec::Rake::SpecTask.new(:rcov) do |t|
    t.spec_opts = ['--options', "\"#{File.dirname(__FILE__)}/spec/spec.opts\""]
    t.spec_files = FileList['spec/**/*/*_spec.rb']
    t.rcov = true
    t.rcov_opts = lambda do
      IO.readlines("#{File.dirname(__FILE__)}/spec/rcov.opts").map {|l| l.chomp.split " "}.flatten
    end
  end

  Dir[File.dirname(__FILE__) + "/spec/*"].each do |sub|
    desc "Run the code examples in spec/#{File.basename(sub)}"
    Spec::Rake::SpecTask.new(File.basename(sub)) do |t|
      t.spec_opts = ['--options', "\"#{File.dirname(__FILE__)}/spec/spec.opts\""]
      t.spec_files = FileList["spec/#{File.basename(sub)}/**/*_spec.rb"]
    end
  end
end
