resource "google_redis_instance" "dify_redis" {
  name              = "dify-redis"
  tier              = "BASIC"
  memory_size_gb    = 1
  region            = var.region
  project           = var.project_id
  redis_version     = "REDIS_6_X"
  reserved_ip_range = "10.0.1.0/29"

  authorized_network = var.vpc_network_name

  // disable read replicas in development
  read_replicas_mode = "READ_REPLICAS_DISABLED"
  replica_count      = 0
}

output "redis_host" {
  value = google_redis_instance.dify_redis.host
}

output "redis_port" {
  value = google_redis_instance.dify_redis.port
}
