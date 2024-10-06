resource "aws_iam_role_policy_attachment" "tfer--AWSServiceRoleForAppRunner_AppRunnerServiceRolePolicy" {
  policy_arn = "arn:aws:iam::aws:policy/aws-service-role/AppRunnerServiceRolePolicy"
  role       = "AWSServiceRoleForAppRunner"
}

resource "aws_iam_role_policy_attachment" "tfer--AWSServiceRoleForOrganizations_AWSOrganizationsServiceTrustPolicy" {
  policy_arn = "arn:aws:iam::aws:policy/aws-service-role/AWSOrganizationsServiceTrustPolicy"
  role       = "AWSServiceRoleForOrganizations"
}

resource "aws_iam_role_policy_attachment" "tfer--AWSServiceRoleForSSO_AWSSSOServiceRolePolicy" {
  policy_arn = "arn:aws:iam::aws:policy/aws-service-role/AWSSSOServiceRolePolicy"
  role       = "AWSServiceRoleForSSO"
}

resource "aws_iam_role_policy_attachment" "tfer--AWSServiceRoleForSupport_AWSSupportServiceRolePolicy" {
  policy_arn = "arn:aws:iam::aws:policy/aws-service-role/AWSSupportServiceRolePolicy"
  role       = "AWSServiceRoleForSupport"
}

resource "aws_iam_role_policy_attachment" "tfer--AWSServiceRoleForTrustedAdvisor_AWSTrustedAdvisorServiceRolePolicy" {
  policy_arn = "arn:aws:iam::aws:policy/aws-service-role/AWSTrustedAdvisorServiceRolePolicy"
  role       = "AWSServiceRoleForTrustedAdvisor"
}

resource "aws_iam_role_policy_attachment" "tfer--KinesisFirehoseServiceRole-food-data-fir-eu-west-2-1728169057153_KinesisFirehoseServicePolicy-food-data-firehose-eu-west-2" {
  policy_arn = "arn:aws:iam::831926620846:policy/service-role/KinesisFirehoseServicePolicy-food-data-firehose-eu-west-2"
  role       = "KinesisFirehoseServiceRole-food-data-fir-eu-west-2-1728169057153"
}

resource "aws_iam_role_policy_attachment" "tfer--my-food-stream-lambda-function-role-3rz0f9wc_AWSLambdaBasicExecutionRole-aa3b4322-a86f-490c-aa90-f53186d18cad" {
  policy_arn = "arn:aws:iam::831926620846:policy/service-role/AWSLambdaBasicExecutionRole-aa3b4322-a86f-490c-aa90-f53186d18cad"
  role       = "my-food-stream-lambda-function-role-3rz0f9wc"
}
