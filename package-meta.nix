let
  packageName = "myapp";

  versionString = "1.2.3";
in
{
  description = "The ${packageName} web server, version ${versionString}";

  nginxConfig = ''
    server {
      listen 80;
      server_name ${packageName}.example.com;
      root /var/www/${packageName};
    }
  '';
}
