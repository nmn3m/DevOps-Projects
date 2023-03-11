# creating assume role for EC2 to access resources in our infrastructure.
# assume role use STS api that return termporary security credentials.
resource "aws_iam_role" "ec2-role" {
  name = "ec2_instance_role"

  # Terraform's "jsonencode" function converts 
  # Terraform expression result to valid JSON syntax.
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Sid    = ""
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      },
    ]
  })

  tags = {
    Name = "AWS assume role"
  }
}

# Creating I'm policy for the role of EC2
resource "aws_iam_policy" "ec2-policy" {
  name = "ec2_policy"
  # role = aws_iam_role.ec2-role.id

  # Terraform's "jsonencode" function converts a
  # Terraform expression result to valid JSON syntax.
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = [
          "ec2:Describe*",
        ]
        Effect   = "Allow"
        Resource = "*"
      },
    ]
  })
}

# attach i'm policy to i'm role
    resource "aws_iam_role_policy_attachment" "test-attach" {
        role       = aws_iam_role.ec2-role.name
        policy_arn = aws_iam_policy.ec2-policy.arn
    }

# to attach role and his policy to instance we use instance profile
resource "aws_iam_instance_profile" "ec2-instance-profile" {
  name = "ec2-im-instance-profile"
  role = aws_iam_role.ec2-role.name
}

