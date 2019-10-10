[
  'base',
  'apps',
  'brewfile'
].each do |file|
  execute 'brew bundle' do
    command <<-"EOF"
      brew bundle --file=#{File.join(File.expand_path('..', __FILE__), 'files', file)}
    EOF
  end
end
