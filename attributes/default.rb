default[:user] = {
  name: "vagrant",
  home: "/home/vagrant"
};

default[:anyenv] = {
  "perl"    => {
    versions:   %w{5.18.1},
    global:     "5.18.1"
  },

  "ruby"    => {
    versions:   %w{2.0.0-p247},
    global:     "2.0.0-p247"
  },

  "node"    => {
    versions:  %w{v0.10.17},
    global:    "v0.10.17"
  },

  "python"  => {
    versions:   %w{2.7.5},
    global:     "2.7.5"
  },

# not to work...
#  "php"     => {
#    versions:   %w{5.5.1 5.3.27},
#    global:     "5.5.1"
#  }
};

