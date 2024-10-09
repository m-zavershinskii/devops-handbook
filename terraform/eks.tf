resource "aws_eks_cluster" "eu_eks_cluster" {
  provider = aws.eu

  name     = "eu-eks-cluster"
  role_arn = aws_iam_role.eks_role.arn

  vpc_config {
    endpoint_private_access = true
    endpoint_public_access = true
    subnet_ids = [module.eu_vpc.subnet_a_id, module.eu_vpc.subnet_b_id, module.eu_vpc.subnet_c_id]
  }

  kubernetes_network_config {
    service_ipv4_cidr = "192.168.0.0/24"
  }

  depends_on = [
    aws_iam_role_policy_attachment.eks_role_cluster_policy
  ]
}

resource "aws_eks_addon" "eks_vpc_cni" {
  provider = aws.eu

  cluster_name = aws_eks_cluster.eu_eks_cluster.name
  addon_name   = "vpc-cni"
}

#resource "aws_eks_addon" "eks_coredns" {
#  provider = aws.eu
#
#  cluster_name = aws_eks_cluster.eu_eks_cluster.name
#  addon_name   = "coredns"
#}

resource "aws_eks_addon" "eks_kube_proxy" {
  provider = aws.eu

  cluster_name = aws_eks_cluster.eu_eks_cluster.name
  addon_name   = "kube-proxy"
}

#output "endpoint" {
#  value = aws_eks_cluster.eu_eks_cluster.endpoint
#}
#
#output "kubeconfig-certificate-authority-data" {
#  value = aws_eks_cluster.eu_eks_cluster.certificate_authority[0].data
#}
