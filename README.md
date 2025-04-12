# AWS Transfer Family in action: Hosting files with sFTP and Terraform (real case study)

![image](https://github.com/user-attachments/assets/cf301e12-f2f6-4fff-8dd9-0bb7ed4010fd)

This project shows how to create an SFTP server on AWS using Terraform and the AWS Transfer Family. It includes key generation, FileZilla configuration, and S3 integration for file uploads.

## Terraform Graph

![image](https://github.com/user-attachments/assets/4657a5c9-f1a7-408d-8444-595c6dfee385)

## Files

- **main.tf**: defines the provider and a local variable for general purposes

- **main_random.tf**: I love random naming conventions. In this case, I'm using the random_pet and random_string resources

- **main_transfer_server.tf**: this file contains the aws_transfer_server and aws_transfer_user resources

- **main_s3.tf**: defines the aws_s3_bucket and aws_s3_object resources

- **main_ssh_key.tf**: here I create the SSH key used for sFTP access

- **main_iam_role.tf**: if you don’t set up IAM correctly, you won’t be able to use the solution

- **main_ftp_connector_filezilla_xml.tf**: I’m lazy and don’t want to explain how to connect to an sFTP server, so I just upload a FileZilla importable file to the bucket


## More details

You'll find the high-level explanation on my blog in the post 

- [AWS Transfer Family in action: Hosting files with sFTP and Terraform (real case study)](https://blog.devandreacarratta.it/en/aws-transfer-family-terraform/?utm_source=github&utm_medium=cloud-development&utm_campaign=terraform&utm_content=aws-transfer-family-terraform)

Have a good cloud day!

## License
This project is licensed under the MIT License. Use at your own risk. 
- If something breaks, it's your problem. 😆
- If it costs you money, that's still your problem. 💸

  
