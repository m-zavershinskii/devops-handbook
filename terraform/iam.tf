data "aws_iam_policy_document" "assume_eks_role" {
  provider = aws.eu
  statement {
    effect = "Allow"

    principals {
      type        = "Service"
      identifiers = ["eks.amazonaws.com"]
    }

    actions = ["sts:AssumeRole"]
  }
}

resource "aws_iam_role" "eks_role" {
  provider = aws.eu
  name               = "eks-cluster-role"
  assume_role_policy = data.aws_iam_policy_document.assume_eks_role.json
}

resource "aws_iam_role_policy_attachment" "eks_role_cluster_policy" {
  provider = aws.eu
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
  role       = aws_iam_role.eks_role.name
}

###

data "aws_iam_policy_document" "assume_eksnode_role" {
  provider = aws.eu
  statement {
    effect = "Allow"

    principals {
      type        = "Service"
      identifiers = ["ec2.amazonaws.com"]
    }

    actions = ["sts:AssumeRole"]
  }
}

resource "aws_iam_role" "eksnode_role" {
  provider = aws.eu
  name               = "eksnode-cluster-role"
  assume_role_policy = data.aws_iam_policy_document.assume_eksnode_role.json
}

resource "aws_iam_role_policy_attachment" "eks_node_policy" {
  provider = aws.eu
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy"
  role       = aws_iam_role.eksnode_role.name
}

resource "aws_iam_role_policy_attachment" "eks_ecr_policy" {
  provider = aws.eu
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"
  role       = aws_iam_role.eksnode_role.name
}

resource "aws_iam_role_policy_attachment" "eks_cni_policy" {
  provider = aws.eu
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy"
  role       = aws_iam_role.eksnode_role.name
}
