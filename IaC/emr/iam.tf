resource "aws_iam_role" "emr_service_role" {
  name = "${var.project}emr-service-role-${var.env}"  
  tags = var.tags  

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect    = "Allow"
        Principal = {
          Service = "elasticmapreduce.amazonaws.com"  
        }
        Action = "sts:AssumeRole"  
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "erm_service_role_policy" {
    role = aws_iam_role.emr_service_role.id
    policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonElasticMapReduceRole"
}

resource "aws_iam_role" "emr_profile_role" {
  name = "${var.project}emr-service-role-${var.env}"  
  tags = var.tags  

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect    = "Allow"
        Principal = {
          Service = "ec2.amazonaws.com"  
        }
        Action = "sts:AssumeRole"  
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "erm_profile_role_policy" {
    role = aws_iam_role.emr_service_role.id
    policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonElasticMapReduceforEC2Role"
}

resource "aws_iam_instance_profile" "emr_ec2_instace_profile" {
    name = "${var.project}-emr-ec2-profile-${var.env}"
    role = aws_iam_role.emr_profile_role.name
}