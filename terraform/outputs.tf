output "external_ip_address_apps" {
  value = yandex_compute_instance.app.*.network_interface.0.nat_ip_address
}
output "external_ip_address_balancer" {
  value = tolist(tolist(yandex_lb_network_load_balancer.reddit-balancer.listener).0.external_address_spec).0.address
}
