# vpc-peering
Uses terraform and terragrunt to create an aws vpc peering between Europe (Frankfurt) Region and Europe (Paris) Region

	├── terragrunt
	│   ├── peering
	│   │   └── terragrunt.hcl
	│   ├── frankfurt
	│   │   └── vpc
	│   │       └── terragrunt.hcl
	│   └── paris
	│       └── vpc
	│           └── terragrunt.hcl
	└── terraform
	    ├── peering.tf
	    ├── frankfurt
	    │   └── vpc.tf
	    └── paris
	        └── vpc.tf
-   **Deploy Frankfurt VPC**:
    
		cd terragrunt/frankfurt/vpc
		terragrunt apply
    
-   **Deploy Paris VPC**:
    
	    cd terragrunt/paris/vpc
	    terragrunt apply
    
-   **Deploy Peering Connection**:
	
		cd terragrunt/peering
		terragrunt apply
