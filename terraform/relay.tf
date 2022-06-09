resource "local_file" "relay" {
  content = <<-DOC
    {
        "MaxPeerCount": "100",
        "PeerAddress": "${yandex_compute_instance.vm_for_each["aspia.mgexp.yc"].network_interface.0.nat_ip_address}",
        "PeerIdleTimeout": "5",
        "PeerPort": "8070",
        "RouterAddress": "localhost",
        "RouterPort": "8060",
        "RouterPublicKey": ""
    }
    DOC
  filename = "../playbook/templates/relay.json"

  depends_on = [
    local_file.inventory
  ]
}