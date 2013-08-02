#
# Cookbook Name:: anyenv
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

# install required packages
install_packages = %w{
  make
  curl
  libsqlite3-dev
  libbz2-dev
}

install_packages.each do |p|
  package p do
    action :install
  end
end

# install anyenv
bash "anyenv" do
  user node[:user][:name]
  cwd  node[:user][:home]
  environment "HOME" => node[:user][:home]

  code <<-EOC
    git clone https://github.com/riywo/anyenv $HOME/.anyenv
    echo 'export PATH="$HOME/.anyenv/bin:$PATH"' >> $HOME/.bashrc
    echo 'eval "$(anyenv init -)"' >> $HOME/.bashrc
  EOC
  not_if { File.exist?("$HOME/.anyenv") }
end

# install *env
anyenvs = %w{plenv ndenv rbenv pyenv phpenv}
anyenvs.each do |install_env|
  bash install_env do
    user node[:user][:name]
    cwd node[:user][:home]
    environment "HOME" => node[:user][:home]

    code <<-EOC
      export PATH="$HOME/.anyenv/bin:$PATH"
      eval "$(anyenv init -)"
      anyenv install #{install_env}
    EOC
    not_if { File.exist?("#{node[:user][:home]}/.anyenv/envs/#{install_env}") }
  end
end

# install program
anyenv_map = {
  "perl" =>   "plenv",
  "ruby" =>   "rbenv",
  "node" =>   "ndenv",
  "python" => "pyenv",
  "php" =>    "phpenv",
}
anyenv_map.keys.each do |program|
  anyenv = node[:anyenv]
  next unless anyenv.key?(program)
  anyenv[program][:versions].each do |version|
    install_script = <<-EOC
      export PATH="$HOME/.anyenv/bin:$PATH"
      eval "$(anyenv init -)"
      #{anyenv_map[program]} install #{version};
    EOC

    # set global
    install_script << "#{anyenv_map[program]} global #{version};" if version == anyenv[program][:global]

    bash "#{program} - #{version}" do
      user node[:user][:name]
      cwd node[:user][:home]
      environment "HOME" => node[:user][:home]
      code install_script
      not_if { File.exist?("#{node[:user][:home]}/.anyenv/envs/#{anyenv_map[program]}/versions/#{version}") }
    end
  end
end
