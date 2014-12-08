
node 'docker-py-demo' {
  class { "docker-demo":
     user => "demo"
   }
}
