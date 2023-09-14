job "example" {
  datacenters = ["dc1"]
  namespace = "test"

  group "cache" {
    network {
      port "db" {
        to = 6379
      }
    }

    task "redis" {
      driver = "docker"

      config {
        image          = "redis:6"
        ports          = ["db"]
        auth_soft_fail = true
      }
  }
}
}