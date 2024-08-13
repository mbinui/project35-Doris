resource "aws_iam_role" "eks-cluster" {
  name = "eks-cluster-${var.cluster_name}"

  assume_role_policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Service": "eks.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
POLICY
}

resource "aws_iam_role_policy_attachment" "amazon-eks-cluster-policy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
  role       = aws_iam_role.eks-cluster.name
}

resource "aws_iam_policy" "ecr-access-policy" {
  name        = "ECR-Access-Policy"
  description = "Allows access to ECR repositories"

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect   = "Allow",
        Action   = [
          "ecr:GetDownloadUrlForLayer",
          "ecr:BatchGetImage",
          "ecr:BatchCheckLayerAvailability"
        ],
        Resource = "arn:aws:ecr:us-east-2:339713077528:repository/my-repo"
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "ecr-access-attachment" {
  role       = aws_iam_role.eks-cluster.name
  policy_arn = aws_iam_policy.ecr-access-policy.arn
}



resource "aws_eks_cluster" "cluster" {
  name     = var.cluster_name
  version  = var.cluster_version
  role_arn = aws_iam_role.eks-cluster.arn

  vpc_config {
    subnet_ids = [
      aws_subnet.private-us-east-2a.id,
      aws_subnet.private-us-east-2b.id,
      aws_subnet.public-us-east-2a.id,
      aws_subnet.public-us-east-2b.id
    ]
  }

   depends_on = [
    aws_iam_role_policy_attachment.amazon-eks-cluster-policy,
    aws_iam_role_policy_attachment.ecr-access-attachment
  ]
}

output "cluster_name" {
  description = "Output for cluster-name"
  value       = aws_eks_cluster.cluster.name
}

