
node 'demo-VirtualBox' {
  class { "docker-demo":
     user => "demo"
   }
}
