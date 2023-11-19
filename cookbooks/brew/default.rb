execute 'brew bundle' do
  command <<~EOF
    brew bundle --file=#{File.join(File.expand_path('..', __FILE__), 'files', 'Brewfile')}
  EOF
end
