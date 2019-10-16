Install-PackageProvider -Force ChocolateyGet

$packageList = @(
  'GoogleChrome',
  'VisualStudioCode',
  'jetbrainstoolbox',
  'slack',
  'google-drive-file-stream',
  'SourceTree'
)
$packageList | %{Install-Package -Force -Name $_ -Provider ChocolateyGet}
