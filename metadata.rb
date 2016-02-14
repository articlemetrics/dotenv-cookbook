name              "dotenv"
maintainer        "Martin Fenner"
maintainer_email  "mfenner@datacite.org"
license           "Apache 2.0"
description       "Installs dotenv gem and reads ENV variables"
long_description  IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version "1.0.2"

%w{ ubuntu }.each do |platform|
  supports platform
end
