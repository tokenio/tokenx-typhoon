# Self-hosted Kubernetes assets (kubeconfig, manifests)
module "bootkube" {
  source = "git::https://github.com/tokenio/tokenx-terraform-render-bootkube.git?ref=feature/odic"

  cluster_name          = "${var.cluster_name}"
  api_servers           = ["${format("%s.%s", var.cluster_name, var.dns_zone)}"]
  etcd_servers          = ["${aws_route53_record.etcds.*.fqdn}"]
  asset_dir             = "${var.asset_dir}"
  networking            = "${var.networking}"
  network_mtu           = "${var.network_mtu}"
  pod_cidr              = "${var.pod_cidr}"
  service_cidr          = "${var.service_cidr}"
  cluster_domain_suffix = "${var.cluster_domain_suffix}"
  cloud_provider        = "aws"
  cluster_id = "${var.cluster_id}"
  admin_role_arns = "${var.admin_role_arns}"
  enable_reporting      = "${var.enable_reporting}"
  odic_url = "${var.odic_url}"
  odic_client_id = "${var.odic_client_id}"
  odic_user_claim = "${var.odic_user_claim}"
  odic_groups_claim = "${var.odic_groups_claim}"
}
