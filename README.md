To list manually created VPC tags from Terraform and save them to a text file, you can follow these steps. This involves using Terraform to retrieve the VPC tags and output them to a file.

### Step-by-Step Guide

#### Step 1: Configure Terraform

Create or update your `main.tf` file to include the AWS provider and a data source to fetch your VPC tags.

```hcl
provider "aws" {
  region = "us-east-1"  # Change to your desired region
}

# Fetch details of the specified VPC
data "aws_vpc" "my_vpc" {
  id = "vpc-xxxxxxxx"  # Replace with your actual VPC ID
}

# Output the VPC tags
output "vpc_tags" {
  value = data.aws_vpc.my_vpc.tags
}
```

#### Step 2: Create a Script to Write Tags to a File

Create a script to run Terraform commands and write the output to a text file. Here’s an example using a Bash script:

##### Bash Script Example

Create a file named `list_vpc_tags.sh`:

```bash
#!/bin/bash

# Initialize Terraform
terraform init

# Apply the configuration to fetch the tags
terraform apply -auto-approve

# Capture the output and write to a text file
terraform output -json vpc_tags | jq -r 'to_entries | .[] | "\(.key)=\(.value)"' > vpc_tags.txt

echo "VPC tags have been written to vpc_tags.txt"
```

#### Step 3: Run the Script

Make the script executable and run it:

```bash
chmod +x list_vpc_tags.sh
./list_vpc_tags.sh
```

### Notes

1. **Install `jq`**: The script uses `jq` to format the JSON output. Make sure you have `jq` installed. You can install it using a package manager like `apt`, `brew`, or `yum`.

2. **Adjust VPC ID**: Replace `"vpc-xxxxxxxx"` in the `main.tf` file with your actual VPC ID.

3. **Output Format**: The tags will be formatted as `key=value`, making them easy to read.

### Example Output

After running the script, you should see a file named `vpc_tags.txt` containing your VPC tags in the format:

```
Name=MyVPC
Environment=Production
Project=Website
Owner=TeamA
```

This approach will help you retrieve the manually created VPC tags from Terraform and save them to a text file efficiently!



![image](https://github.com/user-attachments/assets/c8c854e5-fe71-4c5b-b74f-6637db411713)
![image](https://github.com/user-attachments/assets/1831a4c6-71d8-46ab-84cd-973b1bca2fad)
![image](https://github.com/user-attachments/assets/56dff905-b216-4f42-9a73-2020c9226c24)
![image](https://github.com/user-attachments/assets/edc03671-d59b-4814-88fb-1a2190fe1ae0)

