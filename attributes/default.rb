default[:user] = {
  name: "vagrant",
  home: "/home/vagrant"
};

default[:anyenv] = {
  "perl"    => {
    versions:   %w{5.18.0},
    global:     "5.18.0"
  },

  "ruby"    => {
    versions:   %w{2.0.0-p247},
    global:     "2.0.0-p247"
  },

  "node"    => {
    versions:  %w{v0.10.15},
    global:    "v0.10.15"
  },

  "python"  => {
    versions:   %w{3.3.2},
    global:     "3.3.2"
  },

# not to work...
#  "php"     => {
#    versions:   %w{5.5.1 5.3.27},
#    global:     "5.5.1"
#  }
};

