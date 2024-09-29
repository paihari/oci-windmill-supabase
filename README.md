# oci-windmill-supabase
Windmill hosting on OCI, Supabase SaaS


docker run --name pgadmin-container -p 82:80 -e PGADMIN_DEFAULT_EMAIL=hari@me.com -e PGADMIN_DEFAULT_PASSWORD=chnageme -d dpage/pgadmin4

https://windmill.simplificare.ch

postgresql://postgres:changeme@130.61.80.238:5432/windmill?sslmode=disable


I will pass the compartment id.

I need VCN named WindmillVCN
Public Subnet named WindmillSubnet
Private Subnet named PostgresSubnet

And the compoments that comes with VCN Wizard Create VCN with Internet Connectivity

Gateways
NAT gateway
Internet gateway
Service gateway

Security lists

Name: default security list
Name: security list for private subnet

Route tables

Name: default route table
Name: route table for private subnet-cool

The output should contain the VCN id, subet ids

Give the pythin code




