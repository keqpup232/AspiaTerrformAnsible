resource "local_file" "inventory" {
  content = <<-DOC
    ---
    aspia:
      hosts:
        node-aspia-router-relay:
          ansible_host: ${yandex_compute_instance.vm_for_each["aspia.mgexp.yc"].network_interface.0.nat_ip_address}
    DOC
  filename = "../playbook/inventory/prod.yml"

  depends_on = [
    yandex_compute_instance.vm_for_each
  ]
}