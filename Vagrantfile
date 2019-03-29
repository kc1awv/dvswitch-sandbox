require "net/http"

def url_exist?(url_string,user,pass)
  uri = URI.parse(url_string)
  http = Net::HTTP.new(uri.host, uri.port)
  http.use_ssl = (uri.scheme == 'https')
  req = Net::HTTP::Head.new(uri.request_uri)
  req.basic_auth(user,pass)
  res = http.request(req)
  res.code == "200" # false if return 200
rescue Errno::ENOENT
  false # false if can't find the server
end

Vagrant.configure("2") do |config|
  envvars = { }

  sandbox_type = "core"
  config.vm.define "dvswitch-sandbox", default: true, autostart:true do |sandbox|
    # bento debian jessie box
    sandbox.vm.box = "bento/debian-9.6"
    sandbox.vm.hostname = "dvswitch-sandbox"
    sandbox.vm.provider "virtualbox" do |vb, vboxoverride|
      vb.cpus = 2
      vb.memory = 4096
      vb.name = "dvswitch-sandbox"
    end
    sandbox.vm.synced_folder "./files", "/vagrant_files"
    sandbox.vm.provision :shell do |s|
      envars||={}
      envvars['SANDBOX_DVSWITCH']=ENV['SANDBOX_DVSWITCH']
      s.env = envvars
      s.path = "./provision/setup.sh"
    end
  end
end
